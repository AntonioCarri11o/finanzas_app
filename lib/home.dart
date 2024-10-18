import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.brown.shade800,
                  foregroundColor: Colors.white,
                  child: const Text('AH'),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rodolfo Antonio Carrillo Fuentes',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hace 10 minutos',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert)
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async => await FirebaseAuth.instance.signOut(),
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.grey[850],
                  foregroundColor: Colors.white),
              child: const Text('Cerrar sesión'),
            ),
          )
        ],
      ),
    );
  }
}
