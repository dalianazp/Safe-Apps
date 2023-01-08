import 'dart:developer';
import 'dart:io';
import 'pag2_pagina_principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'pag3_preguntas_frecuentes.dart';
import 'pag1_introducccion.dart';


void main() => runApp(const MaterialApp(home: QRViewExample()));

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {


  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }
/*
  final dialogMessage = CupertinoAlertDialog(
    title: const Text("Mensaje de confirmación"),
    content: const Text("¿Estás seguro de querer registrar esta aplicación en el sistema?"),
    actions: <Widget> [
      TextButton(onPressed: () {},
        child: const Text('Cancel')
      ),

    ],
  );

*/
  @override
  Widget build(BuildContext context) {

    void bienvenida(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Pag1Introduccion())
    );

    void preguntasFrecuentes(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PreguntasFrecuentes())
    );

    void goToBack(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => PaginaPrincipal())
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        shadowColor: Color(0xFF666666),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => goToBack(context),
          child: Icon(CupertinoIcons.arrow_left, color: Color(0xFF404040)),
        ),
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
        children: <Widget>[
          _buildQrView(context),
          Container(
            margin: EdgeInsets.only(top: 500, right: 60, left: 60),
            child: Text("Coloque el código QR dentro de las líneas azules", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: "light"), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Column(
            children: [
              Center(
                child: Icon(
                  (CupertinoIcons.check_mark_circled),
                  color: Colors.green,
                  size: 50,
                ),
              ),
              Center(
                child: const Text(
                  'Mensaje de confirmación',
                  style: TextStyle(
                      fontFamily: "bold",
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
          content: const Text('¿Está seguro de registrar esta aplicación?', style: TextStyle(fontFamily: "regular", fontSize: 16)),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              /// This parameter indicates this action is the default,
              /// and turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No', style: TextStyle(fontFamily: "regular", color: Colors.black),),
            ),
            CupertinoDialogAction(
              /// This parameter indicates the action would perform
              /// a destructive action such as deletion, and turns
              /// the action's text color to red.
              isDestructiveAction: true,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaPrincipal()));
              },
              child: const Text('Registrar', style: TextStyle(fontFamily: "bold", color: Colors.blue),),
            ),
          ],
        )
    );
  }


  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Color(0xFF1B8DE4),
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 20,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if ('${result!.code}' == null) {
          debugPrint('Failed to scan Barcode');
        } else {
          print('El QR escaneado es: ${result!.code}');
          //_dialogMessage(context);
          _showAlertDialog(context);
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

