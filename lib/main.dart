import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:findnwalk/pages/index.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
