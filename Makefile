.PHONY: dependencies
dependencies:
				flutter pub get && flutter pub upgrade

.PHONY: analyze
analyze:
				flutter analyze

.PHONY: format
format:
				flutter format lib/

.PHONY: format-analyze
format-analyze:
				flutter format --dry-run lib/
				flutter analyze

.PHONY: easy-localization
easy-localization:
				flutter pub run easy_localization:generate -S assets/translations -f json -o locale_keys.g.dart

.PHONY: build-runner
build-runner:
				flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
				flutter run --target lib/main.dart --flavor dev

.PHONY: run-staging
run-staging:
				flutter run --target lib/main_staging.dart --flavor staging

.PHONY: run-production
run-production:
				flutter run --target lib/main_production.dart --flavor production

.PHONY: build-android-dev
build-android-dev:
				flutter build apk --target lib/main.dart --flavor dev

.PHONY: build-android-staging
build-android-staging:
				flutter build apk --target lib/main_staging.dart --flavor staging

.PHONY: build-android-production
build-android-production:
				flutter build apk --target lib/main_production.dart --flavor production

.PHONY: unit-test
unit-test:
				flutter test