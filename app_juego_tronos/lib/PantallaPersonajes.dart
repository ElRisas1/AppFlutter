import 'package:app_juego_tronos/visualizarPersonaje.dart';
import 'package:flutter/material.dart';
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

  String cantidadPaginas = "";
  var i = 1;
  

    @override
    void initState(){
    getPersonaje();
    super.initState();

    
  }


  void MostrarPersonaje(int listIndex){  //Llamamos a la pantalla de mostrar el personaje para enviar un personaje y que otra pantalla lo monte
    print("pulsado $listIndex");
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VisualizarPersonaje(title:"Pantalla Info personaje",personajeRecibido: variablesGlobales.personajesListaApi[listIndex])));
  }

  void CargarMas(){
    
    i++;
    cantidadPaginas = "$i";
    getPersonaje();
  }
  
  void getPersonaje() async {

    final url = Uri.parse("https://anapioficeandfire.com/api/characters?page=$cantidadPaginas&pageSize=20");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("Invocando lista personajes...");
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {  //cambiamos el contenido de la lista de personajes api con personajes que no tengan el NOMBRE vacio
        variablesGlobales.personajesListaApi = data
          .map((json) => Personajegot.fromJson(json))
            .where((personaje) => personaje.name.isNotEmpty)
              .toList();
      });      
    } else {
      const Padding(padding: EdgeInsets.all(20),
      child: Text("Ha habido un error"));
    }
    setState(() {}); // Actualiza la Interfaz de Usuario
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:  Text("Página $i de Personajes")), //Barra de arriba que indica el numero de página
      body: Column(
        children: [
          Expanded(
            child: ListView.separated( //Listado de personajes index indica posicion y número
              itemBuilder: (context, index) {
                return ListTile(
                  title: TextButton(
                    onPressed: () => MostrarPersonaje(index),
                    child: Text(variablesGlobales.personajesListaApi[index].name),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 40),
              itemCount: variablesGlobales.personajesListaApi.length,
            ),
          ),

          const Padding(padding: EdgeInsets.all(30)),
          ElevatedButton(  //Botón de cargar más que esta al final de la página
            onPressed: () {
              print("Button CargarMas pressed");
              CargarMas();
            },
            child: const Text("Cargar Mas"),
          ),
          const Padding(padding: EdgeInsets.all(30))
        ],
      ), 
    );
  }
}