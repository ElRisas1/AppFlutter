import 'package:flutter/material.dart';
import 'package:app_juego_tronos/PantallaPrincipal.dart';

void main() {
  runApp(const Aplicacion());
  print("Completado Boy");
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Juego de tronos personaje',
      home: PantallaPrincipal(title: "Pantalla Inicio"),
    );
  }
}
