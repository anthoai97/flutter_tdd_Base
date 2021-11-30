# awesome_app

A awesome Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Setting language localization

1. Open your terminal in the folder's path containing your project
2. Run in terminal: 
    flutter2 pub run easy_localization:generate -S assets/translations -f json -o locale_keys.g.dart
3. Past import => import 'generated/locale_keys.g.dart';
*** Note: https://pub.dev/packages/easy_localization

#### Run to get file.g for json_serializable

flutter pub run build_runner build --delete-conflicting-outputs