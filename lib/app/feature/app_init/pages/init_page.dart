// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/init_controller.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);
  static const routeName = '/initPage';

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final controller = GetIt.I.get<InitController>();
  @override
  void initState() {
    super.initState();
    controller.init();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          width: 220,
          height: 220,
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_logo.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    
    );
  }
}