import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

/// PASO 4: Compartir Contenido
/// Demuestra cómo usar el intent de compartir del sistema
/// sin necesidad de número de teléfono real
class Paso4Compartir extends StatefulWidget {
  const Paso4Compartir({super.key});

  @override
  State<Paso4Compartir> createState() => _Paso4CompartirState();
}

class _Paso4CompartirState extends State<Paso4Compartir> {
  String mensaje = "Presiona para compartir";
  bool isLoading = false;

  Future<void> compartirContenido() async {
    setState(() {
      isLoading = true;
      mensaje = "Abriendo opciones de compartir...";
    });

    try {
      // Crear el contenido a compartir
      const String textoCompartir =
          "¡Mira esta app de Flutter que estoy aprendiendo! "
          "Es para aprender sobre asincronía y acciones reales del teléfono.";

      // Mostrar el dialogo de compartir del sistema
      // Obsoleto:  final resultado = await Share.share(textoCompartir);
      final dir = await getApplicationDocumentsDirectory();
      print(dir);
      
      final result = await SharePlus.instance.share(
        ShareParams(text:textoCompartir,
        files: [XFile('${dir.path}/tareas.json')],
        ),
      );

      // Cuando el usuario complete la acción
      if (result.status == ShareResultStatus.success) {
        setState(() {
          mensaje = "✓ Contenido compartido exitosamente";
          isLoading = false;
        });
      } else if (result.status == ShareResultStatus.dismissed) {
        setState(() {
          mensaje = "✗ El usuario canceló la acción";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        mensaje = "✗ Error: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Paso 4: Compartir en Redes Sociales",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          mensaje,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: isLoading ? null : compartirContenido,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.share),
          label: const Text("Compartir en Redes"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Manejo de respuesta del usuario\n"
            "Detectamos si compartió, canceló o si hubo error.",
            style: TextStyle(fontSize: 12, color: Colors.green),
          ),
        ),
      ],
    );
  }
}
