# Our Hive - Emotional App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to update the icon app
Change the icon.png file in the root/assets folder of the project. Verify in pubspec.yaml file that the following lines are present.
```yaml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/app_icon.jpg"
  min_sdk_android: 21
```
Open a terminal in the root folder of the project and run the following command:
```sh 
flutter pub run flutter_launcher_icons 
```
## How to generate the Hive files
```sh
flutter packages pub run build_runner build
```