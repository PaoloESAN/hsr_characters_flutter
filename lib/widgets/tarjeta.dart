import 'package:flutter/material.dart';

class Tarjeta extends StatelessWidget {
  final String nombre;
  final int estrellas;
  const Tarjeta({super.key, required this.nombre, required this.estrellas});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(10.0),
          elevation: 0,
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/mafuyu.jpg'),
                    /*image: NetworkImage(
                      'https://preview.redd.it/mafuyu-card-v0-to0w5nus26he1.jpeg?auto=webp&s=b7bb0253387f61bf03aac4297d3435e68da2906d',
                    ),*/
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                      Colors.black.withValues(alpha: 0.6),
                    ],
                    stops: const [0.0, 0.7, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nombre,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ...List.generate(estrellas, (idx) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: /*Image.asset(
                                'assets/icons/star.png',
                                width: 24,
                                height: 24,
                                color: Theme.of(context).colorScheme.onPrimary,
                              )*/ Icon(
                                Icons.star_rate,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 20,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
