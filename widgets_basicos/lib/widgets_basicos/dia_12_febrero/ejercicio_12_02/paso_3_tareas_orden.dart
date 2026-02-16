import 'package:flutter/material.dart';

/// PASO 3: Tres Tareas en Orden (Secuencial)
/// Demuestra cómo ejecutar futures uno después de otro
/// usando encadenamiento y async/await
class Paso3TareasEnOrden extends StatefulWidget {
  const Paso3TareasEnOrden({super.key});

  @override
  State<Paso3TareasEnOrden> createState() => _Paso3TareasEnOrdenState();
}

class _Paso3TareasEnOrdenState extends State<Paso3TareasEnOrden> {
  String paso = "Presiona para empezar";
  bool isLoading = false;
  List<String> pasos = [];

  Future<void> prepararReceta() async {
    setState(() {
      isLoading = true;
      pasos = [];
    });

    try {
      // PASO 1: Calentar agua (2 segundos)
      _agregarPaso("🔥 Calentando agua...");
      await Future.delayed(const Duration(seconds: 6));
      _agregarPaso("✓ Agua caliente");

      // PASO 2: Poner el café (1 segundo)
      _agregarPaso("☕ Poniendo café en la taza...");
      await Future.delayed(const Duration(seconds: 5));
      _agregarPaso("✓ Café puesto");

      // PASO 3: Esperar a que infusione (3 segundos)
      _agregarPaso("⏱️ Esperando a que infusione...");
      await Future.delayed(const Duration(seconds: 8));
      _agregarPaso("✓ ¡Café listo!");

      setState(() {
        paso = "🎉 ¡Receta completada!";
      });
    } catch (e) {
      setState(() {
        paso = "✗ Error: $e";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _agregarPaso(String texto) {
    setState(() {
      pasos.add(texto);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Paso 3: Tareas Secuenciales",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          paso,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: isLoading ? null : prepararReceta,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.coffee),
          label: const Text("Preparar Receta"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 20),
        // Mostrar lista de pasos
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
              color: Colors.blue[50],
            ),
            child: ListView(
              children: pasos
                  .map((paso) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          paso,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Secuencial con await\n"
            "Cada await espera a que termine\n"
            "antes de pasar a la siguiente tarea.",
            style: TextStyle(fontSize: 12, color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
