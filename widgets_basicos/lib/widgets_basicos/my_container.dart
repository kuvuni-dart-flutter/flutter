import 'package:flutter/material.dart';
import 'package:widgets_basicos/utils/utils.dart';

class MyContainer extends StatelessWidget {
  MyContainer({super.key, required this.titulo});

  double porcentaje = 0.1;
  String titulo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(titulo)),
    body: Center(
     // child: columna(cantidad: 10, color: Colors.orange, ancho: 40, alto: 40),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Text("Contenido de container"),
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*0.2,
            alignment: Alignment.topCenter,
           //color: Colors.yellowAccent,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 255, 0),
              border: Border.all(width:5, color: Colors.orange),
              borderRadius: BorderRadius.circular(100),
            /*  borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(80)
                ),*/
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(123),
                  offset: Offset(10,10),
                  blurRadius: 10,
                ),
              ],
          ),
          //padding: EdgeInsets.all(30),
          // padding: EdgeInsets.only(left: 20, top: 13),
          padding: EdgeInsets.symmetric(
            vertical: 50,  //padding Top y Bottom
            horizontal: 30,
          ),
          margin: EdgeInsets.only(
            bottom: 20,
          ),
          
              ),
       /*   SizedBox(
              height: 20,
          ),*/
         Transform.translate(
          offset: Offset(-20, -200),

            child: Transform.scale(
              scale: 1.3,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
                  
               //Transformación (rotación, escala, translación)
               //Rotación
               //transform: Matrix4.identity()..rotateZ(1)//en radianes
               //transform: Matrix4.identity()..scale(0.5)
               transform: Matrix4.translationValues(40, -20, 0),
               ),
            ),
          ),
   
          
        ],
      ),
      
    ),
    );
  }

  
}
var miContenedor = Container();
