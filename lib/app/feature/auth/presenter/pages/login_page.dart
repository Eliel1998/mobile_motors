import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../widgets/rounded_button.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = GetIt.I.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller.store.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.store.passwordController,
              decoration: const InputDecoration(                
                labelText: 'Senha',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 56, 58, 65),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                ValueListenableBuilder<bool>(valueListenable: controller.store.isLoading, builder: (context, value, child){
                  return RoundedButton( isLoading: value,onTap: () {
                    controller.doLogin();
                    debugPrint('Login');
                  });
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
// Icon(Icons.arrow_forward)