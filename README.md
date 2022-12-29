# safeapps

Proyecto de Tesis - Daliana 2022

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Aquí explico paso a paso como que librerías de Flutter se usaron y para qué
    1- Para que cuando se abra la aplicación aparezca la primera pág (fondo azul e ícono)
    se utilizó esta librería: https://pub.dev/packages/flutter_native_splash
    
    Y se hicieron los siguientes pasos:
    Paso 1: Agregar al pubspec.yaml la dependencia: 
        flutter_native_splash: ^2.2.16
    Paso 2: Definir el color de fondo, la imagen y el tipo de dispositivo 
        flutter_native_splash:
            color: "#1B8DE4"
            image: 'assets/img/Group.png'
            ios: true
    Paso 3: Ejecutar el siguiente comando
        flutter pub run flutter_native_splash:create
    Paso 4: Ejecutar el siguiente comando cambiando la ruta (path) con el mío
        flutter pub run flutter_native_splash:create --path=path/to/my/file.yaml

    2- Para las próximas 4 páginas que son la descripción del aplicativo se utilizó
    esta librería: https://pub.dev/packages/introduction_screen

    Y se hicieron los siguientes pasos:
    Paso 1: Agregar al pubspec.yaml la dependencia: 
        introduction_screen: ^3.1.2
        flutter_svg: ^1.1.6  // esta porque en mi caso voy a utilizar una imagen svg en vez de una png
    Paso 2: Crear la clase:
        pag1_introduccion.dart

    3- La página principal donde se van a registrar las aplicaciones del usuario no utilizó ninguna librería
    solo para el App Bar que se utilizó Cupertino para los Icons