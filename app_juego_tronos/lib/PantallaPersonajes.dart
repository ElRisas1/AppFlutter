import 'package:flutter/material.dart';
import 'PantallaPrincipal.dart';


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

  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Personajes")
          ]
        ),
      ),
    );
  }
}