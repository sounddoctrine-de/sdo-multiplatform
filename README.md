<p align="center">
  <a href="https://apps.apple.com/in/app/sound-doctrine-online/id6443919279">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://storage.googleapis.com/sdo-public-assets/Text%20Logo.png">
      <img src="https://storage.googleapis.com/sdo-public-assets/Text%20Logo.png" height="128">
    </picture>
    <h1 align="center">Sound Doctrine Online</h1>
  </a>
</p>

SDO Multiplatform is the multiplatform client for Sound Doctrine Online ([sounddoctrine.online](https://sounddoctrine.online)). This repository contains a Kotlin Multiplatform project with the original iOS/macOS Xcode project integrated within it, supporting iOS, Android, and Desktop platforms.

<p align="center">
  <a href="https://apps.apple.com/in/app/sound-doctrine-online/id6443919279">
    <img src="https://storage.googleapis.com/sdo-public-assets/Download_on_the_App_Store_Badge_US-UK_RGB_wht_092917.svg">
  </a>
</p>

#### What is Sound Doctrine Online?
Looking for non-charismatic, non-ecumenical, Independent Fundamental Baptist (IFB) preaching and congregational singing from around the world? They're all on Sound Doctrine Online.

Sound Doctrine Online is a video streaming platform that hosts IFB content from around the world.

The aim of Sound Doctrine Online is to make Hard Preaching from across the world accessible to everyone. It includes documentaries, sermons, congregational singing, and short excerpts of preaching.

---

## Project Structure

This is a Kotlin Multiplatform project that supports multiple platforms:

### Kotlin Multiplatform Project (Compose Multiplatform)
- **Location**: `SDOMultiplatform/` directory  
- **Platforms**: iOS, Android, Desktop (macOS/Windows/Linux), Web (Wasm)
- **Technology**: Kotlin Multiplatform, Compose Multiplatform
- **Status**: Active development

### iOS Project (Xcode)
- **Location**: `SDOMultiplatform/iosApp/` directory
- **Platforms**: iOS 16+
- **Technology**: Swift, SwiftUI (integrated with Kotlin Multiplatform shared code)
- **Status**: Part of the multiplatform structure

---

## Running the Multiplatform App

## Running the Multiplatform App

### Prerequisites
- [Android Studio](https://developer.android.com/studio) or [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- JDK 11 or later
- For iOS development: Xcode and macOS
- For Android development: Android SDK

### Steps
1. **Navigate to the multiplatform project:**
   ```sh
   cd SDOMultiplatform
   ```

2. **Open the project:**
   - Open `SDOMultiplatform` folder in Android Studio or IntelliJ IDEA

3. **Run the app:**
   - **Android**: Select `composeApp` configuration and run
   - **iOS**: Select `iosApp` configuration and run (requires macOS and Xcode)
   - **Desktop**: Select `desktopApp` configuration and run
   - **Web**: Run `./gradlew wasmJsBrowserRun`

### Environment Variables (iOS Project)

To provide local environment variables (such as API endpoints or keys) to the iOS project, create a `UserEnvironmentVariables.plist` file:

1. **Location:**
   - `SDOMultiplatform/iosApp/iosApp.xcodeproj/xcuserdata/<your-username>.xcuserdatad/UserEnvironmentVariables.plist`
2. **Format:**
   - The file should be a property list (`.plist`) with each variable as a key-value pair. Example:

     ```xml
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
     <dict>
         <key>HASURA_ENDPOINT</key>
         <string>https://sdo-prod.hasura.app/v1/graphql</string>
         <key>HASURA_ACCESS_KEY</key>
         <string>YOUR_ACCESS_KEY_HERE</string>
     </dict>
     </plist>
     ```
3. **Notes:**
   - This file is user-specific and should not be committed to version control.
   - Add any required environment variables for your local development.

### Notes
- The multiplatform project shares business logic and UI across all platforms
- Platform-specific code is organized in respective source sets
- For iOS, the app supports iOS 16 and above
- You may need to set up signing with your Apple ID in Xcode for iOS device deployment
- See `SDOMultiplatform/README.md` for detailed setup instructions

---

## Code Analysis with CodeQL

You can create a CodeQL database for code analysis and run custom queries as follows:

### Creating a CodeQL Database

**For the Kotlin Multiplatform project:**

```sh
codeql database create ./databases/kotlin-database \
  --language=java \
  --command="cd SDOMultiplatform && ./gradlew compileKotlin"
```

**For Swift code in the iOS project:**

```sh
codeql database create ./databases/swift-database \
  --language=swift \
  --command="cd SDOMultiplatform/iosApp && xcodebuild build -project iosApp.xcodeproj -scheme iosApp"
```

Refer to the [CodeQL documentation](https://codeql.github.com/docs/codeql-cli/) for more details on advanced usage.

---
