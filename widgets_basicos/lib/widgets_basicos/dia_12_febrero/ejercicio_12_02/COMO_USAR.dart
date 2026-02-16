/// 🚀 CÓMO USAR ESTE EJERCICIO EN TU PROYECTO
/// 
/// Opción 1: Lo más simple - Reemplazar home en main.dart
/// Opción 2: Como una ruta adicional
/// Opción 3: Como parte de un menú de ejercicios

// ============================================================================
// OPCIÓN 1: REEMPLAZAR EL HOME (LA FORMA MÁS SIMPLE)
// ============================================================================

// En tu lib/main.dart, reemplaza MaterialApp así:

/*
import 'package:flutter/material.dart';
import 'ejercicio_12_02/main.dart';  // ← AGREGA ESTO

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EjercicioAsincroniaMain(),  // ← CAMBIO AQUÍ
      // Antes era: home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}
*/

// ============================================================================
// OPCIÓN 2: COMO UNA RUTA DENTRO DE TU APP (NAVEGACIÓN)
// ============================================================================

/*
import 'package:flutter/material.dart';
import 'ejercicio_12_02/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MenuPrincipal(),
      routes: {
        '/ejercicio-asincronia': (context) => const EjercicioAsincroniaMain(),
      },
    );
  }
}

// En tu menú principal:
class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú de Ejercicios')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Ejercicio: Asincronía'),
            subtitle: const Text('Vibración, llamadas, batería...'),
            onTap: () {
              Navigator.of(context).pushNamed('/ejercicio-asincronia');
            },
          ),
          // ... más ejercicios aquí
        ],
      ),
    );
  }
}
*/

// ============================================================================
// OPCIÓN 3: INTEGRACIÓN EN UN WIDGET EXISTENTE
// ============================================================================

/*
import 'package:flutter/material.dart';
import 'ejercicio_12_02/main.dart';
import 'ejercicio_12_02/paso_1_vibracion.dart';
import 'ejercicio_12_02/paso_2_llamada.dart';

// Si tienes un widget donde quieres mostrar solo un paso:

class MiejeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Ejercicio')),
      body: const Paso1Vibracion(),  // O cualquier otro paso
    );
  }
}
*/

// ============================================================================
// CONSOLA - COMANDOS PARA PROBAR
// ============================================================================

/*
# Asegúrate que los paquetes estén instalados:
flutter pub get

# Ejecuta el proyecto:
flutter run

# Si hay problemas en Windows:
flutter clean
flutter pub get
flutter run

# Para un dispositivo específico:
flutter run -d "nombre del dispositivo"
*/

// ============================================================================
// ✅ CHECKLIST ANTES DE EJECUTAR
// ============================================================================

/*
☐ Los paquetes están instalados (vibration, battery_plus, url_launcher, share_plus)
☐ El archivo main.dart está en lib/ejercicio_12_02/
☐ Los 10 archivos de pasos están en lib/ejercicio_12_02/
☐ Importaste EjercicioAsincroniaMain en tu main.dart
☐ No hay conflictos de imports
☐ Ejecutaste flutter pub get
☐ El app se compila sin errores
*/

// ============================================================================
// 🎯 PRIMERAS COSAS A PROBAR
// ============================================================================

/*
1. En la Paso 1 (Vibración):
   - Presiona el botón "Vibrar 500ms"
   - El teléfono debe vibrar
   - Luego debe mostrar "✓ Vibración completada"

2. En la Paso 7 (Batería):
   - Debe mostrar el porcentaje REAL de tu batería
   - La barra debe llenar según el nivel
   - El color debe cambiar (rojo <20%, amarillo <50%, verde >50%)

3. En Paso 2 (Llamada):
   - No necesitas llamar de verdad (es peligroso)
   - Solo prueba que se abre la app de teléfono

4. En Paso 4 (Compartir):
   - El diálogo de compartir debe abrirse
   - Cancela la acción, verás el mensaje "canceló"
*/

// ============================================================================
// 🔍 EXPLICACIÓN DEL CÓDIGO IMPORTANTE
// ============================================================================

/*
PATRÓN 1: Future Simple
───────────────────────
Future<void> hacerAlgo() async {
  setState(() { isLoading = true; });
  
  // Espera a que la operación termine (puede fallar)
  await Vibration.vibrate(duration: 500);
  
  setState(() { isLoading = false; });
}

PATRÓN 2: Manejo de Errores
────────────────────────────
try {
  // Intenta hacer algo que podría fallar
  await Share.share("texto");
} catch (e) {
  // Si falla, captura el error
  print("Error: $e");
}

PATRÓN 3: Leer Datos del Dispositivo
──────────────────────────────────────
int level = await _battery.batteryLevel;
setState(() {
  nivelBateria = level;
});

PATRÓN 4: Actualizar UI Basado en Progreso
──────────────────────────────────────────
setState(() {
  mensaje = "Completado";
  isLoading = false;
});

PATRÓN 5: Future.wait() para Paralelo
──────────────────────────────────────
await Future.wait([
  operacion1(),
  operacion2(),
  operacion3(),
]);

PATRÓN 6: Stream Periódico
──────────────────────────
Stream.periodic(Duration(seconds: 1), (_) => getValue());

PATRÓN 7: StreamBuilder
──────────────────────
StreamBuilder<int>(
  stream: miStream,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data.toString());
    }
    return CircularProgressIndicator();
  },
)
*/

// ============================================================================
// 📞 SI ALGO NO FUNCIONA
// ============================================================================

/*
❌ "Error: vibration is not available on this platform"
   → Prueba en dispositivo físico, el emulador a veces no lo soporta

❌ "The name 'Vibration' is undefined"
   → Falta import: import 'package:vibration/vibration.dart';

❌ "The name 'EjercicioAsincroniaMain' is not defined"
   → Falta import: import 'ejercicio_12_02/main.dart';

❌ "Permission denied"
   → Verifica permisos en AndroidManifest.xml o Info.plist

❌ "battery_plus: No implementation found"
   → Ejecuta: flutter clean && flutter pub get

❌ "Batería muestra 0%"
   → Síndrome del emulador. En teléfono real funcionará.

❌ "Los botones no funcionan"
   → Revisa los imports en main.dart
   → Verifica que no haya errores de compilación

❌ "No se ve el BottomNavigationBar"
   → Probablemente hay un error en el código
   → Abre la consola y busca "Exception" o "Error"
*/

// ============================================================================
// 💪 DESAFÍO EXTRA PARA ESTUDIANTES
// ============================================================================

/*
Una vez que terminen todos los pasos, pídeles:

1. Combinar Paso 1 + 4:
   - Al compartir, que también vibren

2. Crear su propio paso 11:
   - Abrir la cámara del teléfono
   - Mostrar indicador mientras se abre

3. Mejorar Paso 10:
   - Agregar pausa/reanudación
   - Mostrar velocidad de descarga
   - Mostrar tiempo restante

4. Crear un servicio de background:
   - Monitor de batería que actualiza cada 10 segundos
*/
