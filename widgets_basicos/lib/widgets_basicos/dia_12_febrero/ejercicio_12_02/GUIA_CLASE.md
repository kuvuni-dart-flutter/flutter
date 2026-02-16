# 📖 GUÍA DE CLASE - Cómo Enseñar el Ejercicio Completo

## 🎯 Objetivo Final
Los estudiantes comprenderán asincronía en Dart/Flutter mediante código real que hace acciones verdaderas en el teléfono, progresando desde conceptos básicos hasta un proyecto capstone.

---

## 📅 Plan de 8 Sesiones de Clase (1 hora cada una)

### **SESIÓN 1: Introducción a Futures (60 min)**

#### 📚 Teoría (15 min)
1. **Pregunta inicial**: "¿Qué pasa si queremos descargar algo que tarda 5 segundos?"
   - Si bloqueamos: la app se congela ("FREEZES")
   - Si usamos Future: la app sigue funcionando

2. **Dibuja en la pizarra**:
```
❌ SIN FUTURE (BLOQUEANTE):    ✅ CON FUTURE (NO BLOQUEANTE):
[===========]                   [ = = = = = ]
   5 segundos                    5 segundos
   App CONGELADA ❌              App RESPONSIVA ✅
```

3. **Explica conceptos**:
   - `Future<T>` = promesa de un resultado en el futuro
   - `async` = "puedo esperar cosas"
   - `await` = "espera aquí hasta que termine"

#### 💻 Demostración Práctica (30 min)
1. Abre [paso_1_vibracion.dart](paso_1_vibracion.dart) en VS Code
2. **Lee el código en voz alta**, explica:
   ```dart
   Future<void> hacerVibrar() async {
     setState(() { isLoading = true; });
     await Vibration.vibrate(duration: 500);  // ESPERA AQUÍ
     setState(() { isLoading = false; });
   }
   ```
3. Presiona el botón "Vibrar 500ms"
4. Muestra: "El teléfono vibró, pero la app siguió respondiendo"
5. **Pregunta**: "¿Qué pasó? ¿Se congeló la app?"

#### 📝 Ejercicio Práctico (15 min)
Pide a los estudiantes:
```dart
Future<void> miActualCodigo() async {
  print("Inicio");
  await Future.delayed(Duration(seconds: 2));
  print("Fin");
}
```
- ¿Cuándo se imprime "Inicio"? (Inmediatamente)
- ¿Cuándo se imprime "Fin"? (Después de 2 segundos)

---

### **SESIÓN 2: Intents - Abrir Otras Apps (60 min)**

#### 📚 Teoría (10 min)
- Un **Intent** es una acción que le pides al SISTEMA OPERATIVO
- Ejemplos: llamar, enviar SMS, abrir cámara, compartir
- **Importante**: Una vez que abres otra app, PIERDES el control
- El usuario puede estar en la otra app ¿1 segundo? ¿5 minutos?

#### 💻 PASO 2: Llamadas Telefónicas (20 min)

**Código clave**:
```dart
final Uri uri = Uri(scheme: 'tel', path: '+34666666666');
if (await canLaunchUrl(uri)) {
  await launchUrl(uri);  // CEDE CONTROL AL SISTEMA
}
```

**Demo en vivo**:
1. Abre [paso_2_llamada.dart](paso_2_llamada.dart)
2. Presiona "Llamar: +34 666 66 66 66"
3. Se abre la app de teléfono (IF disponible)
4. **Pregunta**: "¿Cuándo regresa a mi app? ¿Cuánto tiempo toma?"
5. Vuelve a tu app, muestra mensaje "✓ Llamada completada"

#### 💻 PASO 4: Compartir Contenido (20 min)

**Código clave**:
```dart
final result = await Share.share(textoCompartir);
if (result.status == ShareResultStatus.success) {
  print("Usuario compartió");
} else if (result.status == ShareResultStatus.dismissed) {
  print("Usuario canceló");
}
```

**Demo en vivo**:
1. Abre [paso_4_compartir.dart](paso_4_compartir.dart)
2. Presiona "Compartir en Redes"
3. Se abre el dialogo nativo
4. **Pregunta**: "¿Qué pasa si el usuario comparte? ¿Si cancela?"
5. Muestra el mensaje de resultado

#### 🎯 Concepto Clave
- Pregunta: "¿Quién decide si se hace la acción?"
  - **Respuesta**: El usuario, mi app solo PROPONE

---

### **SESIÓN 3: Tareas Secuenciales y Errores (60 min)**

#### 💻 PASO 3: Tres Tareas en Orden (25 min)

**Concepto**: Una tarea DESPUÉS de otra (secuencial)

**Demo**:
1. Abre [paso_3_tareas_orden.dart](paso_3_tareas_orden.dart)
2. Presiona "Preparar Receta"
3. Observa:
   - "Calentando agua..." (2 seg)
   - "Poniendo café..." (1 seg)
   - "Esperando a que infusione..." (3 seg)
4. **Total: 6 segundos** (suma de todos)

**Código visualizado**:
```dart
await Future.delayed(Duration(seconds: 2));  // 1️⃣ Espera 2 seg
await Future.delayed(Duration(seconds: 1));  // 2️⃣ Luego 1 seg
await Future.delayed(Duration(seconds: 3));  // 3️⃣ Luego 3 seg
                      // TOTAL = 6 seg
```

#### 💻 PASO 5: Manejo de Errores (25 min)

**Concepto**: Las operaciones CAN FAIL, hay que prepárese

**Demo**:
1. Abre [paso_5_errores.dart](paso_5_errores.dart)
2. Presiona "Instalar App" varias veces
3. Muestra: A veces éxito ✅, a veces falla ❌
4. **Pregunta**: "¿Cómo capturamos el error?"

**Código visualizado**:
```dart
try {
  // Intenta hacer algo que podría fallar
  await instalarApp();
} catch (e) {
  // Si falla, captura el error
  setState(() { mensaje = "✗ Error: $e"; });
}
```

#### 🤔 Preguntas para Estudiantes
- "¿Qué pasa si la descarga se interrumpe?"
- "¿Cómo sabe mi app que hubo un error?"
- "¿Siempre los errores son iguales?"

---

### **SESIÓN 4: Operaciones en Paralelo (60 min)**

#### 📚 Teoría (15 min)

**SECUENCIAL**: Una tarea después de otra
```
Tarea 1 [====]     (3 seg)
Tarea 2       [==] (2 seg)
Tarea 3          [=] (1 seg)
                    TOTAL: 6 segundos
```

**PARALELO**: Todas a la vez
```
Tarea 1 [====]
Tarea 2 [==]
Tarea 3 [=]
        TOTAL: 3 segundos (el más largo)
```

#### 💻 PASO 6: Abrir Apps en Paralelo (30 min)

**Demo**:
1. Abre [paso_6_paralelo.dart](paso_6_paralelo.dart)
2. Presiona "Abrir 4 Apps en Paralelo"
3. Muestra el cronómetro: **~3 segundos** (no 7 ni 8)
4. **Pregunta**: "¿Por qué es más rápido?"

**Código clave**:
```dart
Stopwatch stopwatch = Stopwatch()..start();

await Future.wait([
  _abrirGaleria(),      // Tarea 1
  _abrirCalendario(),   // Tarea 2
  _abrirReloj(),        // Tarea 3
  _abrirCalculadora(),  // Tarea 4
]);

stopwatch.stop();
print("Tiempo total: ${stopwatch.elapsedMilliseconds}ms");
```

#### 🎯 Concepto Clave IMPORTANTE
- **Future.wait()** ejecuta TODAS a la vez
- El tiempo total = el que toma la más lenta
- **No es** como ejecutarlas secuencialmente

---

### **SESIÓN 5: Datos Reales del Dispositivo (60 min)**

#### 📚 Teoría (10 min)
- Hasta ahora SIMULÁBAMOS con `Future.delayed()`
- Ahora vamos a leer datos VERDADEROS del dispositivo
- **La batería es REAL**, no fake

#### 💻 PASO 7: Leer Batería Real (30 min)

**Demo**:
1. Abre [paso_7_bateria.dart](paso_7_bateria.dart)
2. Muestra: "Esto es la batería REAL de tu teléfono"
3. Si el teléfono está al 87%, mostrará 87%
4. Si está cargando, presiona "Actualizar" cada 30 segundos
5. **Verás que sube** (si está enchufado)

**Código clave**:
```dart
int level = await _battery.batteryLevel;  // BATERÍA REAL
setState(() {
  nivelBateria = level;
  // El color cambia según el nivel
  if (level < 20) color = Colors.red;
  if (level < 50) color = Colors.orange;
  if (level < 80) color = Colors.yellow;
});
```

#### 📝 Ejercicio (20 min)
Pide a los estudiantes:
1. Lee la batería de tu teléfono
2. Corre la app
3. **Verifica que el porcentaje sea correcto**
4. Conecta el teléfono a la corriente
5. **Presiona "Actualizar" cada 10 segundos**
6. **¿Sube el porcentaje?** Sí, porque está cargando

#### 💡 Punto de Inflexión
**"¡No estamos simulando nada! Es código REAL!"**

---

### **SESIÓN 6: Intro a Streams (60 min)**

#### 📚 Teoría (15 min)

**Future** = Una sola respuesta DESPUÉS de X tiempo
```
Inicio ----[esperar 3 seg]---- Resultado ✓
```

**Stream** = Múltiples respuestas CONTINUAMENTE
```
Inicio
  ├─ 1 segundo: Valor 1
  ├─ 2 segundos: Valor 2
  ├─ 3 segundos: Valor 3
  └─ 4 segundos: Valor 4 ✓
```

#### 💻 PASO 8: Stream de Batería (30 min)

**Demo**:
1. Abre [paso_8_stream_bateria.dart](paso_8_stream_bateria.dart)
2. Observa: **Cada 1 segundo** emite un valor
3. Muestra el gráfico que sube/baja basado en cambios
4. **Pregunta**: "¿Cuál es la diferencia con Paso 7?"
   - Paso 7: Lees UNA VEZ cuando presionas el botón
   - Paso 8: Se actualiza AUTOMÁTICAMENTE cada segundo

**Código clave**:
```dart
_bateriaStream = Stream.periodic(
  Duration(seconds: 1),  // Cada 1 segundo
  (_) => _obtenerBateria(),
);

StreamBuilder<int>(
  stream: _bateriaStream,
  builder: (context, snapshot) {
    int nivel = snapshot.data ?? 0;
    return Text("$nivel%");  // Actualiza cada segundo
  },
)
```

#### 🎯 Concepto Clave
- **Stream.periodic()** emite valores CONTINUAMENTE
- **StreamBuilder** es un widget que ESCUCHA el Stream
- Cada vez que el Stream emite, el widget se reconstruye

---

### **SESIÓN 7: Múltiples Streams Combinados (60 min)**

#### 💻 PASO 9: Dos Streams (40 min)

**Concepto**: Múltiples datos actualizándose A LA VEZ

**Demo**:
1. Abre [paso_9_dos_streams.dart](paso_9_dos_streams.dart)
2. Observa:
   - Arriba: Batería (actualiza cada 1 segundo)
   - Abajo: Velocidad internet (actualiza cada 0.5 segundos)
3. Ambas se actualizan INDEPENDIENTEMENTE
4. **Pregunta**: "¿Son esos los mismos datos de Paso 8?"
   - No, uno es batería, otro es velocidad

**Código visualizado**:
```dart
// Stream 1: Batería
StreamBuilder<int>(stream: _bateriaStream, ...);

// Stream 2: Velocidad
StreamBuilder<double>(stream: _velocidadStream, ...);
```

#### 📝 Ejercicio (20 min)
Pide que creen su propio Stream:
```dart
Stream<String> horaActual() {
  return Stream.periodic(
    Duration(seconds: 1),
    (_) => DateTime.now().toString(),
  );
}
```

---

### **SESIÓN 8: Proyecto Capstone - Panel de Control (60 min)**

#### 🎯 Objetivo Final
Integrar TODO lo aprendido en UN proyecto completo

#### 💻 PASO 10: Panel de Control (50 min)

**Demo**:
1. Abre [paso_10_panel.dart](paso_10_panel.dart)
2. Presiona "Descargar"
3. Observa:
   - Barra circular de progreso
   - Tiempo transcurrido, tiempo restante
   - Velocidad de descarga
   - **Botones**: Pausar, Reanudar, Cancelar
4. Abajo: Estado real del dispositivo (batería, hora)

**Características implementadas**:
- ✅ Futures (descarga)
- ✅ Timer (actualización cada 100ms)
- ✅ setState (actualización de UI)
- ✅ Streams (batería en tiempo real)
- ✅ StreamBuilder (escucha el Stream)
- ✅ Manejo de estado (pausada, descargando, etc)

#### 🏆 Proyecto Final para Estudiantes (10 min)

**Desafío**:
1. **Crea tu propia versión del Paso 10** con:
   - Descarga de un archivo diferente (película, canción, etc)
   - Mostrar nombre del archivo
   - Velocidad promedio
   - Botón para "repetir descarga"
   - Mostrar batería en tiempo real

2. **Extensión avanzada**:
   - Descarga múltiples archivos en paralelo
   - Mostrar progreso individual de cada uno
   - Calculador de tiempo restante TOTAL

---

## 🎓 Tabla de Objetivos por Sesión

| Sesión | Pasos | Conceptos | Duración |
|--------|-------|-----------|----------|
| 1 | P1 | Future, async, await | 60 min |
| 2 | P2, P4 | Intents, launchUrl, Share | 60 min |
| 3 | P3, P5 | Secuencial, try/catch | 60 min |
| 4 | P6 | Future.wait(), paralelo | 60 min |
| 5 | P7 | Datos reales del dispositivo | 60 min |
| 6 | P8 | Stream.periodic(), StreamBuilder | 60 min |
| 7 | P9 | Múltiples Streams | 60 min |
| 8 | P10 | Proyecto completo + Evaluación | 60 min |

**TOTAL**: 480 minutos = 8 horas

---

## 🤔 Preguntas por Sesión para Medir Comprensión

**Sesión 1**:
- ¿Cuál es la diferencia entre esperar 5 segundos bloqueante vs no bloqueante?
- ¿Qué significa `await`?

**Sesión 2**:
- ¿Quién decide si se hace la llamada telefónica?
- ¿Cuándo regresa el control a mi app?

**Sesión 3**:
- ¿Cuánto tiempo tarda ejecutar 3 Futures secuenciales de 2, 1 y 3 segundos?
- ¿Cómo capturo un error que ocurre dentro de un Future?

**Sesión 4**:
- ¿Cuánto tiempo tarda ejecutar 4 Futures en paralelo de 3, 2, 1 y 2 segundos?
- ¿Qué es `Future.wait()`?

**Sesión 5**:
- ¿De dónde sale el porcentaje de batería? ¿Lo inventamos?
- ¿Qué pasa si lees batería cada segundo durante una hora?

**Sesión 6**:
- ¿Cuál es la diferencia entre un Future y un Stream?
- ¿Cuándo usarías Stream.periodic()?

**Sesión 7**:
- ¿Puedo tener 2 Streams simultáneos?
- ¿Se interfieren uno con otro?

**Sesión 8**:
- Explica cómo funcionaría una descarga pausable
- ¿Cómo mostrarías progreso de descarga en tiempo real?

---

## 💡 Tips Pedagógicos

1. **Visual > Teórico**: Dibuja diagramas, anima conceptos
2. **Demostración en Vivo**: Ejecuta el código delante de todos
3. **Interactividad**: Haz que los estudiantes presionen botones
4. **Preguntas Abiertas**: "¿Qué creen que pasa si...?"
5. **Comparación**: Secuencial vs Paralelo, Future vs Stream
6. **Dispositivo Real**: Usa tu móvil, no el emulador
7. **Errores Intencionales**: Muestra qué pasa si falla algo
8. **Proyecto Práctico**: El Paso 10 es lo más importante

---

## 📚 Recursos Adicionales

- [Documentación Oficial Dart Async](https://dart.dev/codelabs/async-await)
- [Flutter Streams](https://api.flutter.dev/flutter/dart-async/Stream-class.html)
- [DartPad Playground](https://dartpad.dev/)

---

**Creado**: 12 de febrero de 2026  
**Duración Total**: 8 horas (1 semana intensiva o 4 semanas 2h/semana)  
**Nivel**: 15+ años  
**Prerrequisitos**: Básico de Flutter y Dart
