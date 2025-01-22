import 'package:app_juego_tronos/PantallaPersonajes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_juego_tronos/PantallaFavs.dart';
import 'package:app_juego_tronos/personajegot.dart';
import 'dart:convert';


class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  late TextField textoTitulo;
  String personajeAPI = "PITO";

  @override
  void initState(){
    getPersonaje();
    super.initState();
    
  }

  void getPersonaje() async {
    final url = Uri.parse("https://anapioficeandfire.com/api/characters/300");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Personajegot personaje = Personajegot.fromJson(jsonDecode(json));
      personajeAPI = "${personaje.name} \n\n ${personaje.gender}";
    } else {
      personajeAPI = "Error al cargar el personaje. Ja ja";
    }
    setState(() {}); // Actualiza la Interfaz de Usuario
  }


  void CambiarPantallaFav(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PantallaFavs(title: "PantallaFavoritosUsuario")));
  }
  void CambiarPantallaPersonaje(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PantallaPersonajes(title: "PantallaPersonajeAPI")));
  }
  


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:
          Center(child:Column(mainAxisAlignment: MainAxisAlignment.start,
            children:[
              const Divider(height: 40),
              const Text("Titulo", style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
             
              const Padding(padding: EdgeInsets.all(60)),
              ElevatedButton(onPressed: (){
                print("Button Fav pressed");
                CambiarPantallaFav();
              }, child: const Text("Favoritos")),
              
              const Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(onPressed: (){
                print("Button char pressed");
                CambiarPantallaPersonaje();
              }, child: const Text("Lista Personajes")),

              const Padding(padding: EdgeInsets.all(15)),
              Text(personajeAPI, style: TextStyle(fontSize: 20, color: const Color.fromARGB(255, 28, 129, 107)),)
            ],
          ) 
        )
      );
  }
}