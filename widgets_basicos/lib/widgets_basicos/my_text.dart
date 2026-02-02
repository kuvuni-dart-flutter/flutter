import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          child: Column(children: [miTexto, richText, 
          miTextRich, miTextoFamily, miTextoFamilyPer]),
        ),
      ),
    );
  }

  //Fuentes personalizadas. https://www.dafont.com/es
  //Extensiones permitidas: ttf y otf. 

  Text miTextoFamilyPer = Text(
    "Hola desde mi fuente personalizada",
    style: TextStyle(
      fontFamily: 'MiFuente',
      fontSize: 40,
    )
  );

  // Google Fonts
  Text miTextoFamily = Text("Hola, Paris" ,
  style: GoogleFonts.laBelleAurore(fontSize: 40)
  );
  
  var richText = RichText(
    text: TextSpan(
      text: "Esto es un texto con",
      style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        TextSpan(
          text: " negrita",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: " incluida"),
      ],
    ),
  );

  Text miTextRich = Text.rich(
    TextSpan(
      //text: "Esto es un texto con",
      //style: TextStyle(color: Colors.black, fontSize: 16),
      children: [
        TextSpan(text: " Esto es un texto"),
        TextSpan(
          text: " negrita\n",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: " incluida"),

      ],
    ),
  );

  //Tipografías.   Google Font. 

  Text miTexto = Text(
    "Buenos dias. hoy es lunes. \nHola mundo, lorem ipsum dsfasdfafadsfasdfdsafdsffasdf",
    textAlign: TextAlign.left, //Centrado del texto
    textDirection: TextDirection.ltr,
    textScaler: TextScaler.linear(0.5), //Escalar
    semanticsLabel: "Texto para lectores de pantalla", //Accesibilidad
    locale: Locale('es', 'ES'),
    //maxLines: 1, //Cantida máxima de líneas
    //Desbordamiento
    //overflow: TextOverflow.ellipsis, //Añade ...
    //overflow: TextOverflow.clip, //Corta el texto
    overflow: TextOverflow.fade,
    //style: miEstilo2,
    style: TextStyle(fontSize: 30),
    // style: miEstilo,
  );
}

TextStyle miEstilo = TextStyle(
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
