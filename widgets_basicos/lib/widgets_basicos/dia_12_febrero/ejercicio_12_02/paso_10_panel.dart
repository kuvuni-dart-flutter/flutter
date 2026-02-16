import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'dart:async';

/// PASO 10: Panel de Control Avanzado
/// Proyecto capstone que integra TODO lo aprendido:
/// - Futures para acciones
/// - Streams para datos en tiempo real
/// - Manejo de estado
/// - Pausa/Reanudación de operaciones
class Paso10PanelControl extends StatefulWidget {
  const Paso10PanelControl({Key? key}) : super(key: key);

  @override
  State<Paso10PanelControl> createState() => _Paso10PanelControlState();
}

class _Paso10PanelControlState extends State<Paso10PanelControl> {
  final Battery _battery = Battery();
  
  // Estado de la descarga
  int descargaProgreso = 0;
  bool descargando = false;
  bool pausada = false;
  late Timer _timerDescarga;
  
  // Streams
  late Stream<int> _bateriaStream;
  
  // Tiempo
  int tiempoTranscurrido = 0;
  int tiempoTotal = 15; // 15 segundos de simulación

  @override
  void initState() {
    super.initState();
    _bateriaStream = Stream.periodic(
      const Duration(seconds: 1),
      (_) => _obtenerBateria(),
    ).asyncMap((future) => future);
  }

  Future<int> _obtenerBateria() async {
    try {
      return await _battery.batteryLevel;
    } catch (e) {
      return 0;
    }
  }

  void _iniciarDescarga() {
    setState(() {
      descargando = true;
      pausada = false;
      descargaProgreso = 0;
      tiempoTranscurrido = 0;
    });

    _timerDescarga = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!pausada && descargando) {
        setState(() {
          descargaProgreso = (descargaProgreso + 1).clamp(0, 100);
          tiempoTranscurrido = ((descargaProgreso / 100) * tiempoTotal * 1000).toInt();

          // Completar cuando llegue a 100%
          if (descargaProgreso >= 100) {
            descargando = false;
            timer.cancel();
          }
        });
      }
    });
  }

  void _pausarDescarga() {
    setState(() {
      pausada = true;
    });
  }

  void _reanudarDescarga() {
    setState(() {
      pausada = false;
    });
  }

  void _cancelarDescarga() {
    _timerDescarga.cancel();
    setState(() {
      descargando = false;
      pausada = false;
      descargaProgreso = 0;
      tiempoTranscurrido = 0;
    });
  }

  int get tiempoRestante => (tiempoTotal * 1000) - tiempoTranscurrido;

  double get velocidadDescarga =>
      descargaProgreso > 0 ? (descargaProgreso / tiempoTranscurrido * 1000) : 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Paso 10: Panel de Control Completo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // SECCIÓN 1: DESCARGA PRINCIPAL
          _buildSeccionDescarga(),

          const SizedBox(height: 30),
          const Divider(thickness: 2),
          const SizedBox(height: 30),

          // SECCIÓN 2: DATOS EN TIEMPO REAL
          _buildSeccionDatos(),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildSeccionDescarga() {
    final porcentajeTexto = "${descargaProgreso.toStringAsFixed(0)}%";
    final tiempoRestanteSegundos = (tiempoRestante / 1000).toStringAsFixed(1);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue[50],
      ),
      child: Column(
        children: [
          const Text(
            "📥 Descargador de Archivos",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Progreso circular
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: descargaProgreso / 100,
                strokeWidth: 8,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  descargaProgreso < 50
                      ? Colors.orange
                      : descargaProgreso < 80
                          ? Colors.blue
                          : Colors.green,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    porcentajeTexto,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    descargando
                        ? pausada
                            ? "⏸️ PAUSADA"
                            : "⬇️ DESCARGANDO"
                        : "✓ COMPLETA",
                    style: TextStyle(
                      fontSize: 12,
                      color: descargaProgreso >= 100 ? Colors.green : Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Información detallada
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  "Tiempo transcurrido:",
                  "${(tiempoTranscurrido / 1000).toStringAsFixed(1)}s",
                ),
                _buildInfoRow(
                  "Tiempo restante:",
                  "$tiempoRestanteSegundos s",
                ),
                _buildInfoRow(
                  "Velocidad:",
                  "${velocidadDescarga.toStringAsFixed(2)}%/s",
                ),
                _buildInfoRow(
                  "Tamaño total:",
                  "157.3 MB",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Botones de control
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: descargando ? null : _iniciarDescarga,
                icon: const Icon(Icons.download),
                label: const Text("Descargar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              ),
              if (descargando && !pausada)
                ElevatedButton.icon(
                  onPressed: _pausarDescarga,
                  icon: const Icon(Icons.pause),
                  label: const Text("Pausar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              if (pausada)
                ElevatedButton.icon(
                  onPressed: _reanudarDescarga,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("Reanudar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              if (descargando)
                ElevatedButton.icon(
                  onPressed: _cancelarDescarga,
                  icon: const Icon(Icons.close),
                  label: const Text("Cancelar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSeccionDatos() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(12),
        color: Colors.purple[50],
      ),
      child: Column(
        children: [
          const Text(
            "📊 Estado del Dispositivo en Tiempo Real",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Batería en tiempo real
          const Text(
            "Batería",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          StreamBuilder<int>(
            stream: _bateriaStream,
            builder: (context, snapshot) {
              int bateria = snapshot.data ?? 0;
              return Column(
                children: [
                  LinearProgressIndicator(
                    value: bateria / 100,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      bateria < 20 ? Colors.red : Colors.green,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("$bateria%"),
                ],
              );
            },
          ),

          const SizedBox(height: 20),

          // Hora actual
          StreamBuilder<int>(
            stream: Stream.periodic(
              const Duration(seconds: 1),
              (_) => DateTime.now().second,
            ),
            builder: (context, snapshot) {
              DateTime ahora = DateTime.now();
              String hora =
                  "${ahora.hour.toString().padLeft(2, '0')}:${ahora.minute.toString().padLeft(2, '0')}:${ahora.second.toString().padLeft(2, '0')}";

              return Column(
                children: [
                  const Text(
                    "Hora del Sistema",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    hora,
                    style: const TextStyle(fontSize: 18, fontFamily: 'Courier'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          Text(
            value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (descargando) {
      _timerDescarga.cancel();
    }
    super.dispose();
  }
}
