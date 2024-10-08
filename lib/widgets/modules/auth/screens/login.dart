import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State <Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png', width: 200, height: 200,),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'example@email.com',
                    label: Text('Correo electrónico')
                  ),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: '******',
                    label: const Text('Contraseña'),
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(_isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                    )
                  ),
                ),
                const SizedBox(height: 32,),
                ElevatedButton(onPressed: () => {}, child: const Text('Iniciar sesion'),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),                
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}