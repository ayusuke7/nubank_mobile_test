import 'package:flutter/material.dart';

import 'src/app_widget.dart';
import 'src/config/di/setup_injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupInjector();

  runApp(AppWidget());
}
