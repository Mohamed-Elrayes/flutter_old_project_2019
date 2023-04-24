import 'package:flutter/material.dart';
import 'package:talk_to/app/view/app.dart';
import 'package:talk_to/bootstrap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _ensureInitialize();
  bootstrap(() => const App());
}

// Future _ensureInitialize() async {
//   await EasyLocalization.ensureInitialized();
//   await Firebase.initializeApp();

//   // await initializeDependencies();
// }
