# Nubank Mobile Test

**Description**

This exercise aims at creating a small application that allows you to shorten links and displays a
history of the recently shortened links to your favorite websites.
In order to do this, you'll use an already implemented service that will handle all the backend
logic, which is to accept the links and return an alias for them.

### This application is composed

- **HomePage**: This application is composed of only one screen
  - One text input in which the user can type the website URL to shorten;
  - One button which will trigger the action of sending this link to the service;
  - A list with the recently shortened links/aliases.

### Dependencies

- flutter: ^3.8.1 or latest
- dio: latest
- get_it: latest
- equatable: latest
- logger: latest

### Project Structure

The project is organized as follows:

```
lib/
├── src/
│   ├── config/
│   │   └── di/                         # Dependency injection configuration
│   ├── http/                           # HTTP communication layer
│   │   ├── client/                     # Custom HTTP client
│   │   ├── dio/                        # Dio HTTP client configurations
│   ├── core/                           # Core application functionalities
│   │   ├── base/                       # Base and abstract classes
│   │   ├── log/                        # Logging system
│   │   └── utils/                      # Utilities and helpers
│   ├── data/                           # Data layer
│   │   ├── repositories/               # Repository implementations
│   │   └── services/                   # Data services
│   │       └── api/                    # API services
│   ├── domain/                         # Domain layer (business rules)
│   │   ├── dtos/                       # Data Transfer Objects
│   │   └── entities/                   # Domain entities
│   └── ui/                             # User interface layer
│       ├── home/                       #
│       │   ├── components/             # Home-specific components
│       │   ├── controllers/            # Home controllers
│       │   └── states/                 # Home states
│       ├── styles/                     # Global styles
│       ├── app_widget.dart             # Main app widget
│       └── main.dart                   # Application entry point
└── test/                               # Automated tests
```

### How to works it

1. Clone repository:

   ```bash
   git clone https://github.com/ayusuke7/nubank_mobile_test.git
   ```

2. Access folder:

   ```bash
   cd nubank_mobile_test
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run project:

   ```bash
   flutter run
   ```

---

### Run suite tests

1. Run build_runner for generate mocks:

   ```bash
   flutter pub run build_runner build
   ```

2. Run tests
   ```bash
   flutter test
   ```

---

### Run release distribuition

To build the app for Android and iOS, follow these steps:

#### Android

1. Ensure that you have the Android SDK and Flutter installed on your system.
2. Connect an Android device or start an Android emulator.
3. Navigate to the project directory in your terminal.
4. Run the following command to build the APK:

   ```bash
   flutter build apk --release
   ```

5. The APK file will be generated in the `build/app/outputs/flutter-apk/` directory.

#### iOS

1. Make sure you have Xcode and Flutter installed on your macOS.
2. Connect an iOS device or start an iOS simulator.
3. Open the iOS project in Xcode:

   ```bash
   open ios/Runner.xcworkspace
   ```

4. Select a target device in Xcode.
5. Build the iOS app:

   - For a physical device:

     Ensure your device is connected and selected as the target, then click the "Run" button in Xcode.

   - For an archive to upload to the App Store:

     Go to `Product` > `Archive` in the Xcode menu, select the archive, and then use the Organizer to distribute the app.

6. The built app will be available in the `build/ios/iphoneos/` directory.
