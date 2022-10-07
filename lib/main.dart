import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/di.dart';

void main() async {
  Locator.setUpDependencies();
  runApp(const AppWidget());
}
