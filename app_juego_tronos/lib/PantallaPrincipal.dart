import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key, required this.title});

  final String title;

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  late TextField textoTitulo;

  @override
  void initState(){
    super.initState();
    
  }

    void PantallaPrincipal(){
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ))
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
              }, child: const Text("Favoritos")),
              const Padding(padding: EdgeInsets.all(15)),
              ElevatedButton(onPressed: (){
                print("Button char pressed");
              }, child: const Text("Lista Personajes")),
            ],
          ) 
        )
      );
  }
}