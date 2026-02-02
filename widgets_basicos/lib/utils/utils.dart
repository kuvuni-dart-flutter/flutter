 import 'package:flutter/material.dart';

Column columna ({required cantidad, required color, double ancho = 10, double alto = 10}){
 
 List<Widget> lista = [];
 for(int x=0; x<cantidad; x++){
  lista.add(Container(
    width: ancho,
    height: alto,
    color: color,
    margin: EdgeInsets.all(10),
    ));
 }

 return Column(
  children: lista,
  
 );
}