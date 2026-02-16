import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

/// PASO 8: Stream de Batería (Actualización Continua)
/// Demuestra cómo usar Streams para recibir actualizaciones
/// de datos del dispositivo en tiempo real (cada 1 segundo)
class Paso8StreamBateria extends StatefulWidget {
  const Paso8StreamBateria({Key? key}) : super(key: key);

  @override
  State<Paso8StreamBateria> createState() => _Paso8StreamBateriaState();
}

class _Paso8StreamBateriaState extends State<Paso8StreamBateria> {
  final Battery _battery = Battery();
  
  late Stream<int> _bateriaStream;
  int nivelActual = 0;
  List<int> historial = [];

  @override
  void initState() {
    super.initState();
    // Crear un Stream que emite el nivel de batería cada segundo
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

  Color _obtenerColor(int nivel) {
    if (nivel < 20) return Colors.red;
    if (nivel < 50) return Colors.orange;
    if (nivel < 80) return Colors.yellow;
    return Colors.green;
  }

  String _obtenerEstado(int nivel) {
    if (nivel < 20) return "CRÍTICA ⚠️";
    if (nivel < 50) return "BAJA 🔋";
    if (nivel < 80) return "NORMAL ✓";
    return "EXCELENTE ⭐";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Paso 8: Stream de Batería",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        
        // Stream principal - actualiza cada segundo
        StreamBuilder<int>(
          stream: _bateriaStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            int nivel = snapshot.data ?? 0;
            nivelActual = nivel;

            // Agregar al historial si cambió
            if (historial.isEmpty || historial.last != nivel) {
              if (historial.length > 10) {
                historial.removeAt(0);
              }
              historial.add(nivel);
            }

            return Column(
              children: [
                // Medidor grande
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: nivel / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _obtenerColor(nivel),
                        ),
                        strokeWidth: 8,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$nivel%",
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 65,),
                          Text(
                            _obtenerEstado(nivel),
                            style: TextStyle(
                              fontSize: 12,
                              color: _obtenerColor(nivel),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // Gráfico de historial
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Historial de los últimos 10 segundos:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      // Mini gráfico
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: historial
                            .map(
                              (nivel) => Tooltip(
                                message: "$nivel%",
                                child: Column(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: (nivel / 100) * 80,
                                      decoration: BoxDecoration(
                                        color: _obtenerColor(nivel),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Actualizaciones: ${historial.length}",
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        
        const SizedBox(height: 30),
        
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Stream Periódico\n"
            "Emite un nuevo valor cada 1 segundo.\n"
            "Ideal para monitorear datos en tiempo real.",
            style: TextStyle(fontSize: 12, color: Colors.purple),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
