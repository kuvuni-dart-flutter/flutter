import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// PASO 6: Abrir Múltiples Apps en Paralelo
/// Demuestra cómo ejecutar varias operaciones asincrónicas
/// sin esperar a que una termine antes de iniciar la siguiente
class Paso6AbrirEnParalelo extends StatefulWidget {
  const Paso6AbrirEnParalelo({Key? key}) : super(key: key);

  @override
  State<Paso6AbrirEnParalelo> createState() => _Paso6AbrirEnParaleloState();
}

class _Paso6AbrirEnParaleloState extends State<Paso6AbrirEnParalelo> {
  String estado = "Presiona para abrir apps en paralelo";
  bool isLoading = false;
  final Map<String, bool> appsAbiertas = {
    'Galería': false,
    'Calendario': false,
    'Reloj': false,
    'Calculadora': false,
  };

  Future<void> abrirAppsEnParalelo() async {
    setState(() {
      isLoading = true;
      estado = "Abriendo 4 apps al mismo tiempo...";
      appsAbiertas.updateAll((key, value) => false);
    });

    try {
      Stopwatch stopwatch = Stopwatch()..start();

      // Ejecutar todas las acciones EN PARALELO (no secuencial)
      // Future.wait espera a que TODAS terminen
      await Future.wait([
        _abrirGaleria(),
        _abrirCalendario(),
       // _abrirReloj(),
        _abrirCalculadora(),
       //_lanzarHuevoPascua(),
      ]);

      stopwatch.stop();

      setState(() {
        estado =
            "✓ Todas las apps se abrieron en paralelo\n"
            "Tiempo total: ${stopwatch.elapsedMilliseconds}ms\n"
            "(Si fueran secuenciales, tardaría ~12 segundos)";
      });
    } catch (e) {
      setState(() {
        estado = "Nota: No todas las apps están disponibles en emulador";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _abrirGaleria() async {
    _marcarApp("Galería");
    // Intenta abrir galería
    try {
      final Uri uri = Uri.parse('content://media/internal/images/media');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'No se pudo abrir la galería';
      }
    } catch (e) {
      // Continúa aunque falle
    }
  }

  Future<void> _abrirCalendario() async {
    _marcarApp("Calendario");
    try {
    final Uri uri = Uri.parse('content://com.android.calendario');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'No se pudo abrir el calendario';
      }
    } catch (e) {
      // Continúa aunque falle
    }
  }

  Future<void> _abrirReloj() async {
    _marcarApp("Reloj");

    final String intentUrl = "intent:#Intent;component=com.android.egg/.PlatLogoActivity;end";

    try {
      final Uri uri = Uri.parse(intentUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'No se pudo abrir egg';
      }
    } catch (e) {
      // Continúa aunque falle
    }

  }

  Future<void> _abrirCalculadora() async {
    _marcarApp("Calculadora");
    await Future.delayed(const Duration(seconds: 3));
  }

  //Intentar  abrir con android_intent_plus

  Future<void> _lanzarHuevoPascua() async{
  final intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    package: 'com.android.egg',
    componentName: 'com.android.egg.PlatLogoActivity', // El nombre exacto varía por versión (ej. PaintChipsActivity en Android 12)
    flags: [0x10000000],
  );
  try {
     await intent.launch();
  } catch (e){
    const fallbackIntent = AndroidIntent(
      action: 'com.android.internal.intent.action.PLATFORM_LOGO', // Acción interna
      flags: [0x10000000],
    );
    await fallbackIntent.launch();
  }
 
}



  void _marcarApp(String nombre) {
    setState(() {
      appsAbiertas[nombre] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Paso 6: Operaciones en Paralelo",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          estado,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        // Mostrar estado de cada app
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: appsAbiertas.entries.map((entry) {
            return Chip(
              label: Text(entry.key),
              backgroundColor: entry.value
                  ? Colors.green[200]
                  : Colors.grey[300],
              avatar: Icon(
                entry.value ? Icons.check_circle : Icons.hourglass_empty,
                color: entry.value ? Colors.green : Colors.grey,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: isLoading ? null : abrirAppsEnParalelo,
          icon: isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.apps),
          label: const Text("Abrir 4 Apps en Paralelo"),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.indigo[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "💡 Concepto: Future.wait() - Paralelo\n"
            "Todas se ejecutan A LA VEZ,\n"
            "no espera a que una termine para iniciar la siguiente.",
            style: TextStyle(fontSize: 12, color: Colors.indigo),
          ),
        ),
      ],
    );
  }
}
