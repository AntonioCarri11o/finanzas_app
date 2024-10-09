import 'package:flutter/material.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final TextEditingController _codeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? validateCode(String? value) {
    if (value == null || value.isEmpty || value.trim() == '') {
      return 'Código requerido';
    }
    final RegExp regex = RegExp(r'^\d{5}$');
    if (!regex.hasMatch(value)) {
      return 'Solo se permiten 5 dígitos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificar código'),
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
                  validator: validateCode,
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: '12345', label: Text('Código de verificación')),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {Navigator.pushNamed(context, '/newpassword')}
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
