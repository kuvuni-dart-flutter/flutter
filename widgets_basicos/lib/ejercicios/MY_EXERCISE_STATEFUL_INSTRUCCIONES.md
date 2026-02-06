# 📚 MY_EXERCISE_STATEFUL - INSTRUCCIONES 

## 📌 Instrucciones Generales

En este archivo encontrarás **dos ejercicios** sobre gestión de estado en Flutter:

- **EJERCICIO 1 (OBLIGATORIO)**: Carrito de Viajes 🧳
- **EJERCICIO 2 (OPCIONAL)**: TODO List Mejorado ✅

Cada ejercicio tiene tareas marcadas como `TODO()` que debes completar. Solo modifica el código dentro de las funciones indicadas. **No cambies la estructura del widget ni el UI.**

### ⚠️ Regla de Oro
Cada vez que modifiques el estado, **debes usar `setState()`** para que la interfaz se actualice.

---

## 🧳 EJERCICIO 1: CARRITO DE VIAJES (OBLIGATORIO)

**Tema**: Gestión de reservas de viajes con cálculos dinámicos

### Descripción
Implementa un carrito donde usuarios reserven destinos internacionales. Pueden aumentar/disminuir el número de personas y ver el costo total actualizado en tiempo real.

### 🌍 Datos Iniciales - Cópialo en tu código

```dart
List<Producto> carrito = [
  Producto(id: 1, nombre: 'París, Francia', precio: 1299.99, numeroDePersonas: 1),
  Producto(id: 2, nombre: 'Tokio, Japón', precio: 1599.99, numeroDePersonas: 0),
  Producto(id: 3, nombre: 'Bali, Indonesia', precio: 899.99, numeroDePersonas: 0),
  Producto(id: 4, nombre: 'Nueva York, USA', precio: 1099.99, numeroDePersonas: 0),
  Producto(id: 5, nombre: 'Barcelona, España', precio: 799.99, numeroDePersonas: 0),
  Producto(id: 6, nombre: 'Marrakech, Marruecos', precio: 649.99, numeroDePersonas: 0),
  Producto(id: 7, nombre: 'Singapur', precio: 1399.99, numeroDePersonas: 0),
  Producto(id: 8, nombre: 'Estambul, Turquía', precio: 799.99, numeroDePersonas: 0),
  Producto(id: 9, nombre: 'Roma, Italia', precio: 949.99, numeroDePersonas: 0),
  Producto(id: 10, nombre: 'Tailandia (Bangkok)', precio: 1199.99, numeroDePersonas: 0),
];
```

### 🌍 Destinos Disponibles

| ID | Destino | Precio (€/persona) |
|----|---------|--------------------|
| 1 | París, Francia | 1299.99 |
| 2 | Tokio, Japón | 1599.99 |
| 3 | Bali, Indonesia | 899.99 |
| 4 | Nueva York, USA | 1099.99 |
| 5 | Barcelona, España | 799.99 |
| 6 | Marrakech, Marruecos | 649.99 |
| 7 | Singapur | 1399.99 |
| 8 | Estambul, Turquía | 799.99 |
| 9 | Roma, Italia | 949.99 |
| 10 | Tailandia (Bangkok) | 1199.99 |

### Métodos a implementar

#### TODO 1: `double _calcularTotal()`
**¿Qué debe hacer?**
- Recorrer todos los productos en el carrito
- Multiplicar el precio de cada destino por el número de personas reservadas
- Sumar todos los subtotales
- Retornar el total

**Ejemplo**: 2 personas en París (€1299.99 c/u) + 1 en Barcelona (€799.99) = €3399.97

---

#### TODO 2: `void _incrementarPersonas(int id)`
**¿Qué debe hacer?**
- Recibir el ID del destino como parámetro
- Encontrar el destino en la lista del carrito
- Aumentar el número de personas en 1
- Usar `setState()` para actualizar la interfaz

**Nota**: Esta función se llama cuando el usuario presiona el botón "+" (add_circle).

---

#### TODO 3: `void _decrementarPersonas(int id)`
**¿Qué debe hacer?**
- Recibir el ID del destino como parámetro
- Encontrar el destino en la lista del carrito
- Si el número de personas es mayor a 1, decrementar en 1
- Si el número es menor de 1, mostrar un Snackbar con el mensaje de advertencia (SnackBar(content: Text('⚠️ Mínimo 1 persona')),)
- Usar `setState()` para actualizar la interfaz

**Importante**: El número de personas no puede ser menor a 1.

---

#### TODO 4: `void _removerProducto(int id)`
**¿Qué debe hacer?**
- Recibir el ID del destino como parámetro
- Eliminar el destino de la lista del carrito
- Mostrar un Snackbar confirmando la eliminación
- Usar `setState()` para actualizar la interfaz

**Nota**: Esta función se llama cuando el usuario presiona el botón de eliminar (delete).

---

## ✅ EJERCICIO 2: TODO LIST MEJORADO (OPCIONAL)

**Tema**: Gestión de tareas con filtros y estadísticas

### Descripción
Crea una app de tareas donde usuarios puedan crear tareas, marcarlas como completadas, eliminarlas y filtrarlas por estado.

### Métodos a Implementar

#### TODO 5: `void _agregarTarea()`
**¿Qué debe hacer?**
- Verificar que el campo de texto NO esté vacío
- Crear una nueva tarea con:
  - ID único (usa `_proximoId++`)
  - Texto del campo (`_controlador.text`)
  - Estado: no completada (false)
- Limpiar el campo de texto
- Mostrar Snackbar: "✅ Tarea añadida"
- Usar `setState()` para actualizar la interfaz

---

#### TODO 6: `void _toggleTarea(int id)`
**¿Qué debe hacer?**
- Recibir el ID de la tarea como parámetro
- Encontrar la tarea en la lista
- Cambiar su estado: completada ↔ no completada
- Usar `setState()` para actualizar la interfaz

**Nota**: Esta función se llama cuando el usuario presiona el checkbox.

---

#### TODO 7: `void _eliminarTarea(int id)`
**¿Qué debe hacer?**
- Recibir el ID de la tarea como parámetro
- Eliminar la tarea de la lista
- Usar `setState()` para actualizar la interfaz

**Nota**: Esta función se llama cuando el usuario presiona el botón de eliminar.

---

#### TODO 8: `List<Tarea> _obtenerTareasFiltradas()`
**¿Qué debe hacer?**
Retorna una lista filtrada según `_filtroActual`:
- **0**: Todas las tareas
- **1**: Solo tareas completadas
- **2**: Solo tareas pendientes

**Pista**: Usa `where()` para filtrar

---

## 💡 Consejos Generales

1. **setState() es tu amigo**: Cada vez que modificas el estado, debes envolverlo en `setState()`
2. **Recorre listas correctamente**: Usa bucles `for` o métodos como `where()`, `removeWhere()`
3. **Valida entrada de usuario**: Verifica que los datos sean válidos antes de procesarlos
4. **Prueba tu código**: Ejecuta la app después de cada cambio para asegurar que funciona

---

## 📋 Checklist de Completud

### Ejercicio 1: Carrito de Viajes
- [ ] TODO 1: Función `_calcularTotal()` implementada
- [ ] TODO 2: Función `_incrementarPersonas()` implementada
- [ ] TODO 3: Función `_decrementarPersonas()` implementada
- [ ] TODO 4: Función `_removerProducto()` implementada
- [ ] Prueba: Puedes aumentar/disminuir personas
- [ ] Prueba: El total se calcula correctamente
- [ ] Prueba: Puedes eliminar destinos

### Ejercicio 2: TODO List
- [ ] TODO 5: Función `_agregarTarea()` implementada
- [ ] TODO 6: Función `_toggleTarea()` implementada
- [ ] TODO 7: Función `_eliminarTarea()` implementada
- [ ] TODO 8: Función `_obtenerTareasFiltradas()` implementada
- [ ] Prueba: Puedes agregar tareas
- [ ] Prueba: Puedes marcar tareas como completadas
- [ ] Prueba: Puedes eliminar tareas
- [ ] Prueba: Los filtros funcionan correctamente

---

## 🎯 Objetivos de Aprendizaje

Al completar estos ejercicios, habrás aprendido:

✅ Cómo usar `setState()` para actualizar la UI
✅ Cómo gestionar listas dinámicas de objetos
✅ Cómo realizar búsquedas y filtrados en listas
✅ Cómo validar entrada de usuario
✅ Cómo mostrar feedback visual (Snackbars)
✅ Cómo estructurar código reutilizable en funciones

---

## ❓ ¿Necesitas ayuda?

Si algo no está claro:
1. Lee el comentario en el código del ejercicio
2. Verifica que estés usando `setState()` correctamente
3. Usa `print()` para depurar valores
4. Pregunta al instructor 👨‍🏫

¡Mucho éxito! 🚀
