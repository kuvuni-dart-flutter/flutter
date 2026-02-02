import 'package:flutter/material.dart';

TextStyle miEstilo1 = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  color: // Color(0xFF00FF00),
  Color.fromARGB(
    255,
    64,
    132,
    206,
  ),
  //Colors.orange.shade50,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.underline, //Situación de la línea
  decorationColor: Colors.red, //Color de la línea
  decorationStyle: TextDecorationStyle.wavy, //Tipo de línea
  decorationThickness: 3, //Grosor
  letterSpacing: 2, //Espacio entre letras
  wordSpacing: 10,
  height: 1.5, //Multiplicador de altura
  shadows: [
    Shadow(
      offset: Offset(4, 4), // x e y
      blurRadius: 4, //Desenfoque
      color: const Color.fromARGB(125, 236, 157, 157),
    ),
  ],
);

TextStyle miEstilo2 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w900,
  color: // Color(0xFF00FF00),
  Color.fromARGB(255, 206, 152, 64),
  //Colors.orange.shade50,
  fontStyle: FontStyle.italic,
  decoration: TextDecoration.underline, //Situación de la línea
  decorationColor: Colors.red, //Color de la línea
  decorationStyle: TextDecorationStyle.wavy, //Tipo de línea
  decorationThickness: 3, //Grosor
  letterSpacing: 2, //Espacio entre letras
  wordSpacing: 10,
  height: 1.5, //Multiplicador de altura
  shadows: [
    Shadow(
      offset: Offset(4, 4), // x e y
      blurRadius: 4, //Desenfoque
      color: const Color.fromARGB(125, 236, 157, 157),
    ),
  ],
);
