import 'package:flutter/material.dart';
import 'dart:math';

/// PASO 5: Manejo de Errores en Operaciones Asincrónicas
/// Demuestra cómo manejar excepciones en futures
/// usando try/catch y catchError
class Paso5ManejoErrores extends StatefulWidget {
  const Paso5ManejoErrores({super.key});

  @override
  State<Paso5ManejoErrores> createState() => _Paso5ManejoErroresState();
}

class _Paso5ManejoErroresState extends State<Paso5ManejoErrores> {
  String resultado = "Presiona para intentar instalar";
  bool isLoading = false;
  int intentos = 0;

  Future<void> instalarAplicacion() async {
    setState(() {
      isLoading = true;
      intentos++;
      resultado = "Instalando aplicación (intento $intentos)...";
    });

    try {
      // Simular proceso de instalación que puede fallar
      await Future.delayed(const Duration(seconds: 2));

      // 60% de probabilidad de éxito, 40% de fallo
      final random = Random();
      if (random.nextDouble() > 0.6) {
        // FALLO: Lanzar una excepción
        throw Exception("Error de descarga: Conexión interrumpida");
      }

      // ÉXITO
      setState(() {
        resultado = "✓ ¡Aplicación instalada exitosamente!";
      });
    } on SocketException {
      setState(() {
        resultado = "✗ Error: Sin conexión a internet";
      });
    } catch (e) {
      // Capturar cualquier otro error
      setState(() {
        resultado = "✗ Error: $e";
      });
    } finally {
      setState(() {
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
          "Paso 5: Manejo de Errores",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: resultado.startsWith("✗") ? Colors.red[100] : Colors.green[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: resultado.startsWith("✗") ? Colors.red : Colors.green,
            ),
          ),
          child: Column(
            children: [
              Text(
                resultado,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: resultado.startsWith("✗") ? Colors.red : Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Intentos: $intentos",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: isLoading ? null : instalarAplicacion,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.download),
          label: const Text("Instalar App"),
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
            "💡 Concepto: Try/Catch en Futures\n"
            "Las operaciones pueden fallar.\n"
            "Siempre maneja errores con try/catch.",
            style: TextStyle(fontSize: 12, color: Colors.orange),
          ),
        ),
      ],
    );
  }
}

// Excepción personalizada
class SocketException implements Exception {
  final String message;
  SocketException(this.message);

  @override
  String toString() => message;
}
