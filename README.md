# Fit360 Fitness Tracker App | Android

Fit360 is a Flutter-based fitness tracker application focused on core health tracking workflows such as food tracking, water tracking, and map-based workout support.

## Wireframe

Wireframe link: https://balsamiq.cloud/s1j0f54/p8rzhtk/rDB97

## Tech Stack

- Flutter (Dart)
- Firebase (Core, Auth, Realtime Database)
- Riverpod (state management)
- GoRouter (navigation)
- Google Maps Flutter

## Current Modules

- Authentication (Welcome, Login, Register)
- Home dashboard
- Food tracker UI
- Water tracker UI
- Map tracker UI
- Profile UI

## Project Structure

Key folders:

- lib/ -> Application source code
- android/ -> Android platform configuration
- ios/, macos/, web/, linux/, windows/ -> Multi-platform scaffolding
- test/ -> Flutter tests

## Requirements

- Flutter SDK (stable channel)
- Dart SDK (bundled with Flutter)
- Android Studio with Android SDK
- JDK 17 or compatible version for modern Android Gradle builds

## Getting Started

1. Clone the repository.
2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

## Build APK (Release)

```bash
flutter build apk
```

Generated output:

- build/app/outputs/flutter-apk/app-release.apk

## Android Configuration Notes

- Minimum Android SDK is set to 23 in the Android app module.
- Firebase Realtime Database integration requires this minimum SDK level.

## Development Status

This project is under active development as part of the EE4369 coursework.
