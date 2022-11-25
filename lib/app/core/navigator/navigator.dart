import 'package:flutter/material.dart';

class AppNavigator{
  final navigatorKey = GlobalKey<NavigatorState>();

  void pushReplacementNamed({required String routeName}){
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }
}