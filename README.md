## W

w is a Flutter package that adds a fun dab animation to your widgets.

### Getting Started

1. Add the package to your `pubspec.yaml`:
```yaml
dependencies:
  w: ^1.0.0
```
2. Import the package:
```dart
import 'package:w/dab_animation.dart';
```

### Usage

To use this package, simply wrap any widget with `DabAnimation`:

```dart
import 'package:w/dab_animation.dart';

DabAnimation(
  child: YourWidget(),
)
```

![Demo](./example/demo.gif)

### License

This project is licensed under the BSD (3-Clause) License - see the LICENSE file for details.