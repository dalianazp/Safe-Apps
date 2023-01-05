import 'package:flutter/material.dart';

class Boton extends StatelessWidget {

  String buttonText = "Enviar";
  Boton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar (
            SnackBar(
              content: Text("OTP enviado exitosamente!"),
            )
        );
      },
      child: Container (
        margin: EdgeInsets.only(
            top: 180.0,
            left: 10.0,
            right: 10.0,
            bottom: 10.0
        ),
        height: 50.0,
        width: 500.0,
        decoration: BoxDecoration (
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.blue
        ),
        child: Center (
          child: Text (
            buttonText,
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "regular",
                color: Colors.white
            ),
          ),
        ),
      ),
    );

  }
}