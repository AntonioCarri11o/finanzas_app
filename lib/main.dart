import 'package:finanzas/widgets/modules/auth/screens/code_verification.dart';
import 'package:finanzas/widgets/modules/auth/screens/email_verification.dart';
import 'package:finanzas/widgets/modules/auth/screens/forgot_password.dart';
import 'package:finanzas/widgets/modules/auth/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/recuperar': (context) => const EmailVerification(),
        '/validar': (context) => const CodeVerification(),
        '/newpassword': (context) => const ForgotPassword()
      },
    );
  }
}
