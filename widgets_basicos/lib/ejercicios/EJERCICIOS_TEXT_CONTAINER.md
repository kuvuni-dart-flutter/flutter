# 🎯 Ejercicios: Text y Container (Nivel Básico y Avanzado)

## Introducción

Este conjunto de ejercicios te enseñará los conceptos fundamentales de Flutter usando solo dos widgets: **Text** y **Container**. Estos son los bloques de construcción más básicos pero poderosos en Flutter.

### Objetivos:
- ✅ Dominar propiedades de Text y Container
- ✅ Combinar widgets de forma efectiva
- ✅ Entender layouts y espaciado
- ✅ Crear interfaces visuales coherentes
- ✅ Aplicar estilos y decoraciones

---

## NIVEL BÁSICO 

### Ejercicio 1: Hola Mundo Simple ⭐

**Objetivo:** Crear tu primer widget Text

**Tarea:**
1. Crea un Text que diga "¡Bienvenido a Flutter!"
2. Aumenta el tamaño a 24
3. Cambia el color a azul
4. Haz el texto en negrita

**Resultado esperado:** Texto grande, azul y en negrita centrado en la pantalla

---

### Ejercicio 2: Container Coloreado ⭐

**Objetivo:** Aprender propiedades básicas de Container

**Tarea:**
1. Crea un Container con ancho de 200 y alto de 100
2. Dale un color de fondo rojo
3. Agrega un Text dentro que diga "Caja Roja"
4. Centra el texto


---

### Ejercicio 3: Múltiples Containers en Fila ⭐

**Objetivo:** Practicar layouts horizontales con Row y Column

**Tarea:**
1. Crea 3 Containers lado a lado (horizontalmente)
2. Cada uno con diferente color (rojo, verde, azul)
3. Cada uno con ancho de 80 y alto de 80
4. Agrega un número (1, 2, 3) en cada uno

**Código esperado:**
```dart
Scaffold(
  body: Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          color: Colors.red,
          child: Center(child: Text('1')),
        ),
        // ... más containers
      ],
    ),
  ),
)
```

**Desafío:** Agrega espaciado de 20 entre cada container

---

### Ejercicio 4: Apilando Containers Verticales ⭐⭐

**Objetivo:** Practicar layouts verticales

**Tarea:**
1. Crea 4 Containers apilados verticalmente
2. Cada uno con altura de 60
3. Colores alternados (gris claro, gris, gris oscuro, negro)
4. Con números del 1 al 4

**Código esperado:**
```dart
Scaffold(
  body: Column(
    children: [
      Container(...),
      Container(...),
      // ... más containers
    ],
  ),
)
```

---

### Ejercicio 5: Padding y Margin ⭐⭐

**Objetivo:** Entender espaciado interno (padding) y externo

**Tarea:**
1. Crea un Container rojo de 200x200
2. Dentro, pon un Container azul
3. Usa `padding` para dejar 20 de espacio interno
4. El Container azul debe decir "Padding 20"

**Desafío:** Usa `EdgeInsets.symmetric(horizontal: 20, vertical: 10)` en su lugar

---

### Ejercicio 6: Decoración con BorderRadius ⭐⭐

**Objetivo:** Usar BoxDecoration para redondear esquinas

**Tarea:**
1. Crea un Container decorado con `BoxDecoration`
2. Color de fondo verde
3. Esquinas redondeadas de 20
4. Ancho 200, alto 100
5. Text adentro: "Esquinas Redondeadas"

---

### Ejercicio 7: Bordes de Colores ⭐⭐

**Objetivo:** Agregar bordes a Containers

**Tarea:**
1. Crea un Container 150x150
2. Con borde azul de ancho 3
3. Esquinas redondeadas de 10
4. Fondo blanco
5. Text: "Borde Azul"

---

### Ejercicio 8: Sombras (Elevation) ⭐⭐

**Objetivo:** Crear profundidad con sombras

**Tarea:**
1. Crea un Container 200x200
2. Con BoxShadow (sombra)
3. Color de fondo naranja
4. Offset de sombra (4, 4)
5. Blur radius de 10

---

### Ejercicio 9: Tarjeta Simple ⭐⭐

**Objetivo:** Crear una tarjeta estilo producto

**Tarea:**
1. Container 180x220
2. Color blanco con borde gris
3. Esquinas redondeadas de 12
4. Sombra suave
5. Texto: "Producto" (arriba), "Precio: $99" (abajo)
6. Usa 2 Texts apilados verticalmente

**Código esperado:**
```dart
Container(
  ...
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(...),
      SizedBox(height: 10),
      Text(...)
    ],
  ),
)
```

---

### Ejercicio 10: Gradiente de Fondo ⭐⭐

**Objetivo:** Crear gradientes con Containers

**Tarea:**
1. Container 250x250
2. Con gradiente lineal (azul a púrpura)
3. Esquinas redondeadas
4. Text blanco: "Gradiente"

**Código esperado:**
```dart
Container(
  ...
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  ...
)
```

---

### Ejercicio 11: Alineación de Texto ⭐⭐

**Objetivo:** Practicar alineación en Text

**Tarea:**
1. Container 300x200
2. Color gris claro
3. Dentro, 3 Texts:
   - Primero alineado a la izquierda
   - Segundo centrado
   - Tercero alineado a la derecha
4. Padding de 20

---

### Ejercicio 12: Overflow y TextOverflow ⭐⭐

**Objetivo:** Manejar texto que no cabe

**Tarea:**
1. Container 150x100
2. Color blanco con borde
3. Dentro, un Text con texto largo
4. Usa `overflow: TextOverflow.ellipsis`

---

### Ejercicio 13: Estilos de Texto ⭐⭐

**Objetivo:** Practicar diferentes estilos de Text

**Tarea:**
1. Crea 4 Texts en una Column:
   - Negrita y grande (bold, size 20)
   - Cursiva (italic)
   - Color rojo y subrayado
   - Tachado (decoration: TextDecoration.lineThrough)

---

### Ejercicio 14: Banner/Etiqueta ⭐⭐

**Objetivo:** Crear etiquetas visuales

**Tarea:**
1. Crea una etiqueta estilo "NUEVO"
2. Container pequeño (100x40)
3. Color rojo
4. Esquinas redondeadas
5. Text blanco, negrita, centrado

---

### Ejercicio 15: Lista de Items Simples ⭐⭐

**Objetivo:** Crear una lista básica de items

**Tarea:**
1. Crea 5 Containers en una Column
2. Cada uno con:
   - Altura 50
   - Color alternado (gris claro/blanco)
   - Borde inferior gris
   - Text: "Item 1", "Item 2", etc.
   - Padding 10

**Código esperado:**
```dart
Column(
  children: List.generate(5, (index) {
    return Container(
      ...
    );
  }),
)
```

---

## NIVEL AVANZADO 

### Ejercicio 16: Grid de Colores ⭐⭐⭐

**Objetivo:** Crear un grid 3x3 con Containers

**Tarea:**
1. Crea una grid 3x3 de Containers
2. Cada uno 100x100
3. Colores diferentes (usando Colors.primaries)
4. Números del 1 al 9
5. Usa nested Columns y Rows

**Solución sugerida:**
```dart
Column(
  children: List.generate(3, (row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (col) {
        int index = row * 3 + col + 1;
        List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple, Colors.orange, Colors.pink, Colors.teal, Colors.amber];
        return Container(
          width: 100,
          height: 100,
          color: colors[index - 1],
          margin: EdgeInsets.all(5),
          child: Center(child: Text('$index')),
        );
      }),
    );
  }),
)
```

---

### Ejercicio 17: Tablero de Ajedrez ⭐⭐⭐

**Objetivo:** Crear un patrón de ajedrez

**Tarea:**
1. Crea un tablero 8x8
2. Colores alternados (blanco y negro)
3. Cada celda 30x30
4. Sin números ni texto

**Solución sugerida:**
```dart
Column(
  children: List.generate(8, (row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(8, (col) {
        bool isBlack = (row + col) % 2 == 0;
        return Container(
          width: 30,
          height: 30,
          color: isBlack ? Colors.black : Colors.white,
          border: Border.all(color: Colors.grey),
        );
      }),
    );
  }),
)
```

