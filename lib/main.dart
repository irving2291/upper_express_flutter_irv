import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:upper_express_ionic/app/data/local/environment.dart';
import 'package:upper_express_ionic/app/my_app.dart';

Future<void> main() async {
  await dotenv.load(
    fileName: Environment.fileName,
  );
  // DependencyInjection.initialize();
  runApp(const MyApp());
}
