# WetinWeather

WetinWeather is a modern, cross-platform Flutter application that delivers real-time weather and air quality information. Designed for both mobile and tablet devices, WetinWeather combines a beautiful, responsive interface with robust features, making it an ideal companion for anyone who wants to stay informed about weather conditions and air quality wherever they are.

---

## 🌦️ Project Description

WetinWeather is a feature-rich weather and air quality app built with Flutter. It provides users with up-to-date weather forecasts, detailed air quality indices, and a visually engaging experience powered by smooth animations and responsive layouts. The app stands out with its focus on clarity, accessibility, and offline support, ensuring users always have access to essential weather data.

---

## ✨ Features

- **Current Weather:**  
  Instantly view the latest weather conditions for your location or any searched city.

- **Weather Forecasts:**  
  Access hourly and daily forecasts with detailed breakdowns.

- **Air Quality Index (AQI):**  
  Real-time AQI values, pollutant breakdowns, and health recommendations.

- **Detailed Weather Stats:**  
  Includes temperature, humidity, wind speed, pressure, sunrise/sunset times, and more.

- **Responsive UI:**  
  Optimized for both portrait and landscape orientations on phones and tablets.

- **Theming:**  
  Light and dark mode support with smooth transitions.

- **Offline Support:**  
  Caches the last fetched weather and AQI data for offline viewing.

- **Animations:**  
  Engaging Lottie animations for weather conditions and transitions.

- **Seamless Navigation:**  
  Modern routing for a smooth user experience.

- **Search Functionality:**  
  Search for weather and air quality data by city name.

- **Localization Ready:**  
  Easily adaptable for multiple languages and regions.

---

## 📱 Screenshots

| Portrait | Landscape |
|----------|-----------|
| ![Portrait Screenshot](assets/screenshots/portrait.png) | ![Landscape Screenshot](assets/screenshots/landscape.png) |

*Replace the above image paths with your actual screenshots.*

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.10.0 or higher recommended)
- Android Studio or Xcode for platform-specific builds
- A weather API key (e.g., [OpenWeatherMap](https://openweathermap.org/api))

### Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/wetinweather.git
   cd wetinweather
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Configure API keys:**
   - Create a `.env` file in the root directory.
   - Add your API keys:

     ```
     WEATHER_API_KEY=your_api_key_here
     ```

4. **Run the app:**

   ```sh
   flutter run
   ```

---

## 🗂️ Project Structure

```
lib/
├── components/         # Reusable widgets and UI components
├── presentation/       # Screens and presentation logic
├── utilities/          # Constants, helpers, and utilities
├── main.dart           # App entry point
assets/
├── images/             # Weather icons and backgrounds
├── animations/         # Lottie animation files
├── fonts/              # Custom fonts
test/                   # Unit and widget tests
```

- **components/**: Contains reusable UI widgets.
- **presentation/**: Houses all screens and presentation logic.
- **utilities/**: Includes constants, helpers, and utility functions.
- **assets/**: Stores images, animations, and fonts used in the app.
- **test/**: Contains all unit and widget tests.

---

## 📦 Packages Used

| Package                | Purpose                                      |
|------------------------|----------------------------------------------|
| `flutter_bloc`         | State management (BLoC pattern)              |
| `go_router`            | Declarative navigation and routing           |
| `lottie`               | Animated weather illustrations               |
| `flutter_screenutil`   | Responsive UI scaling                        |
| `percent_indicator`    | Circular and linear percent indicators       |
| `auto_size_text`       | Adaptive text sizing                         |
| `chopper`              | HTTP networking and API integration          |
| `hive`                 | Local storage and caching                    |
| `equatable`            | Value equality for Dart objects              |
| `intl`                 | Date and number formatting                   |
| `build_runner`         | Code generation for models and APIs          |
| `mockito`              | Mocking for unit tests                       |

See [`pubspec.yaml`](pubspec.yaml) for the full list of dependencies.

---

## 🤝 Contribution Guidelines

We welcome contributions! To get started:

1. **Fork the repository**
2. **Create a new branch**  
   `git checkout -b feature/your-feature-name`
3. **Make your changes**
4. **Write tests for your features**
5. **Commit and push**  
   `git commit -m "Add your feature"`  
   `git push origin feature/your-feature-name`
6. **Open a Pull Request**  
   Please ensure your code follows the [Flutter style guide](https://docs.flutter.dev/codelabs/layout-basics#best-practices) and passes all checks.

---

## 🧪 Testing

To run unit and widget tests:

```sh
flutter test
```

---

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 📬 Contact & Support

For questions, suggestions, or issues, please open an [issue](https://github.com/yourusername/wetinweather/issues) or contact the maintainer.

---

**Happy coding! 🚀**
