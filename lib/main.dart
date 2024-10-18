import 'package:finanzas/firebase_options.dart';
import 'package:finanzas/home.dart';
import 'package:finanzas/splash_screen.dart';
import 'package:finanzas/widgets/modules/auth/screens/code_verification.dart';
import 'package:finanzas/widgets/modules/auth/screens/create_account.dart';
import 'package:finanzas/widgets/modules/auth/screens/email_verification.dart';
import 'package:finanzas/widgets/modules/auth/screens/forgot_password.dart';
import 'package:finanzas/widgets/modules/auth/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/recuperar': (context) => const EmailVerification(),
        '/validar': (context) => const CodeVerification(),
        '/newpassword': (context) => const ForgotPassword(),
        '/home': (context) => const Home(),
      },
    );
  }
}
