# Advanced Countdown Timer

[![Pub Version](https://img.shields.io/pub/v/advanced_countdown_timer)](https://pub.dev/packages/advanced_countdown_timer)
[![Build Status](https://img.shields.io/github/workflow/status/yourusername/advanced_countdown_timer/CI)](https://github.com/yourusername/advanced_countdown_timer/actions)

## Description

**AdvancedCountdownTimer** is a highly customizable countdown timer widget for Flutter apps. It provides an easy way to implement a countdown timer with features like start, pause, reset, and customizable text styles and progress indicator colors. 

## Features

- Start, pause, and reset functionality
- Customizable countdown duration
- Circular progress indicator
- Customizable text style and progress bar color
- Callback functions for start, pause, and completion events

## Installation

Add the following line to your `pubspec.yaml` under the `dependencies` section:

```yaml
dependencies:
  advanced_countdown_timer: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:advanced_countdown_timer/advanced_countdown_timer.dart';
```

### Basic Usage

Here’s a simple example of how to use the **AdvancedCountdownTimer** widget:

```dart
import 'package:flutter/material.dart';
import 'package:advanced_countdown_timer/advanced_countdown_timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Advanced Countdown Timer'),
        ),
        body: Center(
          child: AdvancedCountdownTimer(
            duration: Duration(seconds: 10),
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            progressColor: Colors.blue,
            onStart: () {
              print('Countdown started!');
            },
            onPause: () {
              print('Countdown paused!');
            },
            onComplete: () {
              print('Countdown complete!');
            },
          ),
        ),
      ),
    );
  }
}
```

### Customizing the Timer

You can easily customize the timer's appearance and behavior by passing optional parameters:

```dart
AdvancedCountdownTimer(
  duration: Duration(seconds: 60), // Countdown duration
  textStyle: TextStyle(fontSize: 30, color: Colors.red), // Custom text style
  progressColor: Colors.green, // Custom progress bar color
  onStart: () => print("Timer started!"), // On start callback
  onPause: () => print("Timer paused!"), // On pause callback
  onComplete: () => print("Timer complete!"), // On completion callback
)
```

### Example

For a complete example, check the `/example` folder in this repository.

## API

### `AdvancedCountdownTimer`

| Property         | Type                | Description                                       |
|------------------|---------------------|---------------------------------------------------|
| `duration`       | `Duration`          | The duration for the countdown.                   |
| `textStyle`      | `TextStyle?`        | Text style for the countdown display.             |
| `progressColor`  | `Color`             | Color of the circular progress indicator.         |
| `onStart`        | `VoidCallback?`      | Callback triggered when the countdown starts.     |
| `onPause`        | `VoidCallback?`      | Callback triggered when the countdown is paused.  |
| `onComplete`     | `VoidCallback?`      | Callback triggered when the countdown completes.  |

## Testing

To run the widget tests, use the following command:

```bash
flutter test
```

## Contributing

Feel free to open issues and pull requests if you encounter any bugs or want to contribute to the development of this package.

### Steps to Contribute:
1. Fork this repository.
2. Clone your forked repository.
3. Create a new branch.
4. Commit your changes.
5. Push your changes and create a pull request.

## License

This package is distributed under the MIT License. See [LICENSE](LICENSE) for more information.