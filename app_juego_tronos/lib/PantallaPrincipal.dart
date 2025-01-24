import 'dart:math';

import 'package:app_juego_tronos/PantallaPersonajes.dart';
import 'package:app_juego_tronos/variablesGLobales.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_juego_tronos/PantallaFavs.dart';
import 'package:app_juego_tronos/personajegot.dart';
import 'dart:convert';

import 'package:app_juego_tronos/variablesGlobales.dart';
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  late TextField textoTitulo;
  String personajeAPI = "PITO";
  var vacio1 = "";
  var vacio2 = "";
  var vacio3 = "";
  var vacio4 = "";
 


  @override
  void initState(){
    getPersonaje();
    super.initState();
    
  }

  int randomNumber(){
     int numero = Random().nextInt(2135);
   
    return numero;
  }

  void comprobarInfo(Personajegot personaje){
    if (personaje.born == ""){  
        vacio1 = "No existe registro de nacimiento";
      }
      if (personaje.died == ""){
        vacio2 = "No existe registro de fallecimiento";
      }
      if (personaje.culture ==""){
        vacio3 = "No existe registro de cultura";
      }
      if (personaje.gender ==""){
        vacio4 = "No existe registro genero";
      }
  }

  void getPersonaje() async {
    final url = Uri.parse("https://anapioficeandfire.com/api/characters/${randomNumber()}");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Invocando personaje destacado...");
      final json = response.body;
      Personajegot personaje = Personajegot.fromJson(jsonDecode(json));
      
      comprobarInfo(personaje);

      personajeAPI = "PERSONAJE DESTACADO: \n\n Nombre: ${personaje.name} \n Genero: ${vacio4 + personaje.gender}\n Fecha Nacimiento: ${vacio1 + personaje.born} \n Fecha de fallecimiento: ${vacio2 + personaje.died} \n Cultura: ${vacio3 + personaje.culture}";
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
              const Divider(height: 50),
              Text("Personajes de Juegos de Tronos", style: const TextStyle(fontSize: 20, color: Colors.deepPurple)),

              const Padding(padding: EdgeInsets.all(40)),
              Text(personajeAPI, style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 28, 129, 107))),

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
            ],
          ) 
        )
      );
  }
}