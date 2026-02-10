import 'package:flutter/material.dart';
import 'package:widgets_basicos/widgets_basicos/dia_9_febrero/my_lesson_header.dart';
import 'package:widgets_basicos/widgets_basicos/dia_9_febrero/my_navigation_button.dart';
import 'package:widgets_basicos/widgets_basicos/my_col_row_stack.dart';
import 'package:widgets_basicos/widgets_basicos/my_text.dart';

class Dia92 extends StatelessWidget {
  const Dia92({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Más widgets",),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Header:
            MyLessonHeader(fecha: 'Lunes, 9 de febrero', 
            titulo: "Enrutamiento, snackbar, images, listview, scaffold",
            color: Colors.blue,
            icono: Icons.navigation),
            SizedBox(height: 50,),
            ElevatedButton.icon(onPressed: (){
             /* Navigator.push( //Navigator.pop(), volver a la página anterior.
                context,
                MaterialPageRoute(builder: (context) => MyColRowStack())
              );*/
              Navigator.pushNamed(context, "/snackbar");
            }, 
            label: Text("Ejemplo básico (Navigation.push)",
            style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12
              )
            )
            ),
            SizedBox(height: 20,),
            //Mi snackbar.
            MyNavigationButton(icon: Icons.view_quilt, title: "Scaffold", description: "Exploracion widget Scaffold", 
            color: Colors.blueAccent, routeName: '/scaffold', context: context),
            SizedBox(height: 20,),
            MyNavigationButton(icon: Icons.image, title: "Imágenes", description: "Exploracion imágenes", 
            color: Colors.blueAccent, routeName: '/images', context: context),
            SizedBox(height: 20,),
            MyNavigationButton(icon: Icons.image, title: "ListView", description: "Exploracion de List View", 
            color: Colors.blueAccent, routeName: '/listView', context: context),

          ],
        )
      )
    );
  }
}