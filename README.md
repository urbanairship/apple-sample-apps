# Airship Sample Apps

This repository contains sample applications demonstrating how to integrate Airship's iOS SDK across different platforms and languages.

## 📱 Available Samples

### Airship Sample
- **Platform**: iOS, visionOS, ipadOS
- **Language**: Swift
- **Features**: Push notifications, Message Center, Preference Center, Live Activities, Deep linking
- **Architecture**: SwiftUI with modern iOS patterns

### Airship Sample ObjC
- **Platform**: iOS  
- **Language**: Objective-C
- **Features**: Push notifications, Message Center, Preference Center, Deep linking
- **Architecture**: UIKit with traditional iOS patterns

### Airship Sample tvOS
- **Platform**: tvOS
- **Language**: Swift
- **Features**: Push notifications, Preference Center
- **Architecture**: SwiftUI optimized for Apple TV

## 🚀 Quick Start

### Prerequisites
- Xcode 26.0 or later
- Valid Airship account with app credentials

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd apple-sample-apps
   ```

2. **Open the workspace**
   ```bash
   open AirshipSamples.xcworkspace
   ```

3. **Configure your app credentials**

    Depending on the sample app, update the credentials in:
    - Airship Sample: `Airship Sample/Airship Sample/AirshipInitializer.swift`
    - Airship Sample ObjC: `Airship Sample ObjC/Airship Sample ObjC/AirshipInitializer.m`
    - Airship Sample tvOS: `Airship Sample tvOS/Airship Sample tvOS/AirshipInitializer.swift`

4. **Verify Bundle Identifier**
   - Ensure your app's bundle identifier matches the one configured in your Urban Airship dashboard
   - Update the bundle identifier in Xcode project settings if needed

5. **Build and run**
   - Select your target device/simulator
   - Build and run the sample app

## 🔧 Configuration Details

### Required Credentials
- **App Key**: Found in your Urban Airship dashboard under Project Settings
- **App Secret**: Found in your Urban Airship dashboard under Project Settings  
- **Bundle Identifier**: Must match the bundle ID configured in your Airship app settings

### Where to Find Credentials
1. Log into your [Airship dashboard](https://go.airship.com/)
2. Navigate to your project
3. Go to **Settings** → **Project Details**
4. Copy your **App Key** and **App Secret**
5. Verify your **Bundle Identifier** matches your Xcode project


## 🛠 Troubleshooting

### Common Issues

**"Airship failed to initialize (takeOff)" Error**
- ✅ Verify your App Key and App Secret are correct
- ✅ Rebuild and run the app after updating credentials

**Push Notifications Not Working**
- ✅ Verify push notification capabilities are enabled in Xcode
- ✅ Check that your provisioning profile includes push notifications
- ✅ Ensure your bundle identifier matches your Airship app configuration
- ✅ Check your internet connection
- ✅ Ensure the device is registered for remote notifications

## 📖 Documentation
- [Airship Mobile Documentation](https://docs.airship.com/platform/mobile/setup/index.html)

## 🤝 Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

