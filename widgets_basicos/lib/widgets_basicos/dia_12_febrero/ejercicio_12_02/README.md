# 📚 Ejercicio Completo: Asincronía en Dart y Flutter (10 Pasos)

## 📁 Estructura de la Carpeta

```
lib/ejercicio_12_02/
├── main.dart                    ← Pantalla principal con navegación (10 pasos)
│
├── PASOS (Nivel Básico): Futures
├── paso_1_vibracion.dart       ← Hacer vibrar el teléfono (500ms)
├── paso_2_llamada.dart         ← Abrir app de teléfono para llamar
├── paso_3_tareas_orden.dart    ← Ejecutar 3 tareas secuenciales
│
├── PASOS (Nivel Intermedio): Manejo Avanzado
├── paso_4_compartir.dart       ← Compartir contenido en redes
├── paso_5_errores.dart         ← Manejo de excepciones en Futures
├── paso_6_paralelo.dart        ← Abrir 4 apps en paralelo con Future.wait()
├── paso_7_bateria.dart         ← Leer batería REAL del dispositivo
│
├── PASOS (Nivel Avanzado): Streams
├── paso_8_stream_bateria.dart  ← Stream que actualiza cada 1 segundo
├── paso_9_dos_streams.dart     ← Dos Streams simultáneos (batería + internet)
├── paso_10_panel.dart          ← Proyecto capstone: Panel de control
│
└── DOCUMENTACIÓN
    ├── README.md               ← Este archivo
    ├── COMO_USAR.dart          ← Cómo integrar en tu proyecto
    ├── GUIA_CLASE.md           ← Plan de 4 sesiones de clase
    └── conceptos_teoricos.dart ← Widget educativo interactivo
```

---

## 🎯 ¿Qué hace cada Paso?

| # | Nombre | Concepto | Tiempo |
|---|--------|----------|--------|
| **1** | Vibración | `Future` simple | 30 min |
| **2** | Llamadas | Intent a otra app | 30 min |
| **3** | Tareas en Orden | Secuencial con `await` | 30 min |
| **4** | Compartir | Intent + respuesta del usuario | 30 min |
| **5** | Errores | Try/catch en Futures | 30 min |
| **6** | Paralelo | `Future.wait()` | 30 min |
| **7** | Batería | Datos reales del dispositivo | 30 min |
| **8** | Stream Batería | `Stream.periodic()` | 40 min |
| **9** | Dos Streams | Múltiples Streams | 40 min |
| **10** | Panel Control | Proyecto capstone | 60 min |

---

## 🚀 Cómo Usar

### 1. **Opción A: Reemplazar el home (LA MÁS FÁCIL)**

En tu `lib/main.dart`:

```dart
import 'package:flutter/material.dart';
import '../../../ejercicio_12_02/ejercicio_12_02/main.dart';  // ← IMPORTA AQUÍ

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EjercicioAsincroniaMain(),  // ← AQUÍ
    );
  }
}
```

### 2. **Opción B: Como una ruta adicional (MENÚ)**

```dart
MaterialApp(
  routes: {
    '/ejercicio-asincronia': (context) => const EjercicioAsincroniaMain(),
  },
)
```

### 3. **Opción C: Mostrar solo un paso**

```dart
home: const Paso1Vibracion(),  // O cualquier otro paso
```

---

## 📦 Paquetes Requeridos

Estos ya están instalados:

```bash
flutter pub add vibration battery_plus url_launcher share_plus
```

- **vibration** → Hacer vibrar el teléfono
- **battery_plus** → Leer nivel de batería
- **url_launcher** → Hacer llamadas y abrir apps
- **share_plus** → Abrir dialogo de compartir

---

## ✅ Características de cada Paso

### **Paso 1: Vibración** 🔊
```dart
await Vibration.vibrate(duration: 500);
```
- Enseña: `Future` y `async/await`
- Acción: El teléfono vibra
- Duración: ~2 min

### **Paso 2: Llamadas** 📞
```dart
await launchUrl(Uri(scheme: 'tel', path: '+34666666666'));
```
- Enseña: Intent a otra aplicación
- Acción: Abre app de teléfono
- Duración: ~2 min

### **Paso 3: Tareas en Orden** 📋
```dart
await Future.delayed(Duration(seconds: 2));  // Paso 1
await Future.delayed(Duration(seconds: 1));  // Paso 2
await Future.delayed(Duration(seconds: 3));  // Paso 3
```
- Enseña: Secuencial = uno tras otro
- Acción: Simula preparar receta
- Duración: ~6 segundos

### **Paso 4: Compartir** 📤
```dart
await Share.share(textoCompartir);
```
- Enseña: Capturar respuesta del usuario
- Acción: Abre dialogo de compartir
- Duración: Variable (usuario)

### **Paso 5: Errores** ⚠️
```dart
try {
  // Operación que puede fallar
} catch (e) {
  // Manejar error
}
```
- Enseña: Manejo de excepciones
- Acción: Intenta instalar app (60% éxito)
- Duración: ~2 seg

### **Paso 6: Paralelo** ⚡
```dart
await Future.wait([tarea1(), tarea2(), tarea3(), tarea4()]);
```
- Enseña: Ejecutar tareas AL MISMO TIEMPO
- Acción: Abre 4 apps en paralelo
- Duración: ~3 segundos (no 12)

### **Paso 7: Batería** 🔋
```dart
int level = await _battery.batteryLevel;
```
- Enseña: Leer datos REALES del dispositivo
- Acción: Muestra % de batería verdadero
- Duración: Instantáneo

### **Paso 8: Stream de Batería** 📊
```dart
Stream.periodic(Duration(seconds: 1), (_) => getLavel());
```
- Enseña: `Stream` para datos continuos
- Acción: Actualiza cada 1 segundo
- Duración: Continuo

### **Paso 9: Dos Streams** 📈
```dart
StreamBuilder<int>(stream: _bateriaStream, ...)
StreamBuilder<double>(stream: _velocidadStream, ...)
```
- Enseña: Múltiples Streams independientes
- Acción: Batería + Velocidad internet
- Duración: Continuo

### **Paso 10: Panel Control** 🎛️
- Enseña: **TODO INTEGRADO**
- Acción: Descarga con pausa/reanudación
- Duración: 15 segundos simulados

---

## 🔧 Permisos Necesarios

### **Android** (`android/app/src/main/AndroidManifest.xml`)

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Vibración -->
    <uses-permission android:name="android.permission.VIBRATE" />
    
    <!-- Llamadas -->
    <uses-permission android:name="android.permission.CALL_PHONE" />
    
    <!-- Batería (automático) -->
    <!-- Compartir (automático) -->
</manifest>
```

### **iOS** (`ios/Runner/Info.plist`)

Estos permisos ya están configurados por defecto en Flutter.

---

## 🐛 Troubleshooting

### ❌ "Error: vibration is not available"
- **Causa**: El emulador no lo soporta siempre
- **Solución**: Prueba en dispositivo físico

### ❌ "Error: No se puede hacer llamadas"
- **Causa**: Emulador limitado
- **Solución**: Dispositivo físico (¡funcionará perfectamente!)

### ❌ "Batería muestra 0%"
- **Causa**: Síndrome del emulador
- **Solución**: Dispositivo físico = datos reales

### ❌ "Los imports dan error"
- **Causa**: Paquetes no instalados
- **Solución**: `flutter pub get`

### ❌ "Widget no aparece"
- **Causa**: Problema de navegación
- **Solución**: Verifica que imports sean correctos

---

## 📊 Estructura de la Navegación

```
main.dart
  ├─ Paso 1: Vibración
  ├─ Paso 2: Llamadas
  ├─ Paso 3: Tareas en Orden
  ├─ Paso 4: Compartir
  ├─ Paso 5: Errores
  ├─ Paso 6: Paralelo
  ├─ Paso 7: Batería
  ├─ Paso 8: Stream Batería
  ├─ Paso 9: Dos Streams
  └─ Paso 10: Panel Control
```

BottomNavigationBar con 10 pestañas (P1, P2, ..., P10)

---

## 📚 Conceptos Clave Enseñados

| Concepto | Paso(s) | Explicación |
|----------|---------|-------------|
| **Future** | 1, 2, 3 | Operación que toma tiempo |
| **async/await** | Todos | Sintaxis para Futures |
| **Intent** | 2, 4 | Abrir otras apps del sistema |
| **Secuencial** | 3, 5 | Una tarea tras otra |
| **Paralelo** | 6 | Varias tareas a la vez |
| **Try/Catch** | 5 | Manejo de errores |
| **Stream** | 8, 9, 10 | Datos continuos |
| **StreamBuilder** | 8, 9, 10 | Widget que escucha Streams |

---

## 🎓 Recomendación de Uso en Clase

**Semana 1: Futures Básicos**
- Semana 1, Clase 1: Paso 1 (Vibración)
- Semana 1, Clase 2: Paso 2 + 3 (Llamadas + Tareas en orden)

**Semana 2: Manejo Avanzado**
- Semana 2, Clase 1: Paso 4 + 5 (Compartir + Errores)
- Semana 2, Clase 2: Paso 6 + 7 (Paralelo + Batería)

**Semana 3: Streams**
- Semana 3, Clase 1: Paso 8 + 9 (Streams)
- Semana 3, Clase 2: Paso 10 (Proyecto Final)

---

## 💡 Tips para Profesores

1. **Usa dispositivo físico** siempre que sea posible
2. **Explica visualmente**: Dibuja en la pizarra Future vs bloqueante
3. **Muestra errores**: Déjales fallar intencionalmente para entender
4. **Haz preguntas**: "¿Qué creen que pasará si...?"
5. **Proyecto final**: Pide que creen su propia versión del Paso 10

---

## 📖 Archivos Adicionales

- **COMO_USAR.dart** → 3 formas de integración + checklist
- **GUIA_CLASE.md** → Plan de 4 sesiones con preguntas
- **conceptos_teoricos.dart** → Widget interactivo educativo

---

**Creado**: 12 de febrero de 2026  
**Para**: Estudiantes desde 15 años  
**Nivel**: Básico → Intermedio → Avanzado  
**Tiempo total**: ~8 horas de clase
