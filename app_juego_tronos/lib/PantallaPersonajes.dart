import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';
import 'package:http/http.dart' as http;
import 'package:app_juego_tronos/personajegot.dart';
import 'dart:convert';


class PantallaPersonajes extends StatefulWidget {
  const PantallaPersonajes({super.key, required this.title});

  final String title;

  @override
  State<PantallaPersonajes> createState() => _PantallaPersonajesState();
}


class _PantallaPersonajesState extends State<PantallaPersonajes>{

    @override
    void initState(){
    super.initState();
    
  }

  void getPersonaje() async {

    final url = Uri.parse("https://anapioficeandfire.com/api/characters/7}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Invocando personaje destacado...");
      final json = response.body;
      Personajegot personajes = Personajegot.fromJson(jsonDecode(json));
        
      //personajeAPIGuardar = personaje;
      //comprobarInfo(personaje);

      //personajeAPI = "PERSONAJE DESTACADO: \n\n Nombre: ${personaje.name} \n Genero: ${vacio4 + personaje.gender}\n Fecha Nacimiento: ${vacio1 + personaje.born} \n Fecha de fallecimiento: ${vacio2 + personaje.died} \n Cultura: ${vacio3 + personaje.culture}";
    } else {
      //personajeAPI = "Error al cargar el personaje. Ja ja";
    }
    setState(() {}); // Actualiza la Interfaz de Usuario
  }

  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(title: const Text("Lista de Personajes")),
      body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.start,
          children:[
            const Text("Personajes"),
            
            const Padding(padding: EdgeInsets.all(30)),
            ElevatedButton(onPressed: (){
                print("Pasando a siguiente página...");

              }, child: const Text("Siguiente página")),
          ]
        ),
      ),
    );
  }
}