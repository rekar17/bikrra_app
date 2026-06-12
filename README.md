# Bikrra App

A Flutter mobile app for browsing and ordering wedding-related products and services, including cakes, gifts, wedding cards, furniture, and event services.

## Features

- Product browsing with detail pages
- Cart, favorites, and order flow
- Wedding card information and PDF-related tools
- Category-based shopping experience
- Local persistence with `shared_preferences`
- Arabic/Kurdish-oriented UI with custom fonts

## Tech Stack

- Flutter / Dart
- Provider for state management
- Dio for API requests
- Shared Preferences for local storage
- PDF, QR, image picker, and webview packages

## Getting Started

```bash
flutter pub get
flutter run
```

## Project Structure

```text
lib/
  api/          API clients
  classes/      Data models
  constants/    App constants and colors
  providers/    State management
  services/     App services
  ui/           Screens and widgets
```

## Assets

App images, icons, and fonts are stored in `assets/` and registered in `pubspec.yaml`.
