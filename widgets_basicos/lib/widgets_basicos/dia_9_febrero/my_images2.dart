import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class MyImages2 extends StatelessWidget {
  const MyImages2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formas de crear imágenes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // === INTRODUCCIÓN ===
            FlutterLogo(size: 100),
            const SizedBox(height: 10),
            // 1. Image.asset()
            const Text('1. Image.asset() - Desde Assets'),
            const SizedBox(height: 10),
            Image.asset(
              'assets/images/foto.png',
              height: 150,
              width: 150,

              // === PROPIEDADES DE AJUSTE ===
              // fit: null,                 // POR DEFECTO - Tamaño original (ignora height/width)
              // fit: BoxFit.cover -> Escala la imagen para que cubra todo el espacio
              // manteniendo la proporción. Si es necesario, recorta partes de la imagen
              // para que encaje perfectamente en el espacio disponible.
              fit: BoxFit.cover,
              // fit: BoxFit.contain,       // Mantiene aspecto, imagen completa
              // fit: BoxFit.fill,          // Estira para llenar (deforma)
              // fit: BoxFit.fitWidth,      // Ajusta al ancho
              // fit: BoxFit.fitHeight,     // Ajusta al alto
              // fit: BoxFit.scaleDown,     // Reduce si es necesario
              // fit: BoxFit.none,          // Sin ajuste

              // === ALINEACIÓN ===
              // alignment: Alignment.center,      // POR DEFECTO - Centro
              alignment: Alignment.topLeft, // Arriba-Izquierda
              // alignment: Alignment.topRight,    // Arriba-Derecha
              // alignment: Alignment.bottomLeft,  // Abajo-Izquierda
              // alignment: Alignment.bottomRight, // Abajo-Derecha

              // === REPETICIÓN ===
              // repeat: ImageRepeat.noRepeat,     // POR DEFECTO - Sin repetición
              // repeat: ImageRepeat.repeat,       // Repite en X e Y
              // repeat: ImageRepeat.repeatX,      // Repite solo en X
              // repeat: ImageRepeat.repeatY,      // Repite solo en Y

              // === RENDERIZADO ===
              // filterQuality: FilterQuality.low,    // Baja calidad (rápido)
              // filterQuality: FilterQuality.medium, // Calidad media
              // filterQuality: FilterQuality.high,   // Alta calidad (lento)
              filterQuality: FilterQuality.high,

              // === OTRAS PROPIEDADES ===
              // color: Colors.blue.withAlpha(20),   // Superpone un color azul semitransparente
              color: Colors.blue.withAlpha(
                20,
              ), // sobre la imagen (alpha=20 es muy tenue)
              // colorBlendMode: BlendMode.overlay,  // Define cómo se mezcla el color con la imagen
              colorBlendMode: BlendMode
                  .overlay, // Overlay crea un efecto de iluminación/sombra
              isAntiAlias: false, // Sin suavizado de bordes
              // semanticLabel: 'Descripción imagen',  // Para accesibilidad

              // === MANEJO DE ERRORES ===
              // errorBuilder: (context, error, stackTrace) {
              //   return const PlaceholderWidget();
              // },
            ),

            const SizedBox(height: 20),

            // 2. Image.network()
            const Text('2. Image.network() - Desde URL'),
            const SizedBox(height: 10),
            Image.network(
              'https://picsum.photos/id/1/200/300',
              height: 150,
              width: 150,
              fit: BoxFit.cover,

              // === INDICADOR DE CARGA ===
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },

              // === MANEJO DE ERRORES ===
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.error_outline)),
                );
              },

              // === OTRAS PROPIEDADES ===
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
              filterQuality: FilterQuality.high,
              // cacheHeight: 300,     // Cachea con altura máxima de 300px
              // cacheWidth: 300,      // Cachea con ancho máximo de 300px
              // headers: {'Authorization': 'Bearer token'},  // Headers HTTP personalizados
            ),
            const SizedBox(height: 20),

            //3. Generar códigos QR con qr_flutter
            const Text('3. Generar QR con qr_flutter'),
            const SizedBox(height: 10),
            // QrImage(
            //   data: 'https://julian.othervision.es/flutter',
            //   version: QrVersions.auto,
            //   size: 150,
            //   gapless: false, // Evita espacios en blanco alrededor del QR
            //   errorCorrectionLevel: QrErrorCorrectLevel.H, // Nivel de corrección
            // ),

            //https://pub.dev/packages/qr_flutter

            // 4. Image.memory()
            const Text('4. Image.memory() - Desde Bytes'),
            const SizedBox(height: 10),
            Image.memory(
              // OK Flutter - Imagen PNG simple codificada en base64
              base64Decode(
                'iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAGUlEQVR4'
                'nGNgGAWjYBSMglEwCoYZGBgAAAAZAAGKM+MmAAAAAElFTkSuQmCC',
              ),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,

              // === MANEJO DE ERRORES ===
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: 150,
                  color: Colors.green[100],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '✓',
                          style: TextStyle(fontSize: 60, color: Colors.green),
                        ),
                        Text(
                          'Flutter',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // 5. Image() con ImageProvider
            const Text('5. Image() - Constructor Genérico'),
            const SizedBox(height: 10),
            Image(
              image: const AssetImage('assets/images/foto.png'),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            const SizedBox(height: 30),

            // === WIDGETS QUE USAN IMÁGENES ===
            const Divider(height: 40),
            const Text('Widgets que usan Imágenes:'),
            const SizedBox(height: 20),

            // 6. CircleAvatar
            const Text('6. CircleAvatar - Avatar Circular'),
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/placeholder.png'),
            ),
            const SizedBox(height: 20),

            // 7.ClipRRect - Imagen con bordes redondeados
            const Text('7. ClipRRect - Bordes Redondeados'),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/producto.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // 8.ClipOval - Imagen oval/circular
            const Text('8. ClipOval - Forma Ovalada'),
            const SizedBox(height: 10),
            ClipOval(
              child: Image.asset(
                'assets/images/perfil.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // 9. Container con BoxDecoration
            const Text('9. Container con Imagen (BoxDecoration)'),
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 10. ImageIcon - Ícono desde imagen
            const Text('10. ImageIcon - Ícono desde Imagen'),
            const SizedBox(height: 10),
            const ImageIcon(
              AssetImage('assets/images/cuernos.png'),
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),

            // 11. Stack con imagen
            const Text('11. Stack - Imagen con Overlay'),
            const SizedBox(height: 10),
            Stack(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
                  child: const Center(
                    child: Text(
                      'Overlay',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
