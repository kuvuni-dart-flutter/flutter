import 'package:flutter/material.dart';

/// SOLUCIÓN: Dashboard de Estadísticas Avanzado
/// Solo Column, Row y Stack - Ejercicio de Composición de Layouts
///
/// Este dashboard demuestra cómo crear interfaces complejas usando solo
/// los tres widgets de layout fundamentales: Column, Row y Stack

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos del dashboard
    const int usuariosActivos = 1234;
    const double ingresos = 45600.50;
    const int tasaConversion = 78;
    const int cambioUsuarios = 12;
    const int cambioIngresos = -5;
    const int cambioConversion = 23;

    const List<int> datosGrafico = [65, 42, 78, 91, 55];
    const List<String> diasSemana = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'];

    const List<Map<String, dynamic>> transacciones = [
      {'id': '#1001', 'monto': '125.50€', 'estado': 'Completado'},
      {'id': '#1002', 'monto': '89.99€', 'estado': 'Pendiente'},
      {'id': '#1003', 'monto': '234.75€', 'estado': 'Cancelado'},
      {'id': '#1004', 'monto': '456.00€', 'estado': 'Completado'},
      {'id': '#1005', 'monto': '178.25€', 'estado': 'Pendiente'},
    ];

    return Scaffold(
      // ============================================================
      // HEADER
      // ============================================================
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Dashboard'),
     ),

      // ============================================================
      // BODY: CONTENIDO PRINCIPAL
      // ============================================================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ============================================================
              // SECCIÓN 1: KPI CARDS (Row con 3 Cards)
              // ============================================================
              const Text(
                'Métricas principales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  // Card 1: Usuarios Activos
                  Expanded(
                    child: _buildKPICard(
                      icon: Icons.people,
                      iconColor: Colors.blue,
                      valor: '$usuariosActivos',
                      etiqueta: 'Usuarios activos',
                      cambio: cambioUsuarios,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Card 2: Ingresos
                  Expanded(
                    child: _buildKPICard(
                      icon: Icons.euro,
                      iconColor: Colors.green,
                      valor: ingresos.toStringAsFixed(0),
                      etiqueta: 'Ingresos',
                      cambio: cambioIngresos,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Card 3: Conversión
                  Expanded(
                    child: _buildKPICard(
                      icon: Icons.trending_up,
                      iconColor: Colors.orange,
                      valor: '$tasaConversion%',
                      etiqueta: 'Conversión',
                      cambio: cambioConversion,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ============================================================
              // SECCIÓN 2: GRÁFICO DE BARRAS (Stack + Row)
              // ============================================================
              const Text(
                'Desempeño semanal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Stack(
                children: [
                  // Fondo del gráfico
                  Container(
                    width: double.maxFinite,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Row con las barras
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              datosGrafico.length,
                              (index) => _buildGraficoBar(
                                valor: datosGrafico[index],
                                dia: diasSemana[index],
                                color: _getColoresBarras()[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // ============================================================
              // SECCIÓN 3: TABLA DE TRANSACCIONES (Column + Row)
              // ============================================================
              const Text(
                'Últimas transacciones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    // Header de la tabla
                    Container(
                      color: Colors.teal,
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'ID',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Cantidad',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Estado',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Filas de datos
                    ...List.generate(
                      transacciones.length,
                      (index) {
                        final transaccion = transacciones[index];
                        return Column(
                          children: [
                            _buildTableRow(
                              id: transaccion['id'],
                              monto: transaccion['monto'],
                              estado: transaccion['estado'],
                            ),
                            if (index < transacciones.length - 1)
                              const Divider(height: 1, indent: 12, endIndent: 12),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MÉTODOS AUXILIARES PRIVADOS
  // ============================================================

  /// Construye una tarjeta KPI (Key Performance Indicator)
  Widget _buildKPICard({
    required IconData icon,
    required Color iconColor,
    required String valor,
    required String etiqueta,
    required int cambio,
    String cambioTexto = '',
  }) {
    bool esPositivo = cambio >= 0;
    Color cambioColor = esPositivo ? Colors.green : Colors.red;
    String cambioSymbol = esPositivo ? '↑' : '↓';

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono
            Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
            const SizedBox(height: 8),
            // Valor principal
            Text(
              valor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            // Etiqueta
            Text(
              etiqueta,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            // Cambio
            Row(
              children: [
                Text(
                  '$cambioSymbol ${cambio.abs()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: cambioColor,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  cambioTexto,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Construye una barra del gráfico con valor mostrado
  Widget _buildGraficoBar({
    required int valor,
    required String dia,
    required Color color,
  }) {
    // Altura máxima de la barra (150 pixels)
    const double alturaMaxima = 150;
    // Altura proporcional según el valor
    double alturaBarra = (valor / 100) * alturaMaxima;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Valor sobre la barra
        SizedBox(
          height: 20,
          child: Text(
            '$valor%',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        // Barra con altura específica
        Container(
          width: 30,
          height: alturaBarra,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 8),
        // Etiqueta del día
        Text(
          dia,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  /// Construye una fila de la tabla
  Widget _buildTableRow({
    required String id,
    required String monto,
    required String estado,
  }) {
    Color estadoColor = Colors.green;
    if (estado == 'Pendiente') {
      estadoColor = Colors.orange;
    } else if (estado == 'Cancelado') {
      estadoColor = Colors.red;
    }

    String estadoSymbol = '✓';
    if (estado == 'Pendiente') {
      estadoSymbol = '⏱';
    } else if (estado == 'Cancelado') {
      estadoSymbol = '✗';
    }

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              id,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              monto,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  estadoSymbol,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: estadoColor,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  estado,
                  style: TextStyle(
                    fontSize: 12,
                    color: estadoColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Construye un botón del footer
  Widget _buildFooterButton({
    required IconData icon,
    required String label,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: Colors.teal,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.teal,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// Retorna los colores para las barras del gráfico
  List<Color> _getColoresBarras() {
    return [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];
  }
}
