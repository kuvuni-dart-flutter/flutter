import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyImages2 extends StatelessWidget {
  const MyImages2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formas de crear imágenes")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 10),
            //Imagen desde local
            Image.asset(
              'assets/images/foto.png',
              height: 150,
              width: 150,

              //Propiedades de ajuste:

              // fit: BoxFit.cover,//Escalar la imagen para que cubra todo el espacio disponible
              fit: BoxFit.contain, // Mantiene aspecto, imagen completa
              //fit: BoxFit.fill, //Estira para llenar (deforma)
              //fit: BoxFit.fitWidth, // Ajusta el ancho
              //fit: BoxFit.fitHeight,  // Ajusta el alto
              //fit: BoxFit.scaleDown, //Reducir si es necesario
              // fit: BoxFit.none, //Sin ajuste

              //Alineación

              // alignment: Alignment.center, //Por defecto
              alignment: Alignment.topCenter,

              //Repeticion

              //repeat: ImageRepeat.noRepeat, //Valor por defecto, sin repetición.
              //repeat: ImageRepeat.repeat, //Repite en x e Y
              repeat: ImageRepeat.repeatX, //Repite en el eje de las X
              //repeat: ImageRepeat.repeatY,

              //Renderizado.
              filterQuality:
                  FilterQuality.medium, //low, hight. La calidad de la imagen.

              isAntiAlias: false, //Sin suavizado de bordes.

              semanticLabel: "Descripción imagen", //accesibilidad.
              //Manejo de errores
              errorBuilder: (context, error, stackTrace) {
                return Placeholder();
              },
            ),
            SizedBox(height: 20),

            //Imagenes desde la red.
            Image.network(
              "https://picsum.photos/id/237/4200/3200",
              height: 200,
              width: 200,
              fit: BoxFit.cover,

              //Indicador carga
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[300],
                  child: Icon(Icons.error_outline),
                );
              },
              cacheHeight: 300, //Cachea con altura máxima de 300
              cacheWidth: 300,

              //headers: {Autorization: "BakerToken"}
            ),

            SizedBox(height: 20),

            //Códigos QR con flutter.
            //Libreria qr_flutter
            QrImageView(
              data: 'https://google.com',
              version: QrVersions.auto,
              backgroundColor: Colors.orange,
              size: 200.0,
            ),
            SizedBox(height: 20),

            /* Image.memory(
              base64Decode(
                'iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAGUlEQVR4'
                'nGNgGAWjYBSMglEwCoYZGBgAAAAZAAGKM+MmAAAAAElFTkSuQmCC',
              ),
              height: 150,
              width: 150,
            )*/
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/placeholder.png'),
            ),

            SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/producto.png',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            ClipOval(
              child: Image.asset(
                'assets/images/producto.png',
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            //Container con BoxDecoration

            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10)
                  ],
                  image: DecorationImage(image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                  )
                ),
            ),

            SizedBox(height: 20),

            //Icono desde una imagen

            ImageIcon(
              AssetImage('assets/images/cuernos.png'),
              size: 80,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            //Stack con imagen

            Stack(children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
                fit: .cover
              ),
              Container(
               height: 150,
               width: 150,
               decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
               child: Center(child: Text('Overlay', style: TextStyle(fontSize: 20, color:Colors.white)),)
                )

            ],),

            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
