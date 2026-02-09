import 'package:flutter/material.dart';

/// 🍽️ SOLUCIÓN: APP DE RESTAURANTE
/// 
/// NIVEL: Medio
/// DURACIÓN: 2-3 horas
/// CONCEPTOS: Routing, Scaffold, SnackBars, ListViews, Widgets Personalizados
/// 
/// FUNCIONALIDADES:
/// ✅ Navegar entre 3 tabs (Menú, Pedidos, Reservas)
/// ✅ Menú lateral (Drawer) con navegación
/// ✅ Lista dinámmica de platos con ListView.builder
/// ✅ Historial de pedidos con detalles
/// ✅ Gestión de reservas (crear, cancelar)
/// ✅ Routing nombrado a pantalla de detalles
/// ✅ Múltiples SnackBars confirmando acciones
/// ✅ Widgets personalizados reutilizables
/// 
/// ═════════════════════════════════════════════════════════════════════════

// Modelos de datos
class Plato {
  final String id;
  final String nombre;
  final String descripcion;
  final double precio;
  final IconData icono;

  Plato({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.icono,
  });
}

class Pedido {
  final String numero;
  final DateTime fecha;
  final String estado; // "En preparación", "En camino", "Entregado"
  final List<Plato> platos;
  final double total;

  Pedido({
    required this.numero,
    required this.fecha,
    required this.estado,
    required this.platos,
    required this.total,
  });

  Color getColorEstado() {
    switch (estado) {
      case "En preparación":
        return Colors.red;
      case "En camino":
        return Colors.orange;
      case "Entregado":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData getIconoEstado() {
    switch (estado) {
      case "En preparación":
        return Icons.schedule;
      case "En camino":
        return Icons.local_shipping;
      case "Entregado":
        return Icons.check_circle;
      default:
        return Icons.help;
    }
  }
}

class Reserva {
  final String id;
  String nombre;
  DateTime fecha;
  int personas;
  bool cancelada;

  Reserva({
    required this.id,
    required this.nombre,
    required this.fecha,
    required this.personas,
    this.cancelada = false,
  });
}

// Punto de entrada
void main() {
  runApp(const MiRestauranteApp());
}

// ═════════════════════════════════════════════════════════════════════════
// APP PRINCIPAL
// ═════════════════════════════════════════════════════════════════════════

class MiRestauranteApp extends StatelessWidget {
  const MiRestauranteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Restaurante',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/detalle': (context) => const PedidoDetalleScreen(),
      },
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// PANTALLA HOME: Menú, Pedidos, Reservas
// ═════════════════════════════════════════════════════════════════════════

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  // Datos de platos
  final List<Plato> platos = [
    Plato(
      id: '1',
      nombre: 'Pizza Margarita',
      descripcion: 'Deliciosa pizza con tomate, mozzarella y albahaca',
      precio: 12.99,
      icono: Icons.local_pizza,
    ),
    Plato(
      id: '2',
      nombre: 'Pasta Carbonara',
      descripcion: 'Auténtica pasta italiana con bacon y queso parmesano',
      precio: 11.50,
      icono: Icons.restaurant,
    ),
    Plato(
      id: '3',
      nombre: 'Ensalada César',
      descripcion: 'Lechuga fresca con aderezo César y croutones',
      precio: 9.99,
      icono: Icons.eco,
    ),
    Plato(
      id: '4',
      nombre: 'Pollo al Horno',
      descripcion: 'Pollo tierno con hierbas aromáticas',
      precio: 13.50,
      icono: Icons.food_bank,
    ),
    Plato(
      id: '5',
      nombre: 'Tiramisú',
      descripcion: 'Postre italiano tradicional con café y mascarpone',
      precio: 7.50,
      icono: Icons.cake,
    ),
  ];

  // Datos de pedidos
  late List<Pedido> pedidos = [
    Pedido(
      numero: '#001',
      fecha: DateTime.now().subtract(const Duration(hours: 2)),
      estado: 'Entregado',
      platos: [platos[0], platos[2]],
      total: 22.98,
    ),
    Pedido(
      numero: '#002',
      fecha: DateTime.now().subtract(const Duration(hours: 1)),
      estado: 'En camino',
      platos: [platos[1], platos[4]],
      total: 19.00,
    ),
    Pedido(
      numero: '#003',
      fecha: DateTime.now(),
      estado: 'En preparación',
      platos: [platos[3]],
      total: 13.50,
    ),
  ];

  // Datos de reservas
  late List<Reserva> reservas = [
    Reserva(
      id: 'r1',
      nombre: 'García',
      fecha: DateTime.now().add(const Duration(days: 2)),
      personas: 4,
    ),
    Reserva(
      id: 'r2',
      nombre: 'López',
      fecha: DateTime.now().add(const Duration(days: 5)),
      personas: 2,
    ),
    Reserva(
      id: 'r3',
      nombre: 'Martínez',
      fecha: DateTime.now().add(const Duration(days: 7)),
      personas: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ─────────────────────────────────────────────────────────────────────
      // AppBar
      // ─────────────────────────────────────────────────────────────────────
      appBar: AppBar(
        title: const Text('🍽️ Mi Restaurante'),
        backgroundColor: Colors.deepOrange[700],
        elevation: 8,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Información',
            onPressed: _mostrarInformacion,
          ),
        ],
      ),

      // ─────────────────────────────────────────────────────────────────────
      // Drawer (Menú Lateral)
      // ─────────────────────────────────────────────────────────────────────
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrange[700],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.restaurant_menu, size: 48, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    'Mi Restaurante',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lo mejor de la cocina',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Ver Menú'),
              onTap: () {
                Navigator.pop(context);
                _cambiarTab(0);
                _mostrarSnackBar('📋 Mostrando menú');
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Mis Pedidos'),
              onTap: () {
                Navigator.pop(context);
                _cambiarTab(1);
                _mostrarSnackBar('📦 Mostrando pedidos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Reservas'),
              onTap: () {
                Navigator.pop(context);
                _cambiarTab(2);
                _mostrarSnackBar('📅 Mostrando reservas');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
                _mostrarSnackBar('⚙️ Abriendo configuración');
              },
            ),
          ],
        ),
      ),

      // ─────────────────────────────────────────────────────────────────────
      // Body: Contenido según tab seleccionado
      // ─────────────────────────────────────────────────────────────────────
      body: _construirBody(),

      // ─────────────────────────────────────────────────────────────────────
      // BottomNavigationBar (3 Tabs)
      // ─────────────────────────────────────────────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _cambiarTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Menú',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Reservas',
          ),
        ],
      ),

      // ─────────────────────────────────────────────────────────────────────
      // FloatingActionButton
      // ─────────────────────────────────────────────────────────────────────
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _mostrarSnackBar('✅ Pedido realizado correctamente');
        },
        backgroundColor: Colors.deepOrange[700],
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Pedido'),
      ),
    );
  }

  // Construir body según tab
  Widget _construirBody() {
    switch (_selectedTabIndex) {
      case 0:
        return _construirMenu();
      case 1:
        return _construirPedidos();
      case 2:
        return _construirReservas();
      default:
        return _construirMenu();
    }
  }

  // ─────────────────────────────────────────────────────────────────────
  // TAB 0: MENÚ
  // ─────────────────────────────────────────────────────────────────────
  Widget _construirMenu() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: platos.length,
      itemBuilder: (context, index) {
        return PlatoCard(
          plato: platos[index],
          onAgregar: () {
            _mostrarSnackBar(
              '✅ "${platos[index].nombre}" agregado al carrito',
            );
          },
        );
      },
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // TAB 1: PEDIDOS
  // ─────────────────────────────────────────────────────────────────────
  Widget _construirPedidos() {
    if (pedidos.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text(
              'No hay pedidos',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: pedidos.length,
      itemBuilder: (context, index) {
        return PedidoCard(
          pedido: pedidos[index],
          onVerDetalles: () {
            _mostrarSnackBar('👀 Viendo detalles del pedido ${pedidos[index].numero}');
            Navigator.pushNamed(
              context,
              '/detalle',
              arguments: pedidos[index],
            );
          },
        );
      },
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // TAB 2: RESERVAS
  // ─────────────────────────────────────────────────────────────────────
  Widget _construirReservas() {
    final reservasActivas = reservas.where((r) => !r.cancelada).toList();

    if (reservasActivas.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text(
              'No hay reservas',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: reservasActivas.length,
      itemBuilder: (context, index) {
        final reserva = reservasActivas[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 4,
          child: ListTile(
            leading: const Icon(Icons.person, color: Colors.deepOrange),
            title: Text('Reserva a nombre de ${reserva.nombre}'),
            subtitle: Text(
              '${reserva.fecha.day}/${reserva.fecha.month} a las ${reserva.fecha.hour}:${reserva.fecha.minute.toString().padLeft(2, '0')} - ${reserva.personas} personas',
            ),
            trailing: IconButton(
              icon: const Icon(Icons.cancel, color: Colors.red),
              onPressed: () {
                _cancelarReserva(reserva);
              },
            ),
          ),
        );
      },
    );
  }

  // ─────────────────────────────────────────────────────────────────────
  // ACCIONES
  // ─────────────────────────────────────────────────────────────────────

  void _cambiarTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _cancelarReserva(Reserva reserva) {
    setState(() {
      reserva.cancelada = true;
    });
    _mostrarSnackBar(
      '🗑️ Reserva de ${reserva.nombre} cancelada',
      accion: true,
      onDeshacer: () {
        setState(() {
          reserva.cancelada = false;
        });
      },
    );
  }

  void _mostrarInformacion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ℹ️ Información'),
        content: const Text(
          'Bienvenido a Mi Restaurante\n\n'
          'Aquí puedes:\n'
          '🍽️ Ver nuestro menú\n'
          '📦 Consultar tus pedidos\n'
          '📅 Hacer reservas\n'
          '\n¡Que disfrutes!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _mostrarSnackBar(
    String mensaje, {
    bool accion = false,
    VoidCallback? onDeshacer,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: const Duration(seconds: 3),
        action: accion
            ? SnackBarAction(
                label: 'Deshacer',
                onPressed: onDeshacer ?? () {},
              )
            : null,
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// WIDGET PERSONALIZADO: PlatoCard
// ═════════════════════════════════════════════════════════════════════════

class PlatoCard extends StatelessWidget {
  final Plato plato;
  final VoidCallback onAgregar;

  const PlatoCard({
    super.key,
    required this.plato,
    required this.onAgregar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Icono del plato
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.deepOrange[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                plato.icono,
                size: 40,
                color: Colors.deepOrange[700],
              ),
            ),
            const SizedBox(width: 12),
            // Información del plato
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plato.nombre,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plato.descripcion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${plato.precio.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onAgregar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: const Text(
                          'Agregar',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// WIDGET PERSONALIZADO: PedidoCard
// ═════════════════════════════════════════════════════════════════════════

class PedidoCard extends StatelessWidget {
  final Pedido pedido;
  final VoidCallback onVerDetalles;

  const PedidoCard({
    super.key,
    required this.pedido,
    required this.onVerDetalles,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      child: ListTile(
        leading: Icon(
          pedido.getIconoEstado(),
          color: pedido.getColorEstado(),
          size: 32,
        ),
        title: Text('Pedido ${pedido.numero}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${pedido.fecha.day}/${pedido.fecha.month}/${pedido.fecha.year}',
              style: const TextStyle(fontSize: 12),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: pedido.getColorEstado(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                pedido.estado,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${pedido.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            TextButton(
              onPressed: onVerDetalles,
              child: const Text('Detalles'),
            ),
          ],
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════
// PANTALLA: Detalles del Pedido (Routing)
// ═════════════════════════════════════════════════════════════════════════

class PedidoDetalleScreen extends StatelessWidget {
  const PedidoDetalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pedido = ModalRoute.of(context)?.settings.arguments as Pedido?;

    if (pedido == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(
          child: Text('Pedido no encontrado'),
        ),
      );
    }

    final subtotal =
        pedido.platos.fold(0.0, (sum, plato) => sum + plato.precio);
    final impuestos = subtotal * 0.10; // 10% de impuestos
    final total = subtotal + impuestos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Pedido ${pedido.numero}'),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Estado del pedido
            Card(
              color: pedido.getColorEstado(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      pedido.getIconoEstado(),
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Estado del Pedido',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          pedido.estado,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Platos del pedido
            const Text(
              'Platos Ordenados',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...pedido.platos.map((plato) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plato.nombre,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Cantidad: 1',
                            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '\$${plato.precio.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 24),

            // Resumen de facturación
            Card(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _construirFilaResumen('Subtotal', subtotal),
                    const Divider(),
                    _construirFilaResumen('Impuestos (10%)', impuestos),
                    const Divider(),
                    _construirFilaResumen(
                      'TOTAL',
                      total,
                      esTotal: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Botón volver
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirFilaResumen(
    String label,
    double monto, {
    bool esTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: esTotal ? 16 : 14,
            fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          '\$${monto.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: esTotal ? 16 : 14,
            fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
            color: esTotal ? Colors.deepOrange : Colors.black,
          ),
        ),
      ],
    );
  }
}
