import 'package:flutter/material.dart';
import 'package:imc_calculator/src/database/connection.dart';

import 'src/app.material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Connection.init();
  runApp(const AppMaterial());
}
