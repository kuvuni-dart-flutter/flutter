import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// ════════════════════════════════════════════════════════════════════════════
/// HIVE - SOLUCIÓN EDUCATIVA
/// ════════════════════════════════════════════════════════════════════════════
/// ✓ TODAS LAS CORRECCIONES APLICADAS
/// ════════════════════════════════════════════════════════════════════════════

// ═══════════════════════════════════════════════════════════════════════════
// MODELO DE DATOS
// ═══════════════════════════════════════════════════════════════════════════

/// Clase que representa un libro en la librería
class Libro {
  final String id;
  final String titulo;
  final String autor;
  final double precio;
  final bool leido;
  final DateTime fechaAgregado;
  final int paginas;

  Libro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.precio,
    required this.leido,
    required this.fechaAgregado,
    required this.paginas,
  });

  /// Convertir a Map para Hive
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'autor': autor,
      'precio': precio,
      'leido': leido,
      'fechaAgregado': fechaAgregado.toIso8601String(),
      'paginas': paginas,
    };
  }

  /// Factory constructor desde Map
  /// ✓ ERROR 1 CORREGIDO: Cambiar conversión de precio de toInt() a double
  factory Libro.fromMap(Map<String, dynamic> map) {
    return Libro(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      autor: map['autor'] ?? '',
      precio: (map['precio'] as num?)?.toDouble() ?? 0.0, // ✓ CORRECCIÓN: Usar toDouble() en lugar de toInt()
      leido: map['leido'] ?? false,
      fechaAgregado: DateTime.parse(
        map['fechaAgregado'] ?? DateTime.now().toIso8601String(),
      ),
      paginas: map['paginas'] ?? 0,
    );
  }

  @override
  String toString() {
    return '''
    ═══════════════════════════════════════
    LIBRO: $titulo
    ═══════════════════════════════════════
    Autor: $autor
    Precio: \$$precio
    Páginas: $paginas
    Leído: ${leido ? 'Sí' : 'No'}
    Agregado: ${fechaAgregado.day}/${fechaAgregado.month}/${fechaAgregado.year}
    ═══════════════════════════════════════
    ''';
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// SERVICIO DE ALMACENAMIENTO CON HIVE
// ═══════════════════════════════════════════════════════════════════════════

/// Servicio para gestionar libros con Hive
class AlmacenamientoHive {
  static const String _nombreCaja = 'libros';

  // ══════════════════════════════════════════════════════════════════════════
  // INICIALIZACIÓN
  // ══════════════════════════════════════════════════════════════════════════

  /// Inicializar Hive (debe llamarse una sola vez al inicio)
  static Future<void> inicializar() async {
    await Hive.initFlutter();
    await Hive.openBox<Map>(_nombreCaja);
    print('✓ Hive inicializado');
  }

  /// ✓ ERROR 2 CORREGIDO: Cambiar tipo de retorno de Box<String> a Box<Map>
  static Future<Box<Map>> _obtenerCaja() async {
    if (!Hive.isBoxOpen(_nombreCaja)) {
      await Hive.initFlutter();
      await Hive.openBox<Map>(_nombreCaja);
    }
    return Hive.box<Map>(_nombreCaja); // ✓ CORRECCIÓN: Cambiar Box<String> a Box<Map>
  }

  // ══════════════════════════════════════════════════════════════════════════
  // OPERACIONES CRUD
  // ══════════════════════════════════════════════════════════════════════════

  /// Agregar un libro
  /// ✓ ERROR 3 CORREGIDO: Agregar await a caja.put()
  static Future<void> agregarLibro(Libro libro) async {
    final caja = await _obtenerCaja();
    await caja.put(libro.id, libro.toMap()); // ✓ CORRECCIÓN: Se agregó await
    print('✓ Libro agregado: ${libro.titulo}');
  }

  /// Obtener un libro por ID
  static Future<Libro?> obtenerLibro(String id) async {
    final caja = await _obtenerCaja();
    final datos = caja.get(id);

    if (datos == null) return null;
    return Libro.fromMap(Map<String, dynamic>.from(datos));
  }

  /// Obtener todos los libros
  static Future<List<Libro>> obtenerTodosLibros() async {
    final caja = await _obtenerCaja();

    final libros = <Libro>[];
    for (var dato in caja.values) {
      libros.add(Libro.fromMap(Map<String, dynamic>.from(dato)));
    }

    return libros;
  }

  /// Actualizar un libro
  static Future<void> actualizarLibro(Libro libro) async {
    final caja = await _obtenerCaja();
    if (caja.containsKey(libro.id)) {
      await caja.put(libro.id, libro.toMap());
      print('✓ Libro actualizado: ${libro.titulo}');
    }
  }

  /// Eliminar un libro
  static Future<void> eliminarLibro(String id) async {
    final caja = await _obtenerCaja();
    await caja.delete(id);
    print('✓ Libro eliminado');
  }

  /// Marcar libro como leído
  /// ✓ ERROR 5 CORREGIDO: Invertir lógica del null check
  static Future<void> marcarComoLeido(String id, bool leido) async {
    final libro = await obtenerLibro(id);
    if (libro != null) { // ✓ CORRECCIÓN: Cambiar 'if (libro == null)' a 'if (libro != null)'
      final libroActualizado = Libro(
        id: libro.id,
        titulo: libro.titulo,
        autor: libro.autor,
        precio: libro.precio,
        leido: leido,
        fechaAgregado: libro.fechaAgregado,
        paginas: libro.paginas,
      );
      await actualizarLibro(libroActualizado);
    }
  }

  // ══════════════════════════════════════════════════════════════════════════
  // OPERACIONES COMPLEJAS
  // ══════════════════════════════════════════════════════════════════════════

  /// Obtener solo libros leídos
  static Future<List<Libro>> obtenerLibrosLeidos() async {
    final todos = await obtenerTodosLibros();
    return todos.where((libro) => libro.leido).toList();
  }

  /// Obtener solo libros no leídos
  static Future<List<Libro>> obtenerLibrosNoLeidos() async {
    final todos = await obtenerTodosLibros();
    return todos.where((libro) => !libro.leido).toList();
  }

  /// Obtener precio total invertido
  static Future<double> obtenerPrecioTotal() async {
    final todos = await obtenerTodosLibros();
    return todos.fold<double>(0.0, (suma, libro) => suma + libro.precio);
  }

  /// Obtener cantidad total de páginas
  /// ✓ ERROR 4 CORREGIDO: Cambiar fold() de String a int
  static Future<int> obtenerTotalPaginas() async {
    final todos = await obtenerTodosLibros();
    return todos.fold<int>(0, (suma, libro) => suma + libro.paginas); // ✓ CORRECCIÓN: Cambiar fold<String> a fold<int>
  }

  /// Limpiar todos los libros
  static Future<void> limpiarTodo() async {
    final caja = await _obtenerCaja();
    await caja.clear();
    print('✓ Todos los libros eliminados');
  }

  /// Obtener cantidad de libros
  static Future<int> obtenerCantidad() async {
    final caja = await _obtenerCaja();
    return caja.length;
  }

  /// Mostrar resumen
  static Future<void> mostrarResumen() async {
    final cantidad = await obtenerCantidad();
    final leidos = await obtenerLibrosLeidos();
    final precioTotal = await obtenerPrecioTotal();
    final paginas = await obtenerTotalPaginas();

    print('''
    ╔════════════════════════════════════════╗
    ║       RESUMEN DE LIBRERÍA (HIVE)       ║
    ╠════════════════════════════════════════╣
    ║ Total de libros: $cantidad
    ║ Libros leídos: ${leidos.length}
    ║ Libros por leer: ${cantidad - leidos.length}
    ║ Precio total: \$$precioTotal
    ║ Total de páginas: $paginas
    ╚════════════════════════════════════════╝
    ''');
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// INTERFAZ DE USUARIO
// ═══════════════════════════════════════════════════════════════════════════

class PantallaHive extends StatefulWidget {
  const PantallaHive({super.key});

  @override
  State<PantallaHive> createState() => _PantallaHiveState();
}

class _PantallaHiveState extends State<PantallaHive> {
  List<Libro> libros = [];
  bool cargando = true;

  @override
  void initState() {
    super.initState();
    cargarLibros();
  }

  void cargarLibros() async {
    libros = await AlmacenamientoHive.obtenerTodosLibros();
    setState(() {
      cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (cargando) {
      return Scaffold(
        appBar: AppBar(title: Text("Hive"),),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hive - Base de datos'),
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Chip(
                label: Text('${libros.length} libros'),
                backgroundColor: Colors.white24,
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: libros.isEmpty
          ? _buildVacio()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: libros.length,
              itemBuilder: (context, index) {
                return _buildLibroCard(libros[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregarLibro,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // WIDGETS AUXILIARES
  // ══════════════════════════════════════════════════════════════════════════

  Widget _buildVacio() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.library_books_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Sin libros',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _mostrarDialogoAgregarLibro,
            icon: const Icon(Icons.add),
            label: const Text('Agregar primer libro'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLibroCard(Libro libro) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        libro.titulo,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Por ${libro.autor}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  value: libro.leido,
                  onChanged: (valor) async {
                    if (valor != null) {
                      await AlmacenamientoHive.marcarComoLeido(
                        libro.id,
                        valor,
                      );
                      cargarLibros();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfo('💰 \$${libro.precio.toStringAsFixed(2)}'),
                _buildInfo('📄 ${libro.paginas} pg'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () async {
                    await AlmacenamientoHive.eliminarLibro(libro.id);
                    cargarLibros();
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('Eliminar'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String texto) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // DIÁLOGOS
  // ══════════════════════════════════════════════════════════════════════════

  void _mostrarDialogoAgregarLibro() {
    final controladorTitulo = TextEditingController();
    final controladorAutor = TextEditingController();
    final controladorPrecio = TextEditingController();
    final controladorPaginas = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Agregar libro'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controladorTitulo,
                  decoration: const InputDecoration(
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controladorAutor,
                  decoration: const InputDecoration(
                    labelText: 'Autor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controladorPrecio,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controladorPaginas,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Páginas',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (controladorTitulo.text.isNotEmpty &&
                    controladorAutor.text.isNotEmpty) {
                  final libro = Libro(
                    id: DateTime.now().toString(),
                    titulo: controladorTitulo.text,
                    autor: controladorAutor.text,
                    precio: double.tryParse(controladorPrecio.text) ?? 0.0,
                    leido: false,
                    fechaAgregado: DateTime.now(),
                    paginas: int.tryParse(controladorPaginas.text) ?? 0,
                  );

                  await AlmacenamientoHive.agregarLibro(libro);
                  cargarLibros();

                  if (!mounted) return;
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Libro agregado')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// ENTRY POINT
// ═══════════════════════════════════════════════════════════════════════════

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AlmacenamientoHive.inicializar();
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const PantallaHive(),
    );
  }
}
