import 'package:flutter/material.dart';

/// 📊 DATOS PARA EL EJERCICIO DEL RESTAURANTE
/// 
/// Este archivo contiene datos de ejemplo para un restaurante, incluyendo platos, pedidos y reservas.
/// Tienes que completar las funciones helper al final del archivo para que el ejercicio funcione correctamente.  
/// También tienes que implementar las clases Plato, Pedido y Reserva.


// ═════════════════════════════════════════════════════════════════════════
// DATOS DE PLATOS
// ═════════════════════════════════════════════════════════════════════════

final List<Plato> LISTA_PLATOS = [
  // ENTRADAS
  Plato(
    id: '1',
    nombre: 'Tabla de Quesos y Embutidos',
    descripcion: 'Selección premium de quesos importados y jamón serrano',
    precio: 14.99,
    icono: Icons.food_bank,
    categoria: 'Entrada',
  ),
  Plato(
    id: '2',
    nombre: 'Camarones al Ajillo',
    descripcion: 'Camarones frescos salteados con ajo y aceite de oliva',
    precio: 12.50,
    icono: Icons.set_meal,
    categoria: 'Entrada',
  ),
  Plato(
    id: '3',
    nombre: 'Tabla de Vegetales Grillados',
    descripcion: 'Mezcla de vegetales a la parrilla con vinagreta balsámica',
    precio: 9.99,
    icono: Icons.eco,
    categoria: 'Entrada',
  ),

  // PRINCIPALES
  Plato(
    id: '4',
    nombre: 'Pizza Margarita',
    descripcion: 'Deliciosa pizza con tomate, mozzarella fresca y albahaca',
    precio: 12.99,
    icono: Icons.local_pizza,
    categoria: 'Principal',
  ),
  Plato(
    id: '5',
    nombre: 'Pasta Carbonara',
    descripcion: 'Auténtica pasta italiana con bacon, huevo y queso parmesano',
    precio: 13.50,
    icono: Icons.restaurant,
    categoria: 'Principal',
  ),
  Plato(
    id: '6',
    nombre: 'Salmón a la Mantequilla',
    descripcion: 'Filete de salmón fresco cocinado en salsa de mantequilla',
    precio: 18.99,
    icono: Icons.food_bank,
    categoria: 'Principal',
  ),
  Plato(
    id: '7',
    nombre: 'Pollo al Horno',
    descripcion: 'Pechuga de pollo tierna con hierbas aromáticas y limón',
    precio: 13.50,
    icono: Icons.food_bank,
    categoria: 'Principal',
  ),
  Plato(
    id: '8',
    nombre: 'Ensalada César Deluxe',
    descripcion: 'Lechuga fresca, aderezo César casero, crutones y parmesano',
    precio: 11.99,
    icono: Icons.eco,
    categoria: 'Principal',
  ),

  // POSTRES
  Plato(
    id: '9',
    nombre: 'Tiramisú',
    descripcion: 'Postre italiano tradicional con café, mascarpone y cacao',
    precio: 7.50,
    icono: Icons.cake,
    categoria: 'Postre',
  ),
  Plato(
    id: '10',
    nombre: 'Brownies con Helado',
    descripcion: 'Brownie de chocolate caliente con helado de vainilla',
    precio: 8.99,
    icono: Icons.cake,
    categoria: 'Postre',
  ),
  Plato(
    id: '11',
    nombre: 'Flan Casero',
    descripcion: 'Flan tradicional con caramelo, preparado diariamente',
    precio: 6.50,
    icono: Icons.cake,
    categoria: 'Postre',
  ),
  Plato(
    id: '12',
    nombre: 'Fruta Fresca de Temporada',
    descripcion: 'Selección de frutas frescas cortadas con salsa de miel',
    precio: 5.99,
    icono: Icons.eco,
    categoria: 'Postre',
  ),

  // BEBIDAS
  Plato(
    id: '13',
    nombre: 'Refrescos Variados',
    descripcion: 'Coca-Cola, Sprite, Fanta y otras marcas (350 ml)',
    precio: 2.99,
    icono: Icons.local_drink,
    categoria: 'Bebida',
  ),
  Plato(
    id: '14',
    nombre: 'Jugo Natural',
    descripcion: 'Jugo de naranja, manzana, piña o mezcla del día',
    precio: 4.99,
    icono: Icons.local_drink,
    categoria: 'Bebida',
  ),
  Plato(
    id: '15',
    nombre: 'Vino Tinto de la Casa',
    descripcion: 'Excelente vino tinto español, copa (150 ml)',
    precio: 5.99,
    icono: Icons.wine_bar,
    categoria: 'Bebida',
  ),
];

// ═════════════════════════════════════════════════════════════════════════
// DATOS DE PEDIDOS
// ═════════════════════════════════════════════════════════════════════════

final List<Pedido> LISTA_PEDIDOS = [
  Pedido(
    numero: '#001',
    fecha: DateTime.now().subtract(const Duration(hours: 5)),
    estado: 'Entregado',
    platos: [LISTA_PLATOS[3], LISTA_PLATOS[2]], // Pizza y Vegetales
    total: 22.98,
  ),
  Pedido(
    numero: '#002',
    fecha: DateTime.now().subtract(const Duration(hours: 2)),
    estado: 'En camino',
    platos: [LISTA_PLATOS[4], LISTA_PLATOS[8]], // Pasta y Tiramisú
    total: 21.49,
  ),
  Pedido(
    numero: '#003',
    fecha: DateTime.now().subtract(const Duration(minutes: 30)),
    estado: 'En preparación',
    platos: [LISTA_PLATOS[6], LISTA_PLATOS[12]], // Pollo y Fruta
    total: 19.99,
  ),
  Pedido(
    numero: '#004',
    fecha: DateTime.now().subtract(const Duration(hours: 8)),
    estado: 'Entregado',
    platos: [LISTA_PLATOS[5], LISTA_PLATOS[14], LISTA_PLATOS[9]],
    total: 33.47,
  ),
];

// ═════════════════════════════════════════════════════════════════════════
// DATOS DE RESERVAS
// ═════════════════════════════════════════════════════════════════════════

final List<Reserva> LISTA_RESERVAS = [
  Reserva(
    id: 'r1',
    nombre: 'García',
    fecha: DateTime.now().add(const Duration(days: 2, hours: 3)),
    personas: 4,
    telefono: '555-1234',
    email: 'garcia@email.com',
    notas: 'Cumpleaños',
  ),
  Reserva(
    id: 'r2',
    nombre: 'López',
    fecha: DateTime.now().add(const Duration(days: 5, hours: 2)),
    personas: 2,
    telefono: '555-5678',
    email: 'lopez@email.com',
    notas: 'Cena romántica',
  ),
  Reserva(
    id: 'r3',
    nombre: 'Martínez',
    fecha: DateTime.now().add(const Duration(days: 7)),
    personas: 6,
    telefono: '555-9012',
    email: 'martinez@email.com',
    notas: 'Reunión de negocios',
  ),
  Reserva(
    id: 'r4',
    nombre: 'Fernández',
    fecha: DateTime.now().add(const Duration(days: 10, hours: 12)),
    personas: 3,
    telefono: '555-3456',
    email: 'fernandez@email.com',
  ),
];

// ═════════════════════════════════════════════════════════════════════════
// MAPAS DE INFORMACIÓN
// ═════════════════════════════════════════════════════════════════════════

// Información del restaurante
final Map<String, String> INFO_RESTAURANTE = {
  'nombre': 'Mi Restaurante',
  'descripcion': 'La mejor comida de la ciudad',
  'telefono': '+1 (555) 123-4567',
  'email': 'info@miRestaurante.com',
  'direccion': '123 Calle Principal, Ciudad',
  'horario': 'Lunes a Domingo: 11:00 AM - 11:00 PM',
};

// Información de categorías
final Map<String, String> CATEGORIAS_INFO = {
  'Entrada': 'Aperitivos y platos para compartir',
  'Principal': 'Platos principales con ingredientes frescos',
  'Postre': 'Dulces para terminar',
  'Bebida': 'Bebidas variadas',
};

// Información de estados
final Map<String, String> ESTADOS_INFO = {
  'En preparación': 'Tu pedido se está preparando en la cocina',
  'En camino': 'Tu pedido está en camino a tu puerta',
  'Entregado': 'Tu pedido ha sido entregado',
};

// Impuestos y tarjetas
final Map<String, double> TARJETAS_VALIDACION = {
  'visa_test': 4111111111111111,
  'mastercard_test': 5555555555554444,
};

// ═════════════════════════════════════════════════════════════════════════
// CONSTANTES
// ═════════════════════════════════════════════════════════════════════════

const double TASA_IMPUESTOS = 0.21; // 21% de impuestos IVA
const double PROPINA_PREDETERMINADA = 0.0; // Propina 0%
const Duration TIEMPO_ESPERA_PEDIDO = Duration(minutes: 30);
const int MINIMO_PERSONAS_PARA_RESERVA = 1;
const int MAXIMO_PERSONAS_POR_RESERVA = 20;

// ═════════════════════════════════════════════════════════════════════════
// FUNCIONES HELPER
// ═════════════════════════════════════════════════════════════════════════

/// Conseguir plato por ID
Plato? obtenerPlatoPorId(String id) {

}

/// Filtrar platos por categoría
List<Plato> filtrarPorCategoria(String categoria) {
  
}

/// Buscar platos por nombre
List<Plato> buscarPlatos(String nombreBusqueda) {
 
}

/// Calcular total con impuestos
double calcularTotalConImpuestos(double subtotal) {

}

/// Calcular propina
double calcularPropina(double total, {double? tasa}) {
 
}

/// Validar número de personas para reserva
bool esValidoNumeroPersonas(int personas) {
 
}

/// Validar fecha de reserva (no en el pasado)
bool esFechaValidaReserva(DateTime fecha) {
  
}

/// Obtener lista de categorías únicas
List<String> obtenerCategorias() {
 
}

/// Obtener disponibilidad de plato
bool esPlatoDisponible(String idPlato) {
  
}

/// Obtener pedido por número
Pedido? obtenerPedidoPorNumero(String numero) {
  
}

/// Obtener reserva por ID
Reserva? obtenerReservaPorId(String id) {
  
}

/// Obtener platos más caros
List<Plato> obtenerPlatosMasCaros({int cantidad = 5}) {

}

/// Obtener platos más baratos
List<Plato> obtenerPlatosMasBaratos({int cantidad = 5}) {
  
}

/// Formatear precio en moneda
String formatearPrecio(double precio) {
 ;
}

/// Obtener precio promedio de platos
double obtenerPrecioPromedio() {
  
}

/// Generar ID único para pedido
String generarIdPedido() {
}

/// Obtener día y horarios disponibles para reserva
List<String> obtenerHorariosDisponibles() {
  return [
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
  ];
}

// ═════════════════════════════════════════════════════════════════════════
// EXTENSIONES ÚTILES
// ═════════════════════════════════════════════════════════════════════════

extension ListaPlatosExtension on List<Plato> {
  /// Calcular precio total de una lista de platos
  double get precioTotal =>
      isEmpty ? 0 : fold(0, (sum, plato) => sum + plato.precio);

  /// Obtener nombre de todos los platos separados por coma
  String get nombresFormato => map((p) => p.nombre).join(', ');

  /// Obtener plato más caro de la lista
  Plato? get platoPlusCaro => isEmpty
      ? null
      : reduce((a, b) => a.precio > b.precio ? a : b);

  /// Obtener plato más barato de la lista
  Plato? get platoMasBarato => isEmpty
      ? null
      : reduce((a, b) => a.precio < b.precio ? a : b);
}

extension FormatoFechaExtension on DateTime {
  /// Formatear como "Lunes, 8 de Febrero"
  String get formatoLargo {
    const meses = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
    const dias = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];

    return '${dias[weekday - 1]}, $day de ${meses[month - 1]}';
  }

  /// Formatear como "HH:MM"
  String get formatoHora =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  /// Verificar si es hoy
  bool get esHoy {
    final hoy = DateTime.now();
    return year == hoy.year && month == hoy.month && day == hoy.day;
  }
}

