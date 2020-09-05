import 'package:flutter/material.dart';
import 'package:neivy/di/view_model_registry.dart';
import 'package:neivy/ui/home/home_screen.dart';
import 'package:neivy/ui/regist/regist_screen.dart';
import 'package:provider/provider.dart';

Map<String, WidgetBuilder> get routes => {
      '/home': (_) => ChangeNotifierProvider(
            create: (_) => ViewModelRegistry.makeHomeViewModel(),
            child: HomeScreen(),
          ),
      '/regist': (_) => ChangeNotifierProvider(
            create: (_) => ViewModelRegistry.makeRegistViewModel(),
            child: RegistScreen(),
          ),
    };
