import 'package:flutter/material.dart';

class LoginStore{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier <bool> isLoading = ValueNotifier<bool>(false);
}