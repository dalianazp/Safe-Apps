import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pag1_introducccion.dart';
import 'pag3_preguntas_frecuentes.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();

}

class _PaginaPrincipalState extends State<PaginaPrincipal>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void bienvenida(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Pag1Introduccion())
    );

    void preguntasFrecuentes(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PreguntasFrecuentes())
    );

    //Titulo de la pagina
    final name = Container(
      //padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(30.0),
      child: const Text ("Aplicaciones registradas", style: TextStyle(fontSize: 20.0, fontFamily: "bold",),),
    );

    final textoParaUsuario = Container(
      //padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 70.0, right: 30.0, left: 30.0),
      child: const Text ("Para registrar una aplicación presione el botón de + ubicado en la parte inferior derecha",
        style: TextStyle(fontSize: 16.0, color: Colors.grey, fontFamily: "light",),),
    );


    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          shadowColor: Color(0xFF666666),
          backgroundColor: Colors.white,
          actions: <Widget> [
            PopupMenuButton<int>(
              child: Container(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Color(0xFF404040),
                ),
              ),
              itemBuilder: (context) => [
                // PopupMenuItem 1
                PopupMenuItem(
                  value: 1,
                  // row with 2 children
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.text_bubble, color: Colors.blue), //Color(0xFFBAC0CA),),
                      SizedBox(
                        width: 10,
                      ),
                      Text("¿Cómo funciona?", style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 18.0
                      ),)
                    ],
                  ),

                ),
                // PopupMenuItem 2
                PopupMenuItem(
                  value: 2,
                  // row with two children
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.question_circle, color: Colors.blue), //Color(0xFFBAC0CA),),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Preguntas frecuentes", style: TextStyle(
                          fontFamily: "regular",
                          fontSize: 18.0
                      ),)
                    ],
                  ),
                ),
              ],
              offset: Offset(0, 40),
              color: Colors.white,
              //elevation: 10,
              // on selected we show the dialog box
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  bienvenida(context);
                  // if value 2 show dialog
                } else if (value == 2) {
                  preguntasFrecuentes(context);
                }
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            name,
            textoParaUsuario
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, size: 40.0,),
        ),
      ),
    );
  }
}