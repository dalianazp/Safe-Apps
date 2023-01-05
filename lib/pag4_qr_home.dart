import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'pag1_introducccion.dart';
import 'pag3_preguntas_frecuentes.dart';
import 'pag2_pagina_principal.dart';
import 'boton.dart';

class QRHome extends StatelessWidget {

  String imageURL = "assets/img/qr.svg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void bienvenida(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Pag1Introduccion())
    );

    void preguntasFrecuentes(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PreguntasFrecuentes())
    );

    void goToBack(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PaginaPrincipal())
    );

    final image = Container(
      padding: EdgeInsets.all(20),
      child: SvgPicture.asset(imageURL, width: 80,),
    );

    final texto = Container(
      //alignment: Alignment.center,
      //padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 30.0
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 18, fontFamily: "regular", color: Colors.black),
          children: <TextSpan> [
            TextSpan(text: "Escanee el "),
            TextSpan(text: "código QR ", style: TextStyle(fontSize: 18, fontFamily: "bold")),
            TextSpan(text: "que se encuentra en el prototipo web", style: TextStyle(fontSize: 18, fontFamily: "regular"))
          ],
        ),
      ),
    );


    final menuIcon = PopupMenuButton<int>(
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
      offset: Offset(0, 30),
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
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          shadowColor: Color(0xFF666666),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => goToBack(context),
            child: Icon(CupertinoIcons.arrow_left, color: Color(0xFF404040)),
          ),

          // in action widget we have PopupMenuButton
          actions: [
            Row(
              children: [
                menuIcon
              ],
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(
              top: 100
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              image,
              texto,
              //textoOtp,
              Container(
                margin: EdgeInsets.only(top: 200, left: 30, right: 30),
                child: Boton("Escanear"),
              )
            ],
          ),
        ),
        // body with centered text
      ),
    );

  }
}