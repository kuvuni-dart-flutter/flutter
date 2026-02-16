import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

/// PASO 9: Dos Streams Combinados
/// Demuestra cómo usar múltiples Streams que actualizan
/// diferentes partes de la UI en tiempo real
class Paso9DosStreamsCombinados extends StatefulWidget {
  const Paso9DosStreamsCombinados({super.key});

  @override
  State<Paso9DosStreamsCombinados> createState() =>
      _Paso9DosStreamsCombinadsState();
}

class _Paso9DosStreamsCombinadsState
    extends State<Paso9DosStreamsCombinados> {
  final Battery _battery = Battery();

  late Stream<int> _bateriaStream;
  late Stream<double> _velocidadStream;

  @override
  void initState() {
    super.initState();

    // Stream 1: Batería que baja cada segundo
    _bateriaStream = Stream.periodic(
      const Duration(seconds: 1),
      (count) => (100 - (count % 100)).clamp(0, 100),
    );

    // Stream 2: Velocidad de internet simulada
    _velocidadStream = Stream.periodic(
      const Duration(milliseconds: 500),
      (_) => (5 + (DateTime.now().millisecond % 20) / 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Paso 9: Dos Streams en Tiempo Real",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),

          // STREAM 1: BATERÍA
          const Text(
            "📱 Batería del Dispositivo",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          StreamBuilder<int>(
            stream: _bateriaStream,
            builder: (context, snapshot) {
              int bateria = snapshot.data ?? 100;

              return Column(
                children: [
                  Text(
                    "$bateria%",
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 200,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: bateria / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          bateria < 20
                              ? Colors.red
                              : bateria < 50
                                  ? Colors.orange
                                  : Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    bateria < 20
                        ? "⚠️ CRÍTICA"
                        : bateria < 50
                            ? "🔋 BAJA"
                            : "✓ NORMAL",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: bateria < 20
                          ? Colors.red
                          : bateria < 50
                              ? Colors.orange
                              : Colors.green,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 40),
          const Divider(thickness: 2),
          const SizedBox(height: 40),

          // STREAM 2: VELOCIDAD INTERNET
          const Text(
            "📶 Velocidad de Internet",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          StreamBuilder<double>(
            stream: _velocidadStream,
            builder: (context, snapshot) {
              double velocidad = snapshot.data ?? 5.0;
              bool esRapido = velocidad > 4.0;

              return Column(
                children: [
                  Text(
                    "${velocidad.toStringAsFixed(2)} Mbps",
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 200,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: (velocidad / 10).clamp(0.0, 1.0),
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          esRapido ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    esRapido ? "⚡ RÁPIDO" : "🐌 LENTO",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: esRapido ? Colors.green : Colors.orange,
                    ),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 40),

          // INFORMACIÓN EDUCATIVA
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.cyan[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "💡 Concepto: Múltiples Streams\n"
              "Cada Stream actualiza independientemente.\n"
              "Ideal para monitorear varios datos a la vez.",
              style: TextStyle(fontSize: 12, color: Colors.cyan),
            ),
          ),

          const SizedBox(height: 20),

          // EXPLICACIÓN TÉCNICA
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "🔧 Cómo Funciona:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "• Stream 1 emite cada 1000ms (1 segundo)\n"
                  "• Stream 2 emite cada 500ms (0.5 segundos)\n"
                  "• Cada Widget escucha su Stream\n"
                  "• Actualizaciones independientes",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
