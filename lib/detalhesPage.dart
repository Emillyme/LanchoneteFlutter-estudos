import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../carrinho.dart';

class Detalhespage extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final Color cor1;
  final Color cor2;
  final Image icon;
  final String calorias;
  final String preco;
  final List<ExercicioItem> exercicios;

  const Detalhespage({
    super.key,
    required this.titulo,
    required this.cor1,
    required this.cor2,
    required this.icon,
    required this.subtitulo,
    required this.calorias,
    required this.preco,
    required this.exercicios,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cor1, cor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Total no carrinho
                Consumer<CarrinhoModel>(
                  builder: (context, carrinho, child) {
                    return Text(
                      'Total no carrinho: ${carrinho.totalItens()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 2, 31, 3),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),
                SizedBox(width: 120, height: 120, child: icon),
                const SizedBox(height: 25),

                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text('- $subtitulo -', style: TextStyle(fontSize: 17)),

                const SizedBox(height: 25),

                // Calorias e Preço
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.green,
                        thickness: 2,
                        endIndent: 0,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        '$calorias Calorias / \$ $preco',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Colors.green,
                        thickness: 2,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: exercicios,
                ),
                const SizedBox(height: 30),
                Consumer<CarrinhoModel>(
                  builder: (context, carrinho, child) {
                    final quantidade = carrinho.quantidade(titulo);
                    return Column(
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => carrinho.remover(titulo),
                              child: Text('-'),
                            ),
                            const SizedBox(width: 15),
                            Text('$quantidade', style: TextStyle(fontSize: 20)),
                            const SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () => carrinho.adicionar(titulo),
                              child: Text('+'),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ExercicioItem extends StatelessWidget {
  final AssetImage imagem;
  final String label;

  const ExercicioItem({super.key, required this.imagem, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: imagem, width: 30, height: 30),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
