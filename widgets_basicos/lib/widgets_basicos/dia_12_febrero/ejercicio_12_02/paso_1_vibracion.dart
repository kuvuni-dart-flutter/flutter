import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

/// PASO 1: Vibración Simple
/// Demuestra una acción asincrónica básica usando Future
class Paso1Vibracion extends StatefulWidget {
  const Paso1Vibracion({super.key});

  @override
  State<Paso1Vibracion> createState() => _Paso1VibracionState();
}

class _Paso1VibracionState extends State<Paso1Vibracion> {
  String mensaje = "Presiona para vibrar";
  bool isLoading = false;

  Future<void> hacerVibrar() async {
    // Verificar si el dispositivo soporta vibración
    bool? canVibrate = await Vibration.hasVibrator();
    
    if (canVibrate) {
      setState(() {
        isLoading = true;
        mensaje = "¡Vibrando...";
      });

      // Hacer vibrar durante 500ms (tiempo REAL, no simulado)
      await Vibration.vibrate(duration: 500);

      // Cuando termine, actualizar el estado
      setState(() {
        isLoading = false;
        mensaje = "✓ Vibración completada";
      });
    } else {
      setState(() {
        mensaje = "✗ El dispositivo no soporta vibración";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Paso 1: Vibración Asincrónica",
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
          onPressed: isLoading ? null : hacerVibrar,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.vibration),
          label: const Text("Vibrar 500ms"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Esto es un Future\nEl código espera a que termine\ny luego sigue ejecución",
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
