
import 'package:app_juego_tronos/variablesGlobales.dart';
import 'package:app_juego_tronos/visualizarPersonaje.dart';
import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';


class PantallaFavs extends StatefulWidget {
  const PantallaFavs({super.key, required this.title});

  final String title;

  @override
  State<PantallaFavs> createState() => _PantallaFavsState();
}


class _PantallaFavsState extends State<PantallaFavs>{

  @override
  void initState(){
    super.initState();
    
  }

  void MostrarPersonaje(int listIndex){
    print("pulsado $listIndex");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VisualizarPersonaje(title:"Pantalla Info personaje",personajeRecibido: variablesGlobales.personajesFav[listIndex])));
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Favoritos")),
      body:
            ListView.separated(itemBuilder: (context, index) {
              return ListTile(title: TextButton(onPressed: () => MostrarPersonaje(index),
              child: Text(variablesGlobales.personajesFav[index].name)));
            }, 
            separatorBuilder: (context, index) => const Divider(height: 40), 
            itemCount: variablesGlobales.personajesFav.length),
    );
  }
}