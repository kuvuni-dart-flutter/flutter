# 🎓 Ejercicio de Asincronía en Flutter - Instrucciones para Alumnos

## 📖 Introducción

Este ejercicio te enseñará a trabajar con **programación asincrónica** en Flutter, un concepto fundamental para crear aplicaciones modernas que interactúan con el sistema, APIs y datos en tiempo real.

---

## 🎯 Objetivos de Aprendizaje

Al completar este ejercicio aprenderás a:

1. ✅ Instalar y gestionar paquetes externos en Flutter
2. ✅ Comprender qué es la asincronía y por qué es importante
3. ✅ Trabajar con `Future` para operaciones que tardan tiempo
4. ✅ Usar `async` y `await` para escribir código asincrónico legible
5. ✅ Manejar errores en operaciones asincrónicas
6. ✅ Ejecutar tareas en paralelo con `Future.wait()`
7. ✅ Trabajar con `Stream` para datos continuos
8. ✅ Integrar múltiples Streams en una interfaz

---

## 📚 Conceptos Clave

### ¿Qué es la Asincronía?

La **programación asincrónica** permite que tu aplicación realice múltiples tareas sin bloquear la interfaz de usuario. Imagina:

- **Síncrono (bloqueante)**: Como hacer fila en el banco - debes esperar a que termine la persona delante de ti
- **Asíncrono (no bloqueante)**: Como pedir comida a domicilio - haces el pedido y sigues con tu vida mientras llega

### Future vs Stream

| Concepto | ¿Qué es? | Ejemplo |
|----------|----------|---------|
| **Future** | Una operación que devuelve UN resultado en el futuro | Descargar un archivo, hacer una llamada |
| **Stream** | Una secuencia de MÚLTIPLES valores a lo largo del tiempo | Nivel de batería cada segundo, ubicación GPS |

---

## 📦 Paquetes Necesarios

Para este ejercicio necesitarás instalar 4 paquetes externos. Aquí están los enlaces oficiales:

### 1. **vibration** - Hacer vibrar el dispositivo
- 📦 **pub.dev**: https://pub.dev/packages/vibration
- 🎯 **Uso**: Proporciona feedback táctil al usuario
- 📱 **Plataformas**: Android, iOS

### 2. **battery_plus** - Leer nivel de batería
- 📦 **pub.dev**: https://pub.dev/packages/battery_plus
- 🎯 **Uso**: Obtener información de la batería del dispositivo
- 📱 **Plataformas**: Android, iOS, Web, Windows, Linux, macOS

### 3. **url_launcher** - Abrir URLs y otras apps
- 📦 **pub.dev**: https://pub.dev/packages/url_launcher
- 🎯 **Uso**: Hacer llamadas, abrir navegador, enviar emails
- 📱 **Plataformas**: Android, iOS, Web, Windows, Linux, macOS

### 4. **share_plus** - Compartir contenido
- 📦 **pub.dev**: https://pub.dev/packages/share_plus
- 🎯 **Uso**: Compartir texto o archivos en redes sociales
- 📱 **Plataformas**: Android, iOS, Web, Windows, Linux, macOS

---

## 🛠️ Cómo Instalar Paquetes

### Método 1: Comando en Terminal (Recomendado)

Abre la terminal en la raíz de tu proyecto y ejecuta:

```bash
flutter pub add vibration battery_plus url_launcher share_plus
```

Este comando:
- ✅ Descarga los paquetes
- ✅ Los añade automáticamente a `pubspec.yaml`
- ✅ Actualiza las dependencias

### Método 2: Manual (Editando pubspec.yaml)

1. Abre el archivo `pubspec.yaml`
2. Busca la sección `dependencies:`
3. Añade los paquetes (respeta la indentación):

```yaml
dependencies:
  flutter:
    sdk: flutter
  vibration: ^2.0.0
  battery_plus: ^6.0.0
  url_launcher: ^6.3.0
  share_plus: ^10.0.0
```

4. Guarda el archivo
5. Ejecuta en terminal: `flutter pub get`

### Verificar Instalación

Para comprobar que todo está correcto:

```bash
flutter pub deps
```

---

## 🎮 Estructura del Ejercicio

El ejercicio tiene **10 pasos progresivos** divididos en 3 niveles:

### 📗 Nivel Básico: Foundations (Pasos 1-3)

**Paso 1: Vibración Simple** 🔊
- **Concepto**: Tu primer `Future` y `async/await`
- **Objetivo**: Hacer vibrar el teléfono durante 500ms
- **Aprenderás**: Cómo esperar a que una operación termine

**Paso 2: Hacer Llamadas** 📞
- **Concepto**: Interactuar con otras aplicaciones
- **Objetivo**: Abrir la app de teléfono con un número
- **Aprenderás**: Usar intents para comunicarse con el sistema

**Paso 3: Tareas en Orden** 📋
- **Concepto**: Ejecución secuencial
- **Objetivo**: Ejecutar 3 tareas una tras otra
- **Aprenderás**: Por qué el orden importa y cómo controlarlo

---

### 📘 Nivel Intermedio: Control (Pasos 4-7)

**Paso 4: Compartir Contenido** 📤
- **Concepto**: Capturar respuesta del usuario
- **Objetivo**: Abrir el diálogo nativo para compartir texto
- **Aprenderás**: Que algunas operaciones dependen de la acción del usuario

**Paso 5: Manejo de Errores** ⚠️
- **Concepto**: `try-catch` con Futures
- **Objetivo**: Manejar operaciones que pueden fallar
- **Aprenderás**: Cómo tu app puede sobrevivir a errores

**Paso 6: Ejecución Paralela** ⚡
- **Concepto**: `Future.wait()` para tareas simultáneas
- **Objetivo**: Abrir 4 apps al mismo tiempo
- **Aprenderás**: Diferencia entre secuencial (lento) y paralelo (rápido)

**Paso 7: Datos Reales del Dispositivo** 🔋
- **Concepto**: Leer información del hardware
- **Objetivo**: Mostrar el nivel de batería actual
- **Aprenderás**: Cómo acceder a APIs nativas desde Flutter

---

### 📙 Nivel Avanzado: Streams (Pasos 8-10)

**Paso 8: Stream de Batería** 📊
- **Concepto**: `Stream.periodic()` para datos continuos
- **Objetivo**: Actualizar el nivel de batería cada segundo
- **Aprenderás**: Diferencia entre un Future (1 valor) y Stream (muchos valores)

**Paso 9: Múltiples Streams** 📈
- **Concepto**: Gestionar varios Streams simultáneamente
- **Objetivo**: Mostrar batería + velocidad de internet en tiempo real
- **Aprenderás**: Cómo combinar múltiples fuentes de datos

**Paso 10: Panel de Control** 🎛️
- **Concepto**: **Proyecto Capstone** que integra TODO
- **Objetivo**: Crear un simulador de descarga con pausa/reanudación
- **Aprenderás**: Aplicar todos los conceptos en un proyecto real

---

## ⏱️ Tiempo Estimado

| Nivel | Pasos | Tiempo Total |
|-------|-------|--------------|
| Básico | 1-3 | 1.5 horas |
| Intermedio | 4-7 | 2 horas |
| Avanzado | 8-10 | 2.5 horas |
| **TOTAL** | 1-10 | **6 horas** |

---

## 📱 Configuración de Permisos

Algunos paquetes necesitan permisos especiales del sistema operativo.

### Android (archivo: `android/app/src/main/AndroidManifest.xml`)

Necesitarás añadir estos permisos:

```xml
<uses-permission android:name="android.permission.VIBRATE" />
<uses-permission android:name="android.permission.INTERNET" />
```

### iOS (archivo: `ios/Runner/Info.plist`)

Para hacer llamadas, añade:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>tel</string>
    <string>mailto</string>
</array>
```

---

## 🔗 Recursos Adicionales

### Documentación Oficial de Dart/Flutter

- **Asynchronous programming**: https://dart.dev/codelabs/async-await
- **Streams**: https://dart.dev/tutorials/language/streams
- **Future class**: https://api.dart.dev/stable/dart-async/Future-class.html
- **Stream class**: https://api.dart.dev/stable/dart-async/Stream-class.html

### Videos Educativos (Flutter Official)

- **Isolates and event loops**: https://www.youtube.com/watch?v=vl_AaCgudcY
- **Async/Await**: https://www.youtube.com/watch?v=SmTCmDMi4BY
- **Streams**: https://www.youtube.com/watch?v=nQBpOIHE4eE

### Tutoriales Interactivos

- **DartPad (prueba código en el navegador)**: https://dartpad.dev/
- **Flutter Codelabs**: https://docs.flutter.dev/codelabs

---

## ✅ Checklist de Inicio

Antes de empezar, asegúrate de:

- [ ] Tener Flutter instalado (verifica con `flutter doctor`)
- [ ] Tener un editor (VS Code o Android Studio)
- [ ] Tener un dispositivo físico o emulador configurado
- [ ] Haber ejecutado `flutter pub add` con los 4 paquetes
- [ ] Poder ejecutar `flutter run` sin errores
- [ ] Tener conexión a Internet (para descargar paquetes)

---

## 🎯 Metodología de Trabajo Sugerida

### Para Cada Paso:

1. **Lee la descripción** del concepto que vas a aprender
2. **Investiga** en la documentación de pub.dev del paquete
3. **Crea el archivo** del paso (ej: `paso_1_vibracion.dart`)
4. **Implementa** la funcionalidad usando los conceptos aprendidos
5. **Prueba** en un dispositivo físico o emulador
6. **Reflexiona**: ¿Qué pasaría si no usara `await`? ¿Y si el usuario no tiene internet?

### Preguntas Guía por Nivel

**Nivel Básico (1-3)**
- ¿Qué pasa si quito el `await`?
- ¿Por qué necesito marcar la función con `async`?
- ¿Cuánto tarda realmente cada operación?

**Nivel Intermedio (4-7)**
- ¿Cómo capturo un error?
- ¿Cuál es la diferencia de velocidad entre secuencial y paralelo?
- ¿Qué pasa si el hardware no está disponible?

**Nivel Avanzado (8-10)**
- ¿Cuándo usar Future vs Stream?
- ¿Cómo cancelo un Stream?
- ¿Puedo combinar múltiples Streams en uno?

---

## 💡 Consejos para el Éxito

### ✅ Haz

- **Experimenta**: Cambia valores, prueba qué pasa
- **Lee los errores**: Los mensajes de error son tus amigos
- **Usa print()**: Para entender el flujo de ejecución
- **Prueba en dispositivo real**: Especialmente vibración y batería
- **Pregunta**: Si algo no funciona, pregunta al profesor

### ❌ Evita

- **Copiar sin entender**: Lee cada línea y comprende qué hace
- **Saltarte pasos**: Cada uno construye sobre el anterior
- **Ignorar warnings**: Pueden indicar problemas futuros
- **No probar**: Ejecuta el código después de cada cambio

---

## 📝 Instrucciones Detalladas por Paso

A continuación encontrarás las instrucciones específicas para implementar cada paso. Lee cuidadosamente y consulta la documentación de pub.dev de cada paquete.

---

### 🔊 PASO 1: Vibración Simple

#### Objetivo
Crear una pantalla con un botón que haga vibrar el dispositivo durante 500 milisegundos.

#### Requisitos de UI
- Un `StatefulWidget` llamado `Paso1Vibracion`
- Un título: "Paso 1: Vibración Asincrónica"
- Un texto que muestre el estado actual (mensaje)
- Un botón con icono de vibración
- Indicador de carga mientras vibra

#### Funcionalidad a Implementar

1. **Variable de estado**: 
   - `mensaje` (String): Para mostrar el estado
   - `isLoading` (bool): Para controlar el botón

2. **Función asíncrona `hacerVibrar()`**:
   - Marca la función con `async`
   - Verifica si el dispositivo soporta vibración usando `Vibration.hasVibrator()`
   - Si soporta vibración:
     - Actualiza el estado a "¡Vibrando..."
     - Llama a `Vibration.vibrate(duration: 500)` con `await`
     - Actualiza el estado a "✓ Vibración completada"
   - Si no soporta:
     - Muestra mensaje de error

3. **Importaciones necesarias**:
   - `package:flutter/material.dart`
   - `package:vibration/vibration.dart`

#### Conceptos Clave
- **Future**: `Vibration.vibrate()` devuelve un Future
- **async/await**: Esperar a que termine la vibración
- **Ciclo de vida**: Actualizar UI antes y después de la operación

#### Pistas
- Usa `setState()` para actualizar la UI
- Desactiva el botón mientras `isLoading` es true
- La vibración real dura 500ms, no es simulada

---

### 📞 PASO 2: Hacer Llamadas

#### Objetivo
Crear una pantalla con un botón que abra la aplicación de teléfono con un número pre-configurado.

#### Requisitos de UI
- Un `StatefulWidget` llamado `Paso2Llamada`
- Título: "Paso 2: Llamada Telefónica"
- Mostrar el estado actual
- Botón con icono de teléfono
- Número sugerido: +34 666 66 66 66

#### Funcionalidad a Implementar

1. **Función asíncrona `hacerLlamada(String numeroTelefono)`**:
   - Crea un `Uri` con scheme 'tel' y path con el número
   - Verifica si se puede lanzar con `canLaunchUrl(uri)`
   - Si es posible, lanza con `launchUrl(uri)` usando `await`
   - Maneja el caso cuando el usuario regrese de la app de teléfono
   - Captura errores con `try-catch`

2. **Importaciones necesarias**:
   - `package:flutter/material.dart`
   - `package:url_launcher/url_launcher.dart`

#### Conceptos Clave
- **Intent**: Tu app cede control al sistema operativo
- **URI Schemes**: `tel:`, `mailto:`, `https:`, etc.
- **Manejo de errores**: No todos los dispositivos pueden hacer llamadas

#### Pistas
- El formato del URI es: `Uri(scheme: 'tel', path: '+34666666666')`
- La app no sabe cuánto tiempo estará el usuario fuera
- Algunos emuladores no soportan llamadas reales

#### Retos
- ¿Puedes añadir un TextField para que el usuario ingrese el número?
- ¿Puedes validar que el número tenga formato correcto?

---

### 📋 PASO 3: Tareas en Orden (Secuencial)

#### Objetivo
Simular la preparación de una receta que requiere 3 pasos secuenciales, mostrando el progreso en pantalla.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso3TareasEnOrden`
- Título: "Paso 3: Tareas Secuenciales"
- Lista dinámica que muestre cada paso ejecutado
- Botón "Preparar Receta"
- Mostrar tiempo total al final

#### Funcionalidad a Implementar

1. **Variables de estado**:
   - `pasos` (List<String>): Historial de pasos ejecutados
   - `isLoading` (bool)
   - `paso` (String): Estado general

2. **Función asíncrona `prepararReceta()`**:
   - **Paso 1**: Calentar agua
     - Muestra "🔥 Calentando agua..."
     - Espera 2 segundos con `Future.delayed(Duration(seconds: 2))`
     - Marca como completado "✓ Agua caliente"
   
   - **Paso 2**: Poner el café
     - Muestra "☕ Poniendo café en la taza..."
     - Espera 1 segundo
     - Marca como completado
   
   - **Paso 3**: Infusionar
     - Muestra "⏱️ Esperando a que infusione..."
     - Espera 3 segundos
     - Marca como completado "✓ ¡Café listo!"

3. **Función auxiliar `_agregarPaso(String texto)`**:
   - Añade el texto a la lista `pasos`
   - Llama a `setState()`

#### Conceptos Clave
- **Ejecución secuencial**: Cada `await` espera a que termine el anterior
- **Future.delayed**: Simula operaciones que toman tiempo
- **Tiempo total**: 2 + 1 + 3 = 6 segundos

#### Pistas
- Usa `ListView` para mostrar la lista de pasos
- Envuelve todo en `try-catch-finally`
- Experimenta: ¿qué pasa si quitas un `await`?

#### Retos
- ¿Puedes añadir un cronómetro que muestre el tiempo transcurrido?
- ¿Puedes permitir que el usuario personalice los tiempos?

---

### 📤 PASO 4: Compartir Contenido

#### Objetivo
Abrir el diálogo nativo del sistema para compartir texto en redes sociales o apps de mensajería.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso4Compartir`
- Título: "Paso 4: Compartir en Redes Sociales"
- Botón con icono de compartir
- Mensaje que indique si se compartió o se canceló

#### Funcionalidad a Implementar

1. **Función asíncrona `compartirContenido()`**:
   - Define el texto a compartir (puede ser sobre tu app o curso)
   - Llama a `Share.share(textoCompartir)` con `await`
   - Captura el resultado en una variable `ShareResult`
   - Verifica el estado del resultado:
     - `ShareResultStatus.success`: Usuario compartió exitosamente
     - `ShareResultStatus.dismissed`: Usuario canceló
   - Actualiza el mensaje según el resultado

2. **Importaciones necesarias**:
   - `package:flutter/material.dart`
   - `package:share_plus/share_plus.dart`

#### Conceptos Clave
- **Respuesta del usuario**: La operación depende de la acción del usuario
- **ShareResult**: Objeto que contiene información sobre lo que pasó
- **Diálogo nativo**: Usa la UI del sistema operativo

#### Pistas
- El texto puede incluir emojis
- La operación es asíncrona porque espera a que el usuario actúe
- Diferentes plataformas muestran diferentes opciones de compartir

#### Retos
- ¿Puedes compartir una imagen además de texto?
- ¿Puedes compartir el contenido de un TextField editable?

---

### ⚠️ PASO 5: Manejo de Errores

#### Objetivo
Simular una operación que puede fallar aleatoriamente y manejar el error apropiadamente.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso5Errores`
- Título: "Paso 5: Manejo de Excepciones"
- Botón "Intentar Instalar App"
- Mostrar si fue éxito o error

#### Funcionalidad a Implementar

1. **Función asíncrona `intentarInstalarApp()`**:
   - Envuelve todo en un bloque `try-catch`
   - Simula instalación con `Future.delayed(Duration(seconds: 2))`
   - Genera un número aleatorio entre 0 y 1
   - Si es >= 0.4 (60% de probabilidad): Éxito
   - Si es < 0.4 (40% de probabilidad): Lanza una excepción con `throw`
   - En el bloque `catch`: Captura el error y muestra mensaje apropiado

2. **Importaciones necesarias**:
   - `package:flutter/material.dart`
   - `dart:math` (para Random)

#### Conceptos Clave
- **try-catch**: Capturar excepciones
- **throw**: Lanzar una excepción manualmente
- **finally**: Código que siempre se ejecuta (opcional)
- **Manejo robusto**: Tu app no crashea, solo muestra error

#### Pistas
- Usa `Random().nextDouble()` para generar número aleatorio
- El bloque `catch (e)` captura la excepción en la variable `e`
- Puedes tener múltiples `catch` para diferentes tipos de error

#### Retos
- ¿Puedes añadir un contador de intentos?
- ¿Puedes mostrar diferentes mensajes según el tipo de error?
- ¿Puedes implementar un sistema de "retry" automático?

---

### ⚡ PASO 6: Ejecución Paralela

#### Objetivo
Abrir 4 apps o realizar 4 operaciones simultáneamente usando `Future.wait()`.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso6AbrirEnParalelo`
- Título: "Paso 6: Operaciones en Paralelo"
- Mostrar estado de cada operación (4 chips o indicadores)
- Botón "Abrir Apps en Paralelo"
- Mostrar tiempo total transcurrido

#### Funcionalidad a Implementar

1. **Variables de estado**:
   - `appsAbiertas` (Map<String, bool>): Estado de cada app

2. **Función asíncrona `abrirAppsEnParalelo()`**:
   - Crea un `Stopwatch` y llama a `start()`
   - Usa `Future.wait([función1(), función2(), función3(), función4()])` con `await`
   - Detén el stopwatch con `stop()`
   - Calcula y muestra el tiempo con `stopwatch.elapsedMilliseconds`

3. **Funciones auxiliares** (cada una asíncrona):
   - `_abrirGaleria()`: Simula abrir galería (2 seg)
   - `_abrirCalendario()`: Simula abrir calendario (1 seg)
   - `_abrirReloj()`: Simula abrir reloj (3 seg)
   - `_abrirCalculadora()`: Simula abrir calculadora (2 seg)

4. **Función `_marcarApp(String nombre)`**:
   - Actualiza el Map para marcar como "abierta"

#### Conceptos Clave
- **Paralelo vs Secuencial**:
  - Secuencial: 2 + 1 + 3 + 2 = 8 segundos
  - Paralelo: max(2, 1, 3, 2) = 3 segundos
- **Future.wait()**: Espera a que TODAS terminen
- **Stopwatch**: Medir tiempo de ejecución

#### Pistas
- `Future.wait()` recibe una lista de Futures
- Si una falla, todas fallan (por defecto)
- Puedes usar `Future.wait(..., eagerError: false)` para continuar aunque una falle

#### Retos
- ¿Puedes mostrar cuál app se abre primero?
- ¿Puedes implementar un timeout si tarda más de 5 segundos?

---

### 🔋 PASO 7: Datos Reales del Dispositivo

#### Objetivo
Leer el nivel de batería real del dispositivo usando el paquete `battery_plus`.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso7Bateria`
- Título: "Paso 7: Batería del Dispositivo"
- Indicador visual del nivel (CircularProgressIndicator o barra)
- Botón "Leer Batería"
- Mostrar porcentaje numérico

#### Funcionalidad a Implementar

1. **Variable de instancia**:
   - `final Battery _battery = Battery();` (en la clase State)

2. **Función asíncrona `leerNivelBateria()`**:
   - Llama a `_battery.batteryLevel` con `await`
   - Esto devuelve un `int` entre 0 y 100
   - Actualiza el estado con el nivel obtenido
   - Maneja posibles errores con try-catch

3. **UI dinámica**:
   - Color del indicador según nivel:
     - Rojo si < 20%
     - Naranja si < 50%
     - Amarillo si < 80%
     - Verde si >= 80%

4. **Importaciones necesarias**:
   - `package:flutter/material.dart`
   - `package:battery_plus/battery_plus.dart`

#### Conceptos Clave
- **Hardware API**: Acceso a información del dispositivo
- **Plataforma nativa**: El paquete usa código nativo (Java/Kotlin/Swift)
- **Datos reales**: No es simulado, lee el hardware verdadero

#### Pistas
- En emuladores, suele mostrar siempre 100%
- En dispositivos reales, muestra el nivel actual
- Puedes escuchar cambios con `_battery.onBatteryStateChanged`

#### Retos
- ¿Puedes mostrar si está cargando o no?
- ¿Puedes mostrar una alerta si la batería está baja?

---

### 📊 PASO 8: Stream de Batería (Actualización Continua)

#### Objetivo
Crear un Stream que actualice el nivel de batería cada 1 segundo automáticamente.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso8StreamBateria`
- Título: "Paso 8: Stream de Batería"
- `StreamBuilder` que muestre el nivel actual
- Indicador circular animado
- Historial de últimas 10 lecturas

#### Funcionalidad a Implementar

1. **Variables de instancia**:
   - `final Battery _battery = Battery();`
   - `late Stream<int> _bateriaStream;`
   - `List<int> historial = [];`

2. **En `initState()`**:
   - Crea el Stream con `Stream.periodic(Duration(seconds: 1), (_) => ...)`
   - Usa `.asyncMap()` para convertir la función en Future
   - Ejemplo: `_bateriaStream = Stream.periodic(Duration(seconds: 1), (_) => _obtenerBateria()).asyncMap((future) => future);`

3. **Función auxiliar `_obtenerBateria()`**:
   - Función async que retorna `Future<int>`
   - Llama a `_battery.batteryLevel` con await
   - Retorna el nivel

4. **En el build()**:
   - Usa `StreamBuilder<int>`
   - Propiedad `stream`: Asigna `_bateriaStream`
   - Propiedad `builder`: Construye UI según `snapshot`
   - Maneja estados:
     - `ConnectionState.waiting`: Mostrar CircularProgressIndicator
     - `snapshot.hasError`: Mostrar error
     - `snapshot.hasData`: Mostrar el dato

5. **Actualizar historial**:
   - Cuando llega un nuevo dato, añádelo a la lista
   - Limita a 10 elementos (elimina el más antiguo si hay más)

#### Conceptos Clave
- **Stream**: Flujo continuo de datos
- **Stream.periodic**: Emite valores a intervalos regulares
- **StreamBuilder**: Widget que reconstruye automáticamente cuando llegan datos
- **asyncMap**: Transforma valores en Futures

#### Pistas
- El Stream nunca termina (emite infinitamente cada segundo)
- `ConnectionState.active` significa que el Stream está emitiendo
- No necesitas llamar a `setState()`, StreamBuilder lo hace automático

#### Retos
- ¿Puedes añadir un botón para pausar/reanudar el Stream?
- ¿Puedes graficar el historial con un chart?

---

### 📈 PASO 9: Múltiples Streams Simultáneos

#### Objetivo
Gestionar DOS Streams independientes en la misma pantalla: nivel de batería y velocidad de conexión (simulada).

#### Requisitos de UI
- `StatefulWidget` llamado `Paso9DosStreams`
- Título: "Paso 9: Múltiples Streams"
- DOS `StreamBuilder` separados:
  - Uno para batería (actualiza cada 1 segundo)
  - Uno para velocidad de internet (actualiza cada 500ms)
- Mostrar ambos valores en pantalla

#### Funcionalidad a Implementar

1. **Variables de instancia**:
   - `final Battery _battery = Battery();`
   - `late Stream<int> _bateriaStream;`
   - `late Stream<double> _velocidadStream;`

2. **En `initState()`**:
   - Crea `_bateriaStream` (cada 1 segundo)
   - Crea `_velocidadStream` (cada 500ms)
     - Genera un número aleatorio entre 0 y 100 Mbps
     - Usa `Random().nextDouble() * 100`

3. **Función `_obtenerVelocidadInternet()`**:
   - Función async que simula lectura de velocidad
   - Retorna `Future<double>`
   - Genera número aleatorio: `Random().nextDouble() * 100`

4. **En el build()**:
   - Primer `StreamBuilder<int>` para batería
   - Segundo `StreamBuilder<double>` para velocidad
   - Ambos independientes, se actualizan a su propio ritmo

5. **Colores dinámicos**:
   - Batería: Colores según nivel (rojo/naranja/verde)
   - Velocidad: Colores según Mbps (rojo < 10, naranja < 50, verde >= 50)

#### Conceptos Clave
- **Múltiples Streams**: Cada uno funciona de forma independiente
- **Frecuencias diferentes**: No necesitan sincronizarse
- **StreamBuilder anidados**: Puedes tener varios en la misma pantalla
- **Estado independiente**: Cada Stream mantiene su propio estado

#### Pistas
- Importa `dart:math` para usar Random
- Los Streams se actualizan a frecuencias diferentes
- No necesitas sincronizarlos, Flutter maneja cada uno automáticamente

#### Retos
- ¿Puedes añadir un tercer Stream para temperatura (simulada)?
- ¿Puedes combinar ambos Streams en uno solo con `StreamZip`?
- ¿Puedes pausar solo uno de los Streams?

---

### 🎛️ PASO 10: Panel de Control (Proyecto Capstone)

#### Objetivo
Crear un simulador de descarga con Stream que permita pausar, reanudar y mostrar progreso en tiempo real.

#### Requisitos de UI
- `StatefulWidget` llamado `Paso10Panel`
- Título: "Paso 10: Panel de Control"
- Barra de progreso animada
- Tres botones: Iniciar, Pausar, Reanudar
- Información en tiempo real:
  - Porcentaje descargado
  - Velocidad actual
  - Tiempo transcurrido
  - Tiempo estimado restante

#### Funcionalidad a Implementar

1. **Variables de instancia**:
   - `Stream<double>? _progresoStream;`
   - `StreamController<double>? _streamController;`
   - `bool _isPaused = false;`
   - `double _progresoActual = 0.0;`

2. **Función `iniciarDescarga()`**:
   - Crea un `StreamController<double>()`
   - Genera un Stream que emite progreso cada 100ms
   - Incrementa el progreso de 0.0 a 1.0 (0% a 100%)
   - Cuando el progreso llegue a 1.0, cierra el Stream

3. **Función `pausarDescarga()`**:
   - Marca `_isPaused = true`
   - Detén el Stream temporalmente (guarda el progreso actual)

4. **Función `reanudarDescarga()`**:
   - Marca `_isPaused = false`
   - Continúa el Stream desde donde se pausó

5. **En el build()****:
   - `StreamBuilder<double>` para el progreso
   - `LinearProgressIndicator` con `value: snapshot.data`
   - Botones condicionales:
     - Mostrar "Pausar" solo si está descargando
     - Mostrar "Reanudar" solo si está pausado
     - Mostrar "Iniciar" solo si no ha comenzado o terminó

6. **Cálculos adicionales**:
   - Velocidad: `(progresoActual * 100) / tiempoTranscurrido` MB/s
   - Tiempo restante: `(1.0 - progresoActual) / velocidadPromedio`

#### Conceptos Clave
- **StreamController**: Control manual de un Stream
- **Pausa/Reanudación**: Control del flujo de datos
- **Estado complejo**: Múltiples estados (inactivo, descargando, pausado, completado)
- **Cálculos en tiempo real**: Usar datos del Stream para estadísticas

#### Pistas
- `StreamController` te da control total sobre cuándo emitir datos
- Puedes usar `Timer.periodic` junto con StreamController
- Recuerda cerrar el StreamController en `dispose()`

#### Retos
- ¿Puedes simular errores aleatorios durante la descarga?
- ¿Puedes añadir un botón de "Cancelar" que reinicie todo?
- ¿Puedes simular múltiples descargas simultáneas?
- ¿Puedes guardar el progreso con SharedPreferences para retomarlo después?

---

## 🧪 Pruebas y Validación

### Cómo Probar Cada Paso

1. **Paso 1 (Vibración)**: 
   - ✅ El botón se desactiva mientras vibra
   - ✅ Sientes la vibración en dispositivo físico
   - ✅ El mensaje cambia correctamente

2. **Paso 2 (Llamadas)**:
   - ✅ Abre la app de teléfono con el número correcto
   - ✅ Maneja el error si no hay app de teléfono

3. **Paso 3 (Secuencial)**:
   - ✅ Los pasos se ejecutan en orden (no todos al mismo tiempo)
   - ✅ El tiempo total es aproximadamente 6 segundos
   - ✅ La lista muestra cada paso conforme se completa

4. **Paso 4 (Compartir)**:
   - ✅ Abre el diálogo de compartir
   - ✅ Detecta si el usuario compartió o canceló
   - ✅ El mensaje se actualiza según la acción del usuario

5. **Paso 5 (Errores)**:
   - ✅ A veces muestra éxito, a veces error (aleatorio)
   - ✅ La app no crashea cuando hay error
   - ✅ El mensaje de error es claro

6. **Paso 6 (Paralelo)**:
   - ✅ El tiempo total es menor a 5 segundos (no 8 segundos)
   - ✅ Todas las operaciones inician casi simultáneamente
   - ✅ El contador de tiempo funciona correctamente

7. **Paso 7 (Batería)**:
   - ✅ Muestra el nivel real en dispositivo físico
   - ✅ El color cambia según el nivel
   - ✅ Maneja el error si no puede leer la batería

8. **Paso 8 (Stream Batería)**:
   - ✅ Se actualiza automáticamente cada segundo
   - ✅ No necesitas presionar un botón
   - ✅ El historial se actualiza correctamente

9. **Paso 9 (Dos Streams)**:
   - ✅ Ambos valores se actualizan independientemente
   - ✅ Las frecuencias son diferentes (1 seg vs 500ms)
   - ✅ Los colores cambian dinámicamente

10. **Paso 10 (Panel)**:
    - ✅ El progreso va de 0% a 100%
    - ✅ Puedes pausar y reanudar
    - ✅ El tiempo estimado tiene sentido
    - ✅ La velocidad se calcula correctamente

---

## 🆘 Problemas Comunes y Soluciones

### Error: "Package vibration not found"
**Solución**: Ejecuta `flutter pub get` nuevamente

### Error: "Missing permissions"
**Solución**: Revisa la sección de permisos y actualiza AndroidManifest.xml

### Error: "Future is not a subtype of Widget"
**Solución**: Probablemente olvidaste usar `FutureBuilder` o `async/await`

### La vibración no funciona
**Solución**: 
- Asegúrate de probar en dispositivo físico (no todos los emuladores soportan vibración)
- Verifica que los permisos estén añadidos en AndroidManifest.xml

### El nivel de batería siempre es 100%
**Solución**: Algunos emuladores no simulan batería correctamente. Prueba en dispositivo real.

---

## 🏆 Desafíos Extra (Opcional)

Si terminas pronto, intenta:

1. **Combinar pasos**: Crea una app que vibre cuando la batería baje del 20%
2. **Añadir animaciones**: Usa animaciones durante operaciones asíncronas
3. **Persistencia**: Guarda el historial de llamadas con SharedPreferences
4. **Notificaciones**: Añade el paquete `flutter_local_notifications` y notifica cuando termine una descarga

---

## 📞 Contacto

Si tienes dudas durante el ejercicio:
- ✉️ Consulta con tu profesor
- 💬 Pregunta en el grupo de clase
- 📖 Revisa la documentación oficial en los enlaces proporcionados

---

## 📝 Evaluación

Al finalizar, deberías ser capaz de:

- [ ] Explicar qué es un `Future` y cuándo usarlo
- [ ] Usar `async` y `await` correctamente
- [ ] Manejar errores en operaciones asíncronas
- [ ] Diferenciar entre ejecución secuencial y paralela
- [ ] Explicar qué es un `Stream` y en qué se diferencia de un `Future`
- [ ] Integrar paquetes externos en tu proyecto
- [ ] Configurar permisos nativos en Android/iOS
- [ ] Crear una interfaz que responda a datos en tiempo real

---

## 🎓 Conclusión

La programación asincrónica es **fundamental** en el desarrollo móvil moderno. Prácticamente toda app que descargues usa estos conceptos:

- **WhatsApp**: Streams para mensajes en tiempo real
- **YouTube**: Futures para cargar videos
- **Instagram**: Paralelo para cargar múltiples imágenes
- **Spotify**: Streams para reproducción continua

¡Dominar estos conceptos te convertirá en un desarrollador Flutter completo!

---

**¡Buena suerte y disfruta aprendiendo! 🚀**

---

*Versión 1.0 - Febrero 2026*
*Curso Flutter Getafe*
