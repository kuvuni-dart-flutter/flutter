# 📚 Guía de Soluciones - Día 11: Persistencia de Datos

## Resumen de Errores por Archivo

---

## 📄 1. `shared_preferences_ejemplo.dart`

### Error 1: Parámetro sin valor por defecto en `fromJson()`
**Línea:** ~65  
**Tipo:** Error de null safety  
**Problema:** El parámetro `token` en el factory constructor `fromJson()` no tiene valor por defecto
```dart
// ❌ INCORRECTO
factory Preferencias.fromJson(Map<String, dynamic> json) {
  return Preferencias(
    ...
    token: json['token'],  // ¿Qué pasa si json no tiene 'token'?
```
**Solución:** Proporcionar un valor por defecto con el operador `??`
```dart
// ✓ CORRECTO
factory Preferencias.fromJson(Map<String, dynamic> json) {
  return Preferencias(
    ...
    token: json['token'] ?? '',  // Valor por defecto: string vacío
```

---

### Error 2: Tipo incorrecto en `leerToken()`
**Línea:** ~175-180  
**Tipo:** Error de compilación (type mismatch)  
**Problema:** El método retorna `String` pero usa `getInt()` que retorna `int`
```dart
// ❌ INCORRECTO
static Future<String> leerToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_claveToken) ?? 0;  // getInt retorna int, no String!
```
**Solución:** Usar `getString()` en lugar de `getInt()`
```dart
// ✓ CORRECTO
static Future<String> leerToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(_claveToken) ?? '';  // getString retorna String
```

---

### Error 3: Falta `await` en `guardarPreferencias()`
**Línea:** ~230-245  
**Tipo:** Error de compilación (missing await)  
**Problema:** Llamada a método asíncrono sin `await`
```dart
// ❌ INCORRECTO
static Future<void> guardarPreferencias(Preferencias prefs) async {
  final preferences = await SharedPreferences.getInstance();
  
  await preferences.setString(_claveTema, prefs.tema);
  await preferences.setString(_claveIdioma, prefs.idioma);
  guardarNotificaciones(prefs.notificacionesHabilitadas);  // ¡Falta await!
```
**Solución:** Agregar `await` a la llamada asíncrona
```dart
// ✓ CORRECTO
await guardarNotificaciones(prefs.notificacionesHabilitadas);  // Ahora con await
```

---

### Error 4: Null check innecesario en `cargarPreferencias()`
**Línea:** ~265-270  
**Tipo:** Error de lógica  
**Problema:** Verificar null en variable que ya se sabe que no es null
```dart
// ❌ INCORRECTO
void cargarPreferencias() async {
  preferencias = await AlmacenamientoPreferencias.leerPreferencias();
  if (preferencias != null) {  // Siempre será no-null (siempre retorna Preferencias)
    setState(() {
      cargando = false;
    });
  }
}
```
**Solución:** Remover la verificación innecesaria
```dart
// ✓ CORRECTO
void cargarPreferencias() async {
  preferencias = await AlmacenamientoPreferencias.leerPreferencias();
  setState(() {
    cargando = false;  // Siempre actualizar
  });
}
```

---

### Error 5: Usando `getInt()` en lugar de `getString()`
**Línea:** ~155-160  
**Tipo:** Error de tipo en método  
**Problema:** Acceder a un valor string usando getInt()
```dart
// ❌ INCORRECTO
// En el método leerToken() o similar
return prefs.getInt(_claveToken) ?? 0;
```
**Solución:** Usar el tipo de dato correcto
```dart
// ✓ CORRECTO
return prefs.getString(_claveToken) ?? '';
```

---

### Error 6: Falta async en callback de `onChanged()`
**Línea:** ~300-310  
**Tipo:** Error de lógica  
**Problema:** Callback que llama método asíncrono sin esperar
```dart
// ❌ INCORRECTO
DropdownButton<String>(
  value: preferencias.tema,
  onChanged: (valor) {  // Falta async
    AlmacenamientoPreferencias.guardarTema(valor);  // Inicia pero no espera
  },
)
```
**Solución:** Hacer el callback async y esperar
```dart
// ✓ CORRECTO
DropdownButton<String>(
  value: preferencias.tema,
  onChanged: (valor) async {
    await AlmacenamientoPreferencias.guardarTema(valor);
  },
)
```

---

## 📦 2. `hive_ejemplo.dart`

### Error 1: Tipo incorrecto en conversión en `fromMap()`
**Línea:** ~75-80  
**Tipo:** Error de compilación (type error)  
**Problema:** Intentar convertir string inválido a int usando `toInt()` en precio
```dart
// ❌ INCORRECTO
factory Libro.fromMap(Map<String, dynamic> map) {
  return Libro(
    ...
    precio: (map['precio'] ?? 'vacio').toInt(),  // 'vacio'.toInt() ❌ crash!
```
**Solución:** Convertir correctamente a double usando `parseDouble()`
```dart
// ✓ CORRECTO
factory Libro.fromMap(Map<String, dynamic> map) {
  return Libro(
    ...
    precio: (map['precio'] as num?)?.toDouble() ?? 0.0,
```

---

### Error 2: Tipo incorrecto en `_obtenerCaja()`
**Línea:** ~115-120  
**Tipo:** Error de compilación (type mismatch)  
**Problema:** Retorna `Box<String>` pero debería ser `Box<Map>`
```dart
// ❌ INCORRECTO
static Future<Box<String>> _obtenerCaja() async {
  if (!Hive.isBoxOpen(_nombreCaja)) {
    await Hive.openBox<Map>(_nombreCaja);  // Abre como Map pero retorna String!
  }
  return Hive.box<String>(_nombreCaja);
}
```
**Solución:** Hacer que el tipo sea consistente
```dart
// ✓ CORRECTO
static Future<Box<Map>> _obtenerCaja() async {
  if (!Hive.isBoxOpen(_nombreCaja)) {
    await Hive.openBox<Map>(_nombreCaja);
  }
  return Hive.box<Map>(_nombreCaja);
}
```

---

### Error 3: Falta `await` en `agregarLibro()`
**Línea:** ~130  
**Tipo:** Error de compilación (missing await)  
**Problema:** Llamada asíncrona sin `await`
```dart
// ❌ INCORRECTO
static Future<void> agregarLibro(Libro libro) async {
  final caja = await _obtenerCaja();
  caja.put(libro.id, libro.toMap());  // put() es Future, falta await
  print('✓ Libro agregado: ${libro.titulo}');
}
```
**Solución:** Agregar `await`
```dart
// ✓ CORRECTO
static Future<void> agregarLibro(Libro libro) async {
  final caja = await _obtenerCaja();
  await caja.put(libro.id, libro.toMap());
  print('✓ Libro agregado: ${libro.titulo}');
}
```

---

### Error 4: Tipo incorrecto en `fold()` de `obtenerTotalPaginas()`
**Línea:** ~210  
**Tipo:** Error de lógica/compilación  
**Problema:** El primer argumento de fold es String pero debería ser int
```dart
// ❌ INCORRECTO
static Future<int> obtenerTotalPaginas() async {
  final todos = await obtenerTodosLibros();
  return todos.fold<String>('0', (suma, libro) => (int.parse(suma) + libro.paginas).toString()).length;
  // ^ Retorna String.length (int) pero la lógica es confusa
}
```
**Solución:** Usar fold con tipo int directamente
```dart
// ✓ CORRECTO
static Future<int> obtenerTotalPaginas() async {
  final todos = await obtenerTodosLibros();
  return todos.fold<int>(0, (suma, libro) => suma + libro.paginas);
}
```

---

### Error 5: Inverted null check en `marcarComoLeido()`
**Línea:** ~190-200  
**Tipo:** Error de lógica  
**Problema:** La lógica del null check está invertida; hará lo opuesto a lo esperado
```dart
// ❌ INCORRECTO
static Future<void> marcarComoLeido(String id, bool leido) async {
  final libro = await obtenerLibro(id);
  if (libro == null) {  // Si NO existe...
    final libroActualizado = Libro(
      id: libro!.id,  // ...usa libro! ¿Pero es null!
      ...
    );
    await actualizarLibro(libroActualizado);
  }
}
```
**Solución:** Invertir la lógica
```dart
// ✓ CORRECTO
static Future<void> marcarComoLeido(String id, bool leido) async {
  final libro = await obtenerLibro(id);
  if (libro != null) {  // Si SÍ existe...
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
```

---

## 📁 3. `archivos_ejemplo.dart`

### Error 1: Tipo incorrecto en `fromJson()` - id
**Línea:** ~75-80  
**Tipo:** Error de compilación (type mismatch)  
**Problema:** Casting de id a int pero el campo es String
```dart
// ❌ INCORRECTO
factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
  id: json['id'] as String,  // Pero Tarea.id es int!
```
**Solución:** Usar el tipo correcto (String si el campo es String, o conversión si es int)
```dart
// ✓ CORRECTO
factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
  id: json['id'] as int,  // O convertir si es string: int.parse(json['id'])
```

---

### Error 2: Falta `await` en `guardarTareaJSON()`
**Línea:** ~115  
**Tipo:** Error de compilación (missing await)  
**Problema:** `writeAsString()` es Future pero no se espera
```dart
// ❌ INCORRECTO
static Future<void> guardarTareaJSON(Tarea tarea) async {
  try {
    final dir = await _directorio;
    final archivo = File('${dir.path}/tarea_actual.json');
    final json = jsonEncode(tarea.toJson());
    archivo.writeAsString(json);  // ¡Falta await!
```
**Solución:** Agregar `await`
```dart
// ✓ CORRECTO
await archivo.writeAsString(json);
```

---

### Error 3: Lógica invertida en `leerTareaJSON()`
**Línea:** ~135-140  
**Tipo:** Error de lógica  
**Problema:** Retorna null cuando el archivo SÍ existe
```dart
// ❌ INCORRECTO
static Future<Tarea> leerTareaJSON() async {
  try {
    final dir = await _directorio;
    final archivo = File('${dir.path}/tarea_actual.json');

    if (await archivo.exists()) {  // Si existe...
      return null;  // ...retorna null? Ilógico!
```
**Solución:** Invertir la lógica
```dart
// ✓ CORRECTO
if (!await archivo.exists()) {  // Si NO existe...
  return null;  // Entonces retorna null
}
```

---

### Error 4: Cast incorrecto en `leerTareasJSON()`
**Línea:** ~150-155  
**Tipo:** Error de compilación (type mismatch)  
**Problema:** Decodificar lista como String
```dart
// ❌ INCORRECTO
final contenido = await archivo.readAsString();
final jsonList = jsonDecode(contenido) as String;  // Debería ser List!
return jsonList.map((json) => Tarea.fromJson(json)).toList();
```
**Solución:** Usar el tipo correcto
```dart
// ✓ CORRECTO
final contenido = await archivo.readAsString();
final jsonList = jsonDecode(contenido) as List;
return jsonList.map((json) => Tarea.fromJson(json as Map<String, dynamic>)).toList();
```

---

### Error 5: Loop que procesa el encabezado como datos
**Línea:** ~200-210  
**Tipo:** Error de lógica  
**Problema:** El loop comienza en 0 cuando debería comenzar en 1
```dart
// ❌ INCORRECTO
final tareas = <Tarea>[];
// Omitir encabezado (índice 0)
for (int i = 0; i < lineas.length; i++) {  // Comienza en 0!
  if (lineas[i].isEmpty) continue;
  // Procesa el encabezado como si fuera una tarea
```
**Solución:** Comenzar desde índice 1
```dart
// ✓ CORRECTO
final tareas = <Tarea>[];
// Omitir encabezado (índice 0)
for (int i = 1; i < lineas.length; i++) {  // Comienza en 1
  if (lineas[i].isEmpty) continue;
```

---

### Error 6: Parámetro faltante en `_parseCSVLine()`
**Línea:** ~265-270  
**Tipo:** Error de compilación (missing parameter)  
**Problema:** Método definido sin el parámetro `line` que luego usa
```dart
// ❌ INCORRECTO
static List<String> _parseCSVLine() {  // Falta el parámetro 'line'
  final campos = <String>[];
  final buffer = StringBuffer();
  bool entreComillas = false;

  for (int i = 0; i < line.length; i++) {  // ¡Usa 'line' pero no está definido!
    final char = line[i];
```
**Solución:** Agregar el parámetro
```dart
// ✓ CORRECTO
static List<String> _parseCSVLine(String line) {  // Agregar parámetro 'line'
  final campos = <String>[];
  final buffer = StringBuffer();
  bool entreComillas = false;

  for (int i = 0; i < line.length; i++) {
    final char = line[i];
```

---

## 🗄️ 4. `sqlite_ejemplo.dart`

### Error 1: Conversión incorrecta en `fromMap()`
**Línea:** ~120
**Tipo:** Error de compilación (type error)
**Problema:** Usar `.toInt()` en lugar de `.toDouble()` para nota
```dart
// ❌ INCORRECTO
factory Calificacion.fromMap(Map<String, dynamic> map) {
  return Calificacion(
    ...
    nota: (map['nota'] ?? 0).toInt() as double,  // ¡toInt() luego cast a double!
```
**Solución:** Usar el tipo correcto
```dart
// ✓ CORRECTO
nota: (map['nota'] ?? 0.0).toDouble(),
```

---

### Error 2: Falta `await` en `agregarCalificacion()`
**Línea:** ~245
**Tipo:** Error de compilación (missing await)
**Problema:** `db.insert()` es Future pero no se espera
```dart
// ❌ INCORRECTO
static Future<int> agregarCalificacion(Calificacion calificacion) async {
  final db = await obtenerBD();
  int id = db.insert('calificaciones', calificacion.toMap());  // ¡Falta await!
```
**Solución:** Agregar `await`
```dart
// ✓ CORRECTO
int id = await db.insert('calificaciones', calificacion.toMap());
```

---

### Error 3: Tipo incorrecto en `obtenerCalificacionesEstudiante()`
**Línea:** ~250-260
**Tipo:** Error de compilación (type mismatch)
**Problema:** Retorna `List<Map>` pero debería retornar `List<Calificacion>`
```dart
// ❌ INCORRECTO
static Future<List<Map>> obtenerCalificacionesEstudiante(...) async {
  ...
  return result.map((map) => map as Map).toList();  // Solo convierte a Map
}
```
**Solución:** Cambiar tipo de retorno
```dart
// ✓ CORRECTO
static Future<List<Calificacion>> obtenerCalificacionesEstudiante(...) async {
  ...
  return result.map((map) => Calificacion.fromMap(map)).toList();
}
```

---

### Error 4: Lógica invertida en `obtenerPromedio()`
**Línea:** ~305
**Tipo:** Error de lógica
**Problema:** Retorna 0 cuando el resultado SÍ está vacío (lógica invertida)
```dart
// ❌ INCORRECTO
if (result.isNotEmpty) return 0.0;  // Si hay datos, retorna 0
return (result.first['promedio'] as num?)?.toDouble() ?? 0.0;
```
**Solución:** Invertir la condición
```dart
// ✓ CORRECTO
if (result.isEmpty) return 0.0;  // Si NO hay datos, retorna 0
```

---

### Error 5: Tipo incorrecto en `obtenerEstudiantesConPromedioAlto()`
**Línea:** ~315
**Tipo:** Error de compilación (type mismatch)
**Problema:** Parámetro es String en lugar de double
```dart
// ❌ INCORRECTO
static Future<List<Map>> obtenerEstudiantesConPromedioAlto(
  String minimo,  // Debería ser double, no String
) async {
```
**Solución:** Usar el tipo correcto
```dart
// ✓ CORRECTO
static Future<List<Map>> obtenerEstudiantesConPromedioAlto(
  double minimo,  // double es el tipo correcto
) async {
```

---

### Error 6: `onPressed` duplicado en botón
**Línea:** ~510-515
**Tipo:** Error de lógica/compilación
**Problema:** El botón tiene dos parámetros `onPressed`
```dart
// ❌ INCORRECTO
ElevatedButton.icon(
  onPressed: () async {
    // lógica aquí
  },
  onPressed: () {},  // Duplicado - sobrescribe el anterior
  icon: const Icon(Icons.calculate),
```
**Solución:** Remover el duplicado
```dart
// ✓ CORRECTO
ElevatedButton.icon(
  onPressed: () async {
    // lógica aquí
  },
  icon: const Icon(Icons.calculate),
```

---

## 📋 5. `ejercicio_persistencia.dart`

Este archivo tiene 12 errores intencionales distribuidos entre:
- Errores en el modelo `Producto`
- Errores en los servicios `AlmacenamientoSharedPreferences`, `AlmacenamientoJSON`, `AlmacenamientoCSV`
- Errores en la interfaz de usuario

**Errores comunes incluyen:**
1. Campos con tipos incorrectos
2. Conversiones de tipos mal realizadas
3. Métodos asíncrónos sin `await`
4. Null checks invertidos
5. Parámetros faltantes en factories
6. Métodos con retorno incorrecto

**Estrategia para resolverlo:**
1. Leer todos los errores del compilador (❌)
2. Arregla de arriba a abajo uno por uno
3. Verificar que los tipos coincidan (especialmente en factories)
4. Cuidado con async/await en métodos asíncrónos
5. Probar la aplicación al final

---

## 🎯 Resumen de Patrones de Error

| Patrón | Archivo | Error | Solución |
|--------|---------|-------|----------|
| Type Mismatch | Todos | Cast incorrecto | Verificar tipos con el compilador |
| Missing Await | Todos | Método async sin await | Agregar `await` |
| Null Safety | SharedPrefs | Variable sin default | Usar `??` operator |
| Inverted Logic | Hive, Archivos, SQLite | Condición invertida | Cambiar `==` a `!=` |
| Wrong Method | SharedPrefs | getInt en lugar de getString | Usar método correcto para tipo |
| Missing Parameter | Archivos | Función sin parámetro | Agregar parámetro faltante |
| Duplicated Property | SQLite | onPressed duplicado | Remover duplicado |

---

## 💡 Consejos para Debugging

1. **Lee el error completo del compilador** - Dart te dice exactamente qué está mal
2. **Verifica tipos** - Los errores de tipo son los más comunes
3. **Busca `async/await`** - Si falta `await`, el retorno será `Future` no el dato
4. **Cuidado con null safety** - `!` versus `??` son importantes
5. **Usa QuickFix de VS Code** - Presiona Ctrl+. para sugerencias automáticas

---

## 📌 Archivos de Solución

Los siguientes archivos contienen todas las correcciones:
- `shared_preferences_solucion.dart`
- `hive_solucion.dart`
- `archivos_solucion.dart`
- `sqlite_solucion.dart`

✓ Compáralos con tus soluciones para verificar que todo sea correcto.
