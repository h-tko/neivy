import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:neivy/config/app_config.dart';
import 'package:neivy/config/colors.dart';
import 'package:neivy/di/view_model_registry.dart';
import 'package:neivy/route.dart';
import 'package:neivy/ui/launch/launch_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Crashlytics.instance.enableInDevMode = AppConfig().isDebug;

  if (!AppConfig().isDebug) {
    FlutterError.onError = Crashlytics.instance.recordFlutterError;
  }

  runApp(NeivyApp());
}

class NeivyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _build(context),
      routes: routes,
      title: 'Neivy',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
    );
  }

  Widget _build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewModelRegistry.makeLaunchViewModel(),
      child: LaunchScreen(),
    );
  }
}
