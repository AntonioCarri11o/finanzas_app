import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscureP = true;
  bool _isObscureR = true;
  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Este campo es requerido';
    }
  }

  String? validateRepeatedPassword(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Este campo es requerido';
    }
    if (value != _passwordController.text) {
      return 'Las contraseñas deben ser iguales';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar contraseña')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
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
                  validator: validateNewPassword,
                  controller: _passwordController,
                  obscureText: _isObscureP,
                  decoration: InputDecoration(
                      hintText: '*****',
                      label: const Text('Nueva contraseña'),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscureP = !_isObscureP;
                            });
                          },
                          icon: Icon(_isObscureP
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined))),
                ),
                TextFormField(
                  validator: validateRepeatedPassword,
                  obscureText: _isObscureR,
                  controller: _repeatPasswordController,
                  decoration: InputDecoration(
                      hintText: '*****',
                      label: const Text('Repetir contraseña'),
                      suffixIcon: IconButton(
                        onPressed: () => {
                          setState(() {
                            _isObscureR = !_isObscureR;
                          })
                        },
                        icon: Icon(_isObscureR
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                      )),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () => {_formKey.currentState!.validate()},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('Guardar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
