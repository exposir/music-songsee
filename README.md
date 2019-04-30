# 音赋App

用Flutter开发的古风类型歌曲视听App

## Getting Started

ios开发调试: 推荐通过ide启动和调试，或运行 flutter run
android开发调试：因为依赖32位的播放核心插件，需要运行 flutter run --target-platform=android-arm

## Build打包
android: flutter build apk
ios: flutter build ios

## 部署
直接通过数据线本地打包后部署：flutter install
通过fir内测平台发布：Android直接上传apk包，
ios复杂一点儿，首先需要安装企业版证书iPhoneDistribution.p12，运行flutter build ios, 然后再xcode中运行Product->Archive, 最终在Archives里Distribute App，选择Enterprise，即可生成用来上传的ipa包。