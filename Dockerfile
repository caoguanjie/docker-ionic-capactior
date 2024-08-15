FROM beevelop/android:v2023.12.1

# LABEL: 镜像作者：姓名+邮箱
LABEL  caoguanjie [caogj@fits.com.cn]

# ENV: 构建的时候设置环境变量
ENV NODE_VERSION=node_18.x \
    IONIC_VERSION=7.2.0


RUN apt-get update && apt-get install -y curl gnupg2 lsb-release && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    apt-key fingerprint 1655A0AB68576280 && \
    export VERSION=${NODE_VERSION} && \
    export DISTRO="$(lsb_release -s -c)" && \
    echo "deb https://deb.nodesource.com/$VERSION $DISTRO main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/$VERSION $DISTRO main" | tee -a /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs && \
    apt-get -y install openjdk-17-jdk-headless && \
    node -v && npm -v && \
    npm install -g pnpm && \
    npm install -g --unsafe-perm @ionic/cli@${IONIC_VERSION} && \
    pnpm -v && \
    cd /tmp && \
    ionic start myNewProject blank --type=vue --capacitor && \
    cd myNewProject && \
    ionic build && \
    ionic capacitor build android --no-open && \
    rm -rf /tmp/myNewProject && \
    npx @capacitor/cli telemetry off && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /tmp