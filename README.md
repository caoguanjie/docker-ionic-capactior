# docker-ionic-capactior
ionic8.x和capacitor6.x的docker容器部署环境

# Android 13 (API levels 28 - 34)

## 基础镜像来自于 [beevelop/android:v2023.12.1](https://github.com/beevelop/docker-android)

- Java `17.0.9`
- Gradle `4.4.1` (Groovy: `2.4.21`)
- Apache Maven `3.6.3`
- Ant `1.10.12`

## 拉取，构建或运行此图像

```bash
# pull the most recent tag / release
docker pull caoguanjie/docker-ionic-capacitor:latest

# or run the image interactively
docker run --rm --name docker-ionic-capacitor -it beevelop/android:v2023.12.1 bash


```

## 或者将其用作基础图像

```Dockerfile
FROM beevelop/android:v2023.12.1

# accepts all the Licenses (please read first)
RUN yes | sdkmanager --licenses --sdk_root=$ANDROID_SDK_ROOT
```
