import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// PASO 2: Hacer una Llamada Telefónica
/// Demuestra cómo abrir otra aplicación (la de teléfono)
/// y manejar errores si algo falla
class Paso2Llamada extends StatefulWidget {
  const Paso2Llamada({super.key});

  @override
  State<Paso2Llamada> createState() => _Paso2LlamadaState();
}

class _Paso2LlamadaState extends State<Paso2Llamada> {
  String mensaje = "Presiona para ejecutar";
  bool isLoading = false;

  Future<void> hacerLlamada(String numeroTelefono) async {
    setState(() {
      isLoading = true;
      mensaje = "Iniciando llamada...";
    });

    try {
      // Crear la URL para hacer una llamada
      final Uri uri = Uri(scheme: 'tel', path: numeroTelefono);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      // Verificar si se puede hacer la llamada
      /*if (await canLaunchUrl(uri)) {
        // Lanzar la aplicación de teléfono. //No funciona en muchos dispositivos.
        
        
        // Cuando el usuario regrese de la llamada
        setState(() {
          mensaje = "✓ Llamada completada (usuario regresó)";
          isLoading = false;
        });
      } else {
        setState(() {
          mensaje = "✗ No se puede hacer llamadas en este dispositivo";
          isLoading = false;
        });
      }*/
      setState(() {
        isLoading = false;
        mensaje = "Ejecución terminada";
      });
    } catch (e) {
      setState(() {
        mensaje = "✗ Error: $e";
        isLoading = false;
      });
    }
  }

  Future<void> enviarWhastsApp(String numeroTelefono, String texto) async {
    setState(() {
      isLoading = true;
      mensaje = "Enviando Whastapp ...";
    });

    try {
      // Crear la URL para enviar mensaje
      final String encodedMessage = Uri.encodeComponent(texto);
      final Uri uri = Uri.parse(
        'https://wa.me/${numeroTelefono.replaceAll("+", "")}?text=$encodedMessage',
      );
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      setState(() {
        isLoading = false;
        mensaje = "Ejecución terminada";
      });
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
          "Paso 2: Llamada Telefónica",
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
          onPressed: isLoading ? null : () => hacerLlamada('+34678529060'),
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.phone),
          label: const Text("Llamar: +34 678 52 90 60"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        SizedBox(height: 30,),
        const Text(
          "Mandar WhastApp",
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
          onPressed: isLoading
              ? null
              : () => enviarWhastsApp('+34678529060', "Hola desde Flutter"),
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.phone),
          label: const Text("Enviando mensaje: +34 678 52 90 60"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.orange[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Intent a otra app\nTu app cede el control al sistema.\n"
            "No sabes cuándo regresará el usuario.",
            style: TextStyle(fontSize: 12, color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
