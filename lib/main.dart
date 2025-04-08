import 'package:flutter/material.dart';
import 'package:lanchoneteapp/detalhesPage.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lanchonete')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProdutoCard(
                imagem: 'assets/images/hamburger.png',
                corFundo: const Color.fromARGB(255, 113, 164, 221),
                corTexto: const Color.fromARGB(255, 255, 255, 255),
                titulo: 'Hamburger',
                descricao:
                    'Veja os ingredientes que usamos em nosso hamburger e as calorias aplicadas em cada ingrediente.',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detalhespage(
                        titulo: 'Hamburger',
                        cor1: const Color.fromARGB(255, 113, 164, 221),
                        cor2: const Color.fromARGB(255, 14, 29, 112),
                      ),
                    ),
                  );
                },
              ),
              ProdutoCard(
                imagem: 'assets/images/pizza.png',
                corFundo: const Color.fromARGB(255, 192, 124, 209),
                corTexto: const Color.fromARGB(255, 255, 255, 255),
                titulo: 'Pizza',
                descricao:
                    'Veja os ingredientes que usamos em nossa famosa pizza e as calorias aplicadas em cada ingrediente.',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detalhespage(
                        titulo: 'Pizza',
                        cor1: const Color.fromARGB(255, 196, 113, 221),
                        cor2: const Color.fromARGB(255, 53, 20, 131),
                      ),
                    ),
                  );
                },
              ),
              ProdutoCard(
                imagem: 'assets/images/donut.png',
                corFundo: const Color.fromARGB(255, 118, 201, 194),
                corTexto: const Color.fromARGB(255, 255, 255, 255),
                titulo: 'Donuts',
                descricao:
                    'Veja os ingredientes que usamos em nossos donuts e as calorias aplicadas em cada ingrediente.',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detalhespage(
                        cor1: const Color.fromARGB(255, 94, 199, 199),
                        cor2: const Color.fromARGB(255, 14, 76, 105),
                        titulo: 'Donuts',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProdutoCard extends StatelessWidget {
  final String imagem;
  final String titulo;
  final String descricao;
  final VoidCallback onPressed;
  final Color corFundo;
  final Color corTexto;

  const ProdutoCard({
    required this.imagem,
    required this.titulo,
    required this.descricao,
    required this.onPressed,
    required this.corFundo,
    required this.corTexto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corFundo,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imagem, width: 100, height: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: corTexto,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  child: Text(descricao, textAlign: TextAlign.center),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 40),
                  ),
                  child: const Text('Ver mais'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
