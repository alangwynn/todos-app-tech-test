# Todos App Tech Test

This project is a technical test implementation of a Todos application using modern Flutter practices. The app demonstrates the use of Riverpod for state management, clean architecture principles, and follows responsive design patterns using `flutter_screenutil`.

---

## Features

- **Task Management:** Create, read, filter (all, completed, pending), and search tasks.
- **User Authentication:** Simulated login and logout functionality.
- **State Management:** Leveraging `flutter_riverpod` for efficient state handling.
- **Responsive UI:** Ensuring usability across multiple device sizes using `flutter_screenutil`.
- **Localization:** Support for multiple languages through `context.l10n`.
- **Theming:** Toggle between light and dark modes.

---

## Folder Structure

The project adopts a modular structure for scalability and maintainability:

```
lib/
├── common/
│   ├── extensions/        # Reusable extensions for Flutter and Dart
│   ├── widgets/           # Shared custom widgets
│   └── theme/             # Theme-related files (e.g., colors, typography)
├── config/                # Application configuration (routes, providers, etc.)
├── features/
│   ├── home/              # Task-related screens, widgets, and logic
│   ├── login/             # User authentication and profile management
│   └── ...                # Other features
├── main.dart              # Application entry point
```

---

## Getting Started

### Prerequisites

- **Flutter SDK**: Version 3.0.0 or higher
- **FVM (Flutter Version Management)** (optional): To manage Flutter versions.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/alangwynn/todos-app-tech-test.git
   cd todos-app-tech-test
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

---

## Usage

### Running the App
- Use the filter dropdown to view all tasks, completed tasks, or pending tasks.
- Add new tasks using the create task button.
- Search for tasks using the search bar.
- Toggle light/dark mode using the button in the profile screen.
- Logout via the profile screen.

### Screenshots

#### Light Mode:
[Insert screenshot here]

#### Dark Mode:
[Insert screenshot here]

---

## Tools & Technologies

- **State Management:** Riverpod
- **Responsive Design:** flutter_screenutil
- **Navigation:** GoRouter
- **Localization:** flutter_localizations

---

## Contributing

Contributions are welcome! To contribute:
1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Acknowledgements

- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for responsive layouts.
- [GoRouter](https://pub.dev/packages/go_router) for seamless navigation management.

---

## Contact

For questions or suggestions, feel free to reach out:

- **Author:** Alan Gwynn
- **Email:** [alan.gwynn1999@gmail.com]

---
