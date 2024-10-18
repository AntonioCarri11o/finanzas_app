import 'package:finanzas/kernel/widgets/text_field_password_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});
  @override
  State<CreateAccount> createState() => _CreateAccontState();
}

class _CreateAccontState extends State<CreateAccount> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (value == null || value.isEmpty) {
      return 'El correo es requerido';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'La contraseña es necesaria';
    } else if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                controller: _emailController,
                validator: validateEmail,
                decoration: const InputDecoration(
                    hintText: 'example@email.com',
                    label: Text('Correo electrónico')),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldPassword(
                controller: _passwordController,
                validator: validatePassword,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldPassword(
                controller: _repeatPasswordController,
                validator: validatePassword,
                labelText: 'Repetir contraseña',
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not.found') {
                          print('User not found');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password');
                        }
                      }
                    }
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text('Registrar'))
            ],
          ),
        ),
      ),
    );
  }
}
