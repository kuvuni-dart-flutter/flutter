import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio1")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Ejercicio 1
            Center(
              child: Text(
                "¡Bienvenido a Flutter",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Ejercicio 2
            Container(
              width: 200,
              height: 100,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text(
                "Caja Roja",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Ejercicio 3
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.red,
                    // margin: EdgeInsets.all(20),
                    child: Center(child: Text("1")),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.green,
                    child: Center(child: Text("2")),
                  ),
                  SizedBox(width: 20),
                  Container(
                    //margin: EdgeInsets.all(20),
                    width: 80,
                    height: 80,
                    color: Colors.blue,
                    child: Center(child: Text("3")),
                  ),
                ],
              ),
            ),
            //Ejercicio 4
            Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.grey[100],
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.grey[500],
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  color: Colors.grey[700],
                  child: Center(
                    child: Text(
                      "4",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Ejercicio 5
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(20),
                color: Colors.blue,
                child: Text(
                  "Padding 20",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Ejercicio 6
            Container(
              margin: EdgeInsets.all(25),
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Esquinas redondeadas",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Ejercicio 7
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 15)],
              ),

              alignment: Alignment.center,
              child: Text(
                "Borde azul",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            //Ejercicio 8
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.orange.withAlpha(145),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(125),
                    blurRadius: 10,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            //Ejercicio 9
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 7),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Producto",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text("Precio: \$99"),
                ],
              ),
            ),
            SizedBox(height: 20),
            //Ejercicio 10
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: AlignmentGeometry.topLeft, //Opcional
                  end: AlignmentGeometry.bottomRight, //Opcional
                ),
              ),
              child: Center(
                child: Text(
                  "Gradiente",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Ejercicio 11
            Container(
              height: 200,
              width: 200,
              color: Colors.grey[300],
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Alineado a la izquierda", textAlign: TextAlign.left),
                  Text("Centrado", textAlign: TextAlign.center),
                  Text("Alineado derecha", textAlign: TextAlign.right),
                ],
              ),
            ),
            SizedBox(height: 20),
            //Ejercicio 12
            Container(
              width: 150,
              height: 100,

              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
              ),
              child: Text(
                "Este es un texto muy largo que no cabe completamente en el container",
                style: TextStyle(fontSize: 21),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20,),
            //Ejercicio1 13
            Column(children: [
              Text("Negrita y grande",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              )),
              Text("Cursiva",
              style: TextStyle(
                fontSize: 18,
                   fontStyle: FontStyle.italic
              )),
              Text("Color rojo y subrayado",
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                decoration: TextDecoration.underline
              )),
              Text("Tachado",
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.yellow, //Cambiamos el color de la línea
                  decorationThickness: 3, //Cambiaf el ancho de la línea
                  decorationStyle: TextDecorationStyle.double //Estilo de la línea
              )),
              SizedBox(height: 20,),
              //Ejercicio14
              Container(
                width: 100,
                height: 40,
                alignment: AlignmentGeometry.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
               child: Text("NUEVO",
               style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,)
              ),
              SizedBox(height: 20,),
              //Ejercicio 15
              Column(children: List.generate(5, (index){
                return Container(
                  height: 50,
                  width:300,
                  color: index %2 == 0 ? Colors.grey : Colors.white,
                  decoration: BoxDecoration(
                    border: Border(
                     // bottom: //Nos quedamos aquí.
                      
                    ),
                  ),
                );

              }),)
              
            ],)
          ],
        ),
      ),
    );
  }
}
