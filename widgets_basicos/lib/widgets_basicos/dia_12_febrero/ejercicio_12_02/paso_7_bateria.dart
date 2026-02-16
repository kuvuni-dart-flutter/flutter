import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';

/// PASO 7: Monitor de Batería en Tiempo Real
/// Demuestra cómo leer datos reales del dispositivo
/// y actualizar la UI según el progreso
class Paso7Bateria extends StatefulWidget {
  const Paso7Bateria({Key? key}) : super(key: key);

  @override
  State<Paso7Bateria> createState() => _Paso7BateriaState();
}

class _Paso7BateriaState extends State<Paso7Bateria> {
  final Battery _battery = Battery();
  
  int nivelBateria = 0;
  bool isLoading = true;
  String estadoBateria = "Leyendo...";

  @override
  void initState() {
    super.initState();
    // Leer la batería cuando carga el widget
    _obtenerNivelBateria();
  }

  Future<void> _obtenerNivelBateria() async {
    try {
      // Obtener el nivel de batería del dispositivo REAL
      int level = await _battery.batteryLevel;
      
      // Actualizar el estado
      setState(() {
        nivelBateria = level;
        isLoading = false;
        
        // Determinar el estado según el porcentaje
        if (level < 20) {
          estadoBateria = "CRÍTICA";
        } else if (level < 50) {
          estadoBateria = "BAJA";
        } else if (level < 80) {
          estadoBateria = "NORMAL";
        } else {
          estadoBateria = "BUENA";
        }
      });
    } catch (e) {
      setState(() {
        estadoBateria = "Error: $e";
        isLoading = false;
      });
    }
  }

  Color _obtenerColor() {
    if (nivelBateria < 20) return Colors.red;
    if (nivelBateria < 50) return Colors.orange;
    if (nivelBateria < 80) return Colors.yellow;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Paso 7: Nivel de Batería Real",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        
        // Mostrar el nivel de batería con una barra
        if (isLoading)
          const SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(),
          )
        else ...[
          // Barra de progreso circular
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: nivelBateria / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _obtenerColor(),
                  ),
                  strokeWidth: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$nivelBateria%",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 70,),
                    Text(
                      estadoBateria,
                      style: TextStyle(
                        fontSize: 14,
                        color: _obtenerColor(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          
          // Barra de progreso lineal alternativa
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
                value: nivelBateria / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  _obtenerColor(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
        
        // Botón para actualizar
        ElevatedButton.icon(
          onPressed: _obtenerNivelBateria,
          icon: const Icon(Icons.refresh),
          label: const Text("Actualizar Batería"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 30),
        
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Datos reales del dispositivo\n"
            "Estamos leyendo la batería VERDADERA de tu teléfono,\n"
            "no simulada. El estado cambia según el porcentaje.",
            style: TextStyle(fontSize: 12, color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
