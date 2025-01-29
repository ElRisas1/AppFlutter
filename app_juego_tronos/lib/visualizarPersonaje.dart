import 'package:app_juego_tronos/personajegot.dart';
import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';


class VisualizarPersonaje extends StatefulWidget {
  const VisualizarPersonaje({super.key, required this.title, required this.personajeRecibido});

  final String title;
  final Personajegot personajeRecibido;

  @override
  State<VisualizarPersonaje> createState() => _VisualizarPersonajeState();
}


class _VisualizarPersonajeState extends State<VisualizarPersonaje>{

  
  var vacio1 = "";
  var vacio2 = "";
  var vacio3 = "";
  var vacio4 = "";

  @override
  void initState(){
    super.initState();
    comprobarInfo(widget.personajeRecibido);
  }


  void comprobarInfo(Personajegot personaje) async{
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



  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(title: Text("Información de ${widget.personajeRecibido.name}"),),
      body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center, 
          children:[
            Text("Nombre: ${widget.personajeRecibido.name} \n Genero: ${vacio4 + widget.personajeRecibido.gender}\n Fecha Nacimiento: ${vacio1 + widget.personajeRecibido.born} \n Fecha de fallecimiento: ${vacio2 + widget.personajeRecibido.died} \n Cultura: ${vacio3 + widget.personajeRecibido.culture}",
            style: const TextStyle(fontSize: 20, color: Colors.deepOrange),)
          ]
        ),
      ),
    );
  }
}