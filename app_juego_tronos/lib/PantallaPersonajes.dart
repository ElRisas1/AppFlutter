import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';
import 'package:http/http.dart' as http;
import 'package:app_juego_tronos/personajegot.dart';
import 'dart:convert';
import 'variablesGlobales.dart';


class PantallaPersonajes extends StatefulWidget {
  const PantallaPersonajes({super.key, required this.title});

  final String title;

  @override
  State<PantallaPersonajes> createState() => _PantallaPersonajesState();
}


class _PantallaPersonajesState extends State<PantallaPersonajes>{

    String cantidadPersonajes = "?page=1&pageSize=10";

    @override
    void initState(){
    super.initState();
    
  }

  void getPersonaje() async {

    final url = Uri.parse("https://anapioficeandfire.com/api/characters$cantidadPersonajes}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Invocando personaje destacado...");
      final json = response.body;
      Personajegot personajes = Personajegot.fromJson(jsonDecode(json));
        
      variablesGlobales.personajesListaApi.add(personajes);
      
    } else {
      print("Error al cargar el personaje. Ja ja ");
    }
    setState(() {}); // Actualiza la Interfaz de Usuario
  }

  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(title: const Text("Lista de Personajes")),
    body: Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: TextButton(
                  onPressed: () => print("Boton pulsao"),//MostrarPersonaje(index),
                  child: Text(variablesGlobales.personajesListaApi[index].name),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 30),
            itemCount: variablesGlobales.personajesListaApi.length,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print("Button Fav pressed");
            //CambiarPantallaFav();
          },
          child: const Text("Favoritos"),
        ),
      ],
    ),     
    );
  }
}