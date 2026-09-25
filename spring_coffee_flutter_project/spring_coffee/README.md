# Spring Coffee — ITP107 Finals Lab 1

A 3-screen Flutter app (Login → Sign Up → Home) built with named routes,
following the provided Spring Coffee Figma/mockup design.

## How to run

1. Make sure Flutter is installed (`flutter doctor`).
2. From this project folder, install packages:
   ```
   flutter pub get
   ```
3. Run on an emulator or connected device:
   ```
   flutter run
   ```

## Project structure

```
lib/
  main.dart                  MaterialApp + named routes ('/login', '/signup', '/home')
  constants.dart              Shared colors, field decoration, AppButton
  widgets/
    password_field.dart       Password field with lock + eye (show/hide) icons on the left
  screens/
    login_screen.dart
    signup_screen.dart
    home_screen.dart
assets/images/
  login_logo.png
  signup_logo.png
  menu.png
```

## Navigation flow

| From        | To          | Navigator method              |
|-------------|-------------|--------------------------------|
| Login       | Sign Up     | `Navigator.pushNamed`          |
| Sign Up     | Login       | `Navigator.pop`                |
| Login       | Home        | `Navigator.pushReplacementNamed` (passes username as argument) |
| Sign Up     | Home        | `Navigator.pushReplacementNamed` (passes username as argument) |
| Home        | Login       | `Navigator.pushReplacementNamed` (Log out) |

The Home screen reads the name through
`ModalRoute.of(context)!.settings.arguments` and displays it in the
"WELCOME, <name>" header.

## Validation implemented

- **Login:** username required; password required (min 6 characters).
- **Sign Up:** username required; email required and must match a valid
  email pattern; password required (min 6 characters); confirm password
  must match password.
- Both password fields show a **lock icon** and an **eye icon** on the
  left side of the field — tapping the eye toggles show/hide password.

## Lab roles (fill in for submission)

| Role | Name |
|---|---|
| Navigation & Routing Lead | |
| UI/UX Designer | |
| Integration & Testing Lead | |
