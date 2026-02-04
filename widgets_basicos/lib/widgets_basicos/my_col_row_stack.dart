import 'dart:math';

import 'package:flutter/material.dart';

class MyColRowStack extends StatelessWidget {
  const MyColRowStack({super.key});

  @override
  Widget build(BuildContext context) {
    Container columna1 = Container(
      color: Colors.amberAccent,
      height: 80,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.blue),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start, //Por defecto, alinea en la parte superior.
          //  mainAxisAlignment: MainAxisAlignment.center, //Alinea en el centro
          // mainAxisAlignment:MainAxisAlignment.spaceBetween, //Espacio entre elementos
          //mainAxisAlignment: MainAxisAlignment.spaceAround, //Espacio alrededor de los elementos
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Espaciado uniforme

          //crossAxisAlignment: CrossAxisAlignment.center, //Por defecto, elementos centrados horizontalmente
          //crossAxisAlignment: CrossAxisAlignment.start ,//Alinea a la izquierda
          //crossAxisAlignment: CrossAxisAlignment.end,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //Expande al ancho disponible
          // crossAxisAlignment: CrossAxisAlignment.baseline, //Alinea a linea base

          //mainAxisSize: MainAxisSize.max, //Ocupa el máximo espacio disponible en el eje principal //Por defecto.
          //mainAxisSize: MainAxisSize.min, //Ocupa solo el espacio necesario para sus hijos
          children: [
            Text("COL: Disposición vertical"),
            SizedBox(height: 2),
            Text("Organiza elemenos de forma vertical"),
            SizedBox(height: 2),
            Text("Otro elemento"),
          ],
        ),
      ),
    );

    //Flexible vs Expanded
    Container columna2 = Container(
      color: Colors.purpleAccent,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center, //Expande al ancho disponible
        children: [
          Text("Usando flexible"),
          Flexible(
            flex: 2,
           // fit: FlexFit.loose, //Se ajusta al contenido
            fit: FlexFit.tight, //Se expande
            child: Container(child: Text("Usando flexible"), color: Colors.brown,)),

          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Container(child: Text("Organiza elemenos de forma vertical"), color: Colors.lightBlue)),

          Flexible(
            flex:2,
            fit: FlexFit.tight,
            child: Container(child: Text("Otro elemento"), color: Colors.yellowAccent)),
          Text("Final de la columna"),
        ],
      ),
    );

    Container fila1 = Container(
      color: Colors.purpleAccent,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //Expande al ancho disponible
        children: [
  
          Container(child: Text("12", style:TextStyle(fontSize: 23)), color: Colors.brown, ),
          VerticalDivider(),
          Expanded(
            flex:4,
            child: Container(child: Text("2",style:TextStyle(fontSize: 23)), color: Colors.lightBlue)),
          SizedBox(width: 5,),
          Expanded(
            flex:2,
            child: Container(child: Text("3",style:TextStyle(fontSize: 23)), color: Colors.yellowAccent)),
        
        ],
      ),
    );

    double anchoPantalla = MediaQuery.of(context).size.width;
    double altoPantalla = MediaQuery.of(context).size.height;

    Container stack1 = Container(
      color: Colors.grey,
      width: anchoPantalla/2,
      height: 250,
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Container( width: double.maxFinite, height: double.maxFinite, color: Colors.orangeAccent, padding: EdgeInsets.only(top: 20, left: 40), child: Text("Fondo del Stack")),
          Positioned(
            top:25,
            right: 25,
            child: Container (width:100, height: 100, decoration: BoxDecoration(color: Colors.blueAccent, shape: BoxShape.circle),)),
          Positioned(
            width: 100,
            height: 25 ,
            bottom: -10,
            child: Container( width: 90, height: 30, color: Colors.yellowAccent, child: Center(child: Text("Etiqueta")))),
       
        ],
      )
    );

    List<Widget> listaChip = List.generate(20, (index)=> Chip(label:Text('${Random().nextInt(100)}')));
    List<Widget> listaChip2 = List.filled(20, (Chip(label:Text("Otros"))));


    Wrap wrap1 = Wrap(
      children: listaChip2,
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Column, Row & Stack"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            margin: EdgeInsets.all(18),
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(height: 7),
                Text("Ejemplos de columnas"),
                Divider(
                  color: Colors.blue,
                  thickness: 4,
                  height: 25,
                  indent: 15,
                  endIndent: 15,
                ),
                Text("Primer hijo"),
                Divider(),
                Text("Segundo hijo"),
               // Divider(),
               // columna1,
                Divider(),
                //columna2,
                fila1,
                Divider(),
                stack1,
                Wrap(
                  children: (){
                    List<Widget> lista = [];
                    lista.add(Text("Texto desde lista"));
                    lista.add(SizedBox(width: 30,));
                     lista.add(Text("Otro texto desde lista"));
                    return lista;
                  }.call()
                ),
               // wrap1,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
