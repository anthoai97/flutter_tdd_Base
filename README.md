# Awsome Page

A awesome base Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile dev, and a full API reference.

### Starting the base
fluter pub get

### Setting language localization

1. Open your terminal in the folder's path containing your project
2. Run in terminal: 
  flutter pub run easy_localization:generate -S assets/translations -f json -o locale_keys.g.dart
3. Past import => import 'generated/locale_keys.g.dart';

*** Note: https://pub.dev/packages/easy_localization

### Run to get file.g for json_serializable

flutter pub run build_runner build --delete-conflicting-outputs

### Run the project

- Use visual studio code:
	- Adding this config to lauch.json
	
		"configurations":
		 [
			{
				"name": "awesome_app_base dev",
				"request": "launch",
				"type": "dart",
				"program": "lib/main.dart",
				"args": ["--flavor", "dev", "--target", "lib/main.dart"]
			},
			{
				"name": "awesome_app_base staging",
				"request": "launch",
				"type": "dart",
				"program": "lib/main_staging.dart",
				"args": ["--flavor", "staging", "--target", "lib/main_staging.dart"]
			},
			{
				"name": "awesome_app_base production",
				"request": "launch",
				"type": "dart",
				"program": "lib/main_production.dart",
				"args": ["--flavor", "production", "--target", "lib/main_production.dart"]
			}
		]

- Run by terminal:
	- Dev : flutter run --target lib/main.dart --flavor dev
	- Staging : flutter run --target lib/main_staging.dart --flavor staging
	- Production : flutter run --target lib/main_production.dart --flavor production

### Helper

- Generate App Icon:

	flutter pub run flutter_launcher_icons:main -f flutter_launcher_icons*.yaml

*** Note: https://pub.dev/packages/flutter_launcher_icons


