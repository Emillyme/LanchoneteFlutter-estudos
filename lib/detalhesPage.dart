// detalhesPage.dart

import 'package:flutter/material.dart';

class Detalhespage extends StatelessWidget {
  final String titulo;
  final Color cor1;
  final Color cor2;

  const Detalhespage({super.key, 
  required this.titulo,
  required this.cor1,
  required this.cor2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            cor1,
            cor2
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 150),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),

          ),
        ),
      ),
    );
  }
}
