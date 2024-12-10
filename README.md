
# NBA Highlights App

A Flutter-based mobile application designed to showcase NBA highlights, including games, player moments, dunk contests, and classic footage.

---


## Setup Process

### 1. **Prerequisites**
- Install the following on your development machine:
  - **Flutter SDK** (latest version)
  - **Dart SDK**
  - **Android Studio** (for Android development) or **Xcode** (for iOS)
  - A text editor or IDE like **VS Code** (recommended)

### 2. **Installation Steps**
```bash
# Clone the repository
git clone https://github.com/Menuka-Anujitha/task.git

# Navigate to the project folder
cd nba_highlights

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---


## Libraries Used

### 1. **Firebase Integration**
- `firebase_core: ^3.4.0`: Core library for initializing Firebase in Flutter.
- `cloud_firestore: ^5.4.0`: For storing and fetching highlight data from Firestore.

### 2. **State Management & Navigation**
- `go_router: ^14.6.2`: Provides a clean and URL-based navigation system.

### 3. **UI and Styling**
- `google_fonts: ^6.2.1`: For using custom Google Fonts throughout the app.
- `shimmer: ^3.0.0`: To add loading animations for better user experience.

### 4. **Text-to-Speech**
- `flutter_tts: ^4.0.2`: For adding text-to-speech functionality to enhance accessibility.

---


## Project Structure

```plaintext
lib/
├── models/           # Data models for app entities
├── pages/            # App screens
├── services/         # API calls and database services
├── utils/            # Utilities (e.g., constants, helpers)
├── widgets/          # Reusable UI components
├── firebase_options.dart  # Firebase configuration
└── main.dart         # App entry point
```
<img src="https://github.com/Menuka-Anujitha/task/blob/main/db.png?raw=true" alt="IMG_7029" width="100%">

---

## Screens Overview

1. **Splash Screen**
   - Displays the app logo with smooth animations.
   - Transitions to the landing page once initialized.

2. **Landing Page**
   - Showcases NBA content categories (e.g., player highlights, dunk contests).
   - A grid-based design with clickable thumbnails.

3. **Category Details Page**
   - Displays detailed information and media for a selected category.
   - Features text-to-speech for accessibility.

<img src="https://github.com/Menuka-Anujitha/task/blob/main/ss.png?raw=true" alt="IMG_7029" width="100%">

---

## Key Features

1. **Real-time Database Integration**
   - Fetches content categories and details dynamically using Firebase Firestore.

2. **Smooth Animations**
   - Uses shimmer effects for loading states and transitions.

3. **Text-to-Speech**
   - Implements a text-to-speech feature for inclusive content consumption.

4. **Custom Fonts**
   - Uses Google Fonts for a modern and consistent design.

---


## Challenges & Solutions

### 1. **Handling Real-time Database Latency**
- **Challenge:** Data fetching caused delays during development.
- **Solution:** Added a loading state with shimmer animations.

### 2. **Ensuring Smooth Navigation**
- **Challenge:** Navigation transitions were initially laggy.
- **Solution:** Optimized animations and preloaded screens.

### 3. **Integrating Text-to-Speech**
- **Challenge:** Making the text-to-speech feature responsive.
- **Solution:** Configured `flutter_tts` to provide immediate feedback and clear audio output.


---

## Future Enhancements

1. **Offline Mode**
   - Implement local caching for recently viewed content.

2. **User Authentication**
   - Add support for user login and profiles.

3. **Social Sharing**
   - Enable sharing of highlights via social platforms.

---

## Contribution

Contributions are welcome! Please submit pull requests or report issues.



## License

This project is licensed under the MIT License.



