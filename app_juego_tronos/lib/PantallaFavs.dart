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

  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Favoritos")
          ]
        ),
      ),
    );
  }
}