import 'package:flutter/material.dart';
import 'di/app_dependency_injector.dart';
import 'feature/home/ui/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencyInjector.setupAppDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
