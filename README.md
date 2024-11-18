# Movie App 🎬

A cross-platform Flutter app for browsing popular movies, built with MVVM architecture, provider-based state management, and clean code principles.

## 📲 Demo Video
[Demo Video](https://github.com/user-attachments/assets/6cdad91f-9f43-4b0b-8ff6-a68573e7f3f3)

## 🔑 Mock Login Credentials

To log into the app, use these **test credentials**:

- **Email**: `ahmed@gmail.com`
- **Password**: `Ahmed@123`

> **Note:** These credentials are required for accessing the app's main features.

## 📥 Download the APK
Download the latest version of the app [here](https://drive.google.com/file/d/1YoVpDk61cVSoQC4mUcPi6lXlxD4-7c2G/view?usp=sharing)

## 🚀 Features

- **Popular Movies List**: Browse the latest popular movies.
- **Movie Details**: Access full details for each movie, including genre, release date, and ratings.
- **Pagination**: Efficient infinite scrolling for the popular movies list.
- **Caching**: Enhanced performance with `dio_cache_interceptor` and `dio_cache_interceptor_hive_store` for persistent local caching.
- **Localization**: Supports English and Arabic languages with in-app language switching.
- **Authentication**: Login screen with mock authentication.

## 🛠️ Tech Stack

- **Flutter**: The entire app is built with Flutter, supporting both Android and iOS.
- **State Management**: Provider package with ChangeNotifier for efficient state handling.
- **Architecture**: MVVM (Model-View-ViewModel) with a repository pattern.
- **Networking**: Dio for API requests and error handling.
- **Dependency Injection**: `get_it` for managing dependencies and services.
- **Localization**: `flutter_localizations` and `intl` for multi-language support.
