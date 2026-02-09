import 'package:flutter/material.dart';
import '../dia_comunes/my_lesson_header.dart';
import '../dia_comunes/my_navigation_button.dart';

/// DÍA 9.2 - ENRUTAMIENTO BÁSICO EN FLUTTER
///
/// Este archivo enseña cómo navegar entre diferentes pantallas
/// usando rutas nombradas (Named Routes).
///
/// CONCEPTOS PRINCIPALES:
///
/// 1. RUTAS NOMBRADAS (Named Routes)
///    - Forma segura y escalable de navegar
///    - Se definen en MaterialApp.routes
///    - Se accede con Navigator.pushNamed(context, 'nombreRuta')
///
/// 2. PATRÓN: Home → Detalle
///    - Home: Pantalla principal con botones
///    - Detalle: Pantallas específicas (SnackBar, Images, ListView)
///
/// 3. NAVEGACIÓN:
///    Navigator.pushNamed()  → Navega a una ruta nueva
///    Navigator.pop()        → Vuelve a la pantalla anterior
///

/*    // INICIO: Ruta que se muestra primero
      // home: const Dia92Routing(),
      
      // RUTAS NOMBRADAS: Definir todos los caminos disponibles
      // Estructura: 'nombreRuta': (context) => WidgetDestino()
      routes: {
        // Ruta principal (Incompatible, se usa 'home' arriba, una sola ruta de inicio)
        '/': (context) => const Dia92Routing(),

        // Ruta a Scalfold básico
        // '/scaffold': (context) => const MyScaffoldExample(),
         '/scaffold': (context) => Placeholder(),
        
        // Ruta a SnackBar
        // '/snackbar': (context) => const MySnackBarExample(),
         '/snackbar': (context) => Placeholder(),
        
        // Ruta a Images
        // '/images': (context) => const MyImages(),
        '/images': (context) => const Placeholder(),
        
        // Ruta a ListView
        //'/listview': (context) => const MiListViewEjemplos(),
        '/listview': (context) => const Placeholder(),
      },
*/

/// Pantalla de inicio con botones para navegar a otros módulos
class Dia92Routing extends StatelessWidget {
  const Dia92Routing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Más widgets'),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// HEADER: Título y descripción
              MyLessonHeader(
                fecha: 'Lunes, 9 de febrero 2026',
                titulo: 'Enrutamiento y mucho más en Flutter',
                color: Colors.blue,
                icono: Icons.navigation,
              ),

              const SizedBox(height: 50),

              //Ejemplo sin rutas nombradas
              ElevatedButton.icon(
                onPressed: () {
                  /// NAVEGACIÓN SIMPLE sin rutas nombradas
                  /// Usar Navigator.push() directamente
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward, color: Colors.white ,),
                label: const Text('Ejemplo básico (Navigator.push)', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              MyNavigationButton(
                icon: Icons.view_quilt,
                title: 'Scaffold',
                description:
                    'Explora el widget Scaffold y su estructura básica',
                color: Colors.blueAccent,
                routeName: '/scaffold',
                context: context,
              ),

              const SizedBox(height: 20),

              /// BOTÓN 1: SnackBar
              MyNavigationButton(
                icon: Icons.notifications,
                title: 'SnackBar',
                description: 'Notificaciones temporales',
                color: Colors.deepOrange,
                routeName: '/snackbar',
                context: context,
              ),

              const SizedBox(height: 20),

              /// BOTÓN 2: Images
              MyNavigationButton(
                icon: Icons.image,
                title: 'Imágenes',
                description: 'Gestión de imágenes en Flutter',
                color: Colors.green,
                routeName: '/images',
                context: context,
              ),

              const SizedBox(height: 20),

              /// BOTÓN 3: ListView
              MyNavigationButton(
                icon: Icons.list,
                title: 'ListViews',
                description: 'Listas eficientes y escalables',
                color: Colors.purple,
                routeName: '/listview',
                context: context,
              ),

              const SizedBox(height: 20),

              /// BOTÓN ADICIONAL: Ejemplo sin rutas nombradas
              ElevatedButton.icon(
                onPressed: () {
                  /// NAVEGACIÓN SIMPLE sin rutas nombradas
                  /// Usar Navigator.push() directamente
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Placeholder(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Ejemplo básico (Navigator.push)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              /// INFORMACIÓN: Explicación del enrutamiento
              _buildInfoBox(),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget para cada botón de navegación
  /// Ahora usamos el widget personalizado MyNavigationButton
  /// Este método se mantiene como referencia documentada
  ///
  /// ANTES (código duplicado):
  /// Widget _buildNavigationButton(
  ///   BuildContext context, {
  ///   required IconData icon,
  ///   required String title,
  ///   required String description,
  ///   required Color color,
  ///   required String routeName,
  /// }) {
  ///   return Card(...)
  /// }
  ///
  /// AHORA (widget reutilizable):
  /// MyNavigationButton(
  ///   icon: icon,
  ///   title: title,
  ///   description: description,
  ///   color: color,
  ///   routeName: routeName,
  ///   context: context,
  /// )

  /// Widget con información sobre enrutamiento
  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✓ ¿CÓMO FUNCIONA EL ENRUTAMIENTO?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 12),
          _buildInfoItem(
            '1. Rutas definidas',
            'En MaterialApp.routes configuramos todas las rutas',
          ),
          _buildInfoItem(
            '2. Navegar con pushNamed()',
            'Navigator.pushNamed(context, \'/snackbar\')',
          ),
          _buildInfoItem(
            '3. Volver atrás',
            'El botón atrás del AppBar usa Navigator.pop()',
          ),
          _buildInfoItem(
            '4. Parámetros opcionales',
            'Se pueden pasar datos a través de arguments',
          ),
        ],
      ),
    );
  }

  /// Helper para mostrar items informativos
  Widget _buildInfoItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════
// GUÍA DE USO EN main.dart
// ═══════════════════════════════════════════════════════════════════════════

/// CÓMO USAR ESTE ARCHIVO EN TU main.dart:
/// 
/// ```dart
/// void main() {
///   runApp(const Dia92Routing());
/// }
/// ```
/// 
/// ¡ESO ES TODO! El enrutamiento está configurado en la clase Dia92Routing.

// ═══════════════════════════════════════════════════════════════════════════
// CONCEPTOS AVANZADOS (OPCIONAL PARA ESTUDIANTES)
// ═══════════════════════════════════════════════════════════════════════════

/// PASAR ARGUMENTOS A LAS RUTAS (Ejemplo avanzado)
/// 
/// Supongamos que quieres pasar datos a una pantalla:
/// 
/// 1. Modificar la ruta para recibir argumentos:
/// ```dart
/// routes: {
///   '/snackbar': (context) {
///     final args = ModalRoute.of(context)!.settings.arguments;
///     return MySnackBarExample(data: args);
///   },
/// }
/// ```
/// 
/// 2. Navegar pasando argumentos:
/// ```dart
/// Navigator.pushNamed(
///   context,
///   '/snackbar',
///   arguments: 'Datos para la pantalla',
/// );
/// ```

/// COMPARACIÓN: Navigator.push() vs Navigator.pushNamed()
/// 
/// ┌────────────────────┬─────────────────────┬──────────────────────┐
/// │     Método         │       Ventaja       │      Desventaja       │
/// ├────────────────────┼─────────────────────┼──────────────────────┤
/// │ Navigator.push()   │ Flexible            │ Es más verboso        │
/// │                    │ Control directo     │ Difícil de mantener   │
/// │                    │                     │ en apps grandes       │
/// ├────────────────────┼─────────────────────┼──────────────────────┤
/// │ pushNamed()        │ Centralizado        │ Menos flexible        │
/// │                    │ Fácil de mantener   │ (a veces)             │
/// │                    │ Mejor para equipos  │                       │
/// └────────────────────┴─────────────────────┴──────────────────────┘
/// 
/// Para apps educativas y proyectos medianos,
/// les recomendamos usar pushNamed().
