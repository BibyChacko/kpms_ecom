import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kpms_project/firebase_options.dart';
import 'package:kpms_project/src/kpms_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const KpmsApp());
}
