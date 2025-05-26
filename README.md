# WetinWeather

**WetinWeather** is a modern, responsive weather and air quality app built with [Flutter](https://flutter.dev/).  
It provides detailed weather forecasts, air quality indices, and environmental parameters with a beautiful, adaptive UI for both mobile and tablet devices in portrait and landscape modes.

---

## ✨ Features

- **Current Weather:**  
  View up-to-date weather conditions for your location.

- **Forecast Reports:**  
  Hourly and next-day forecasts with easy navigation.

- **Air Quality Index:**  
  Visual AQI indicators and detailed pollutant breakdowns.

- **Detailed Air Quality Parameters:**  
  See breakdowns for PM2.5, PM10, NO₂, SO₂, O₃, and CO with visual cards.

- **Weather Details Screen:**  
  Access in-depth weather stats, forecast icons, and web links for more info.

- **Responsive UI:**  
  Optimized layouts for mobile and tablet, portrait and landscape.

- **Theming:**  
  Light and dark mode support.

- **Navigation:**  
  Smooth navigation using [go_router](https://pub.dev/packages/go_router).

---

## 📱 Screenshots

<!-- Add your screenshots here -->
| Portrait | Landscape |
|----------|-----------|
| ![Portrait Screenshot](assets/screenshots/portrait.png) | ![Landscape Screenshot](assets/screenshots/landscape.png) |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A device or emulator

### Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/wetinweatherprop.git
   cd wetinweatherprop
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the app:**

   ```sh
   flutter run
   ```

---

## 🛠️ Project Structure

```
lib/
├── presentation/
│   ├── components/         # Reusable UI components
│   ├── screens/            # Main app screens (portrait & landscape)
│   └── screen sections/    # Screen-specific sections/widgets
├── utilities/              # Utility functions, constants, helpers
└── main.dart               # App entry point
```

---

## 📦 Key Dependencies

- [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil) — Responsive sizing
- [`font_awesome_flutter`](https://pub.dev/packages/font_awesome_flutter) — Iconography
- [`go_router`](https://pub.dev/packages/go_router) — Navigation
- [`percent_indicator`](https://pub.dev/packages/percent_indicator) — Circular progress indicators
- [`auto_size_text`](https://pub.dev/packages/auto_size_text) — Adaptive text sizing
- [`lottie`](https://pub.dev/packages/lottie) — Animated weather icons

---

## 🧑‍💻 Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements and bug fixes.

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

## 🙏 Acknowledgements

- [Flutter](https://flutter.dev/)
- [OpenWeatherMap](https://openweathermap.org/) (or your data provider)
- All open-source package authors

---

> **Made with ❤️ using Flutter**
