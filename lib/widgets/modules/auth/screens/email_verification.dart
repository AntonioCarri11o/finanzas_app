import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar correo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 200,
                  width: 200,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  decoration: const InputDecoration(
                      hintText: 'example@email.com',
                      label: Text('Correo electrónico')),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {Navigator.pushNamed(context, '/validar')}
                        },
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.grey[850],
                        foregroundColor: Colors.white),
                    child: const Text('Validar código'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
