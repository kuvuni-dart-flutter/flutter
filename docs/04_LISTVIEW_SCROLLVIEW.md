# ListView en Flutter - Guía Completa

## ¿Qué es un ListView?

Un **ListView** es un widget de Flutter que permite mostrar una lista de elementos desplazables (scrollable). Es ideal cuando tienes una cantidad de elementos que no caben completamente en la pantalla y necesitas que el usuario pueda desplazarse para ver todos ellos.

### Características principales:
- ✅ Desplazamiento automático (scroll vertical u horizontal)
- ✅ Rendimiento optimizado (solo renderiza los elementos visibles)
- ✅ Flexible y personalizable
- ✅ Soporta diferentes tipos de layouts

---

## Tipos de ListView

### 1. **ListView Constructor Simple**
```dart
ListView(
  children: [
    ListTile(title: Text('Elemento 1')),
    ListTile(title: Text('Elemento 2')),
    ListTile(title: Text('Elemento 3')),
  ],
)
```

### 2. **ListView.builder()**
Más eficiente para listas largas. Solo construye los elementos que son visibles:
```dart
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Elemento $index'),
    );
  },
)
```

### 3. **ListView.separated()**
Permite agregar divisores entre elementos:
```dart
ListView.separated(
  itemCount: 50,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
  separatorBuilder: (context, index) {
    return Divider(); // Widget divisor entre items
  },
)
```

---

## Propiedades Principales de ListView

### **Propiedades de Desplazamiento**

| Propiedad | Tipo | Descripción | Ejemplo |
|-----------|------|-------------|---------|
| `scrollDirection` | Axis | Dirección del scroll (vertical/horizontal) | `scrollDirection: Axis.horizontal` |
| `reverse` | bool | Invierte el orden de los elementos | `reverse: true` |
| `physics` | ScrollPhysics | Comportamiento del scroll | `physics: BouncingScrollPhysics()` |
| `controller` | ScrollController | Controla el desplazamiento programáticamente | `controller: _scrollController` |

### **Propiedades de Espaciado**

| Propiedad | Tipo | Descripción | Ejemplo |
|-----------|------|-------------|---------|
| `padding` | EdgeInsets | Espacio alrededor de la lista | `padding: EdgeInsets.all(16)` |
| `itemExtent` | double | Altura/ancho de cada elemento (mejora rendimiento) | `itemExtent: 100` |
| `shrinkWrap` | bool | Si es true, el ListView ocupa solo el espacio de sus hijos | `shrinkWrap: true` |

### **Propiedades de Contenido**

| Propiedad | Tipo | Descripción | Ejemplo |
|-----------|------|-------------|---------|
| `children` | List<Widget> | Lista de widgets a mostrar | `children: [Text('1'), Text('2')]` |
| `itemCount` | int | Cantidad de elementos (en builder) | `itemCount: 100` |
| `itemBuilder` | Function | Función que construye cada elemento (en builder) | `itemBuilder: (context, index) => ...` |

### **Propiedades de Comportamiento**

| Propiedad | Tipo | Descripción | Ejemplo |
|-----------|------|-------------|---------|
| `primary` | bool | Si es true, respeta SafeArea en iOS | `primary: true` |
| `addAutomaticKeepAlives` | bool | Mantiene vivos los elementos fuera de pantalla | `addAutomaticKeepAlives: true` |
| `clipBehavior` | Clip | Recorte del contenido | `clipBehavior: Clip.antiAlias` |

---

## Ejemplo Completo

```dart
import 'package:flutter/material.dart';

class MiListaEjemplo extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Elemento ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Lista')),
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(items[index]),
            subtitle: Text('Descripción del elemento ${index + 1}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Seleccionaste ${items[index]}')),
              );
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
```

---

## ScrollPhysics - Comportamientos del Scroll

El comportamiento del scroll se controla con la propiedad `physics`:

```dart
// Comportamiento por defecto (plataforma específica)
ListView()

// Scroll suave y fluido
ListView(physics: BouncingScrollPhysics()) // iOS-like

// Scroll con resistencia
ListView(physics: ClampingScrollPhysics()) // Android-like

// Desactiva el scroll
ListView(physics: NeverScrollableScrollPhysics())

// Scroll siempre scrolleable (incluso si cabe todo)
ListView(physics: AlwaysScrollableScrollPhysics())
```

---

## ScrollController - Control Programático

```dart
class MiListaConControl extends StatefulWidget {
  @override
  _MiListaConControlState createState() => _MiListaConControlState();
}

class _MiListaConControlState extends State<MiListaConControl> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _irAlFinal() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scroll Controlado')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _irAlFinal,
        child: Icon(Icons.arrow_downward),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
```

---

## Cuándo usar ListView

### ✅ Usa ListView cuando:
- Tienes una lista de elementos que puede ser muy larga
- Necesitas desplazamiento automático
- Los elementos tienen altura variable
- Necesitas rendimiento en listas largas

### ❌ Evita ListView cuando:
- Solo necesitas mostrar unos pocos elementos en una fila/columna → usa **Row/Column**
- Necesitas un grid → usa **GridView**
- La lista nunca excede el tamaño de pantalla y es fija → usa **Column con scroll manual**

---

## Diferencias: ListView vs GridView

| Aspecto | ListView | GridView |
|--------|----------|----------|
| Layout | Lista lineal (1 columna o fila) | Cuadrícula (múltiples columnas) |
| Uso | Listas de elementos | Galerías, catálogos |
| Rendimiento | Excelente | Excelente |
| Ejemplo | Lista de mensajes | Galería de fotos |

---

## Consejos de Rendimiento

1. **Usa `ListView.builder()`** en lugar del constructor simple para listas largas
2. **Define `itemExtent`** si todos los elementos tienen la misma altura
3. **Usa `addAutomaticKeepAlives: false`** si no necesitas mantener estado en elementos fuera de pantalla
4. **Evita Widgets costosos** (como images sin caché) dentro de itemBuilder
5. **Usar `const` constructores** siempre que sea posible

---

## ❌ Antipatrones Comunes

### Antipatrón 1: Usar ListView simple con muchos items
```dart
// ❌ MALO - Renderiza TODO de una vez
ListView(
  children: List.generate(1000, (i) => ListTile(title: Text('Item $i'))),
)

// ✅ BIEN - Solo renderiza visible
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
)
```

### Antipatrón 2: Memory leak con ScrollController
```dart
// ❌ MALO - No limpia controller
@override
void dispose() {
  super.dispose(); // ¡Falta _controller.dispose()!
}

// ✅ BIEN
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

### Antipatrón 3: ListView sin Expanded en Column
```dart
// ❌ MALO - Error de layout
Column(children: [Text('Título'), ListView(children: [...])])

// ✅ BIEN
Column(children: [Text('Título'), Expanded(child: ListView(children: [...]))])
```

---

## 🛠️ Problemas Comunes

### Problema: "RenderBox was not laid out"
**Causa:** ListView en Column sin espacio  
**Solución:** Usar `Expanded` o `SizedBox` con altura

### Problema: App lenta con 1000+ items
**Causa:** Renderizar todo de una vez  
**Solución:** Usar `ListView.builder()` y `itemExtent`

---

## 📱 Caso Avanzado: Infinite Scroll

```dart
class InfiniteList extends StatefulWidget {
  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  late ScrollController _controller;
  List<String> items = List.generate(20, (i) => 'Item $i');
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels == 
          _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  Future<void> _loadMore() async {
    if (isLoading) return;
    setState(() => isLoading = true);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      items.addAll(List.generate(20, (i) => 'Item ${items.length + i}'));
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: items.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) => index == items.length
          ? CircularProgressIndicator()
          : ListTile(title: Text(items[index])),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

---

## 📚 Conceptos Relacionados

- [06 Scaffold](06_SCAFFOLD_LAYOUTS.md)
- [09 Responsive](09_RESPONSIVE_DESIGN.md)
- [EJERCICIOS_04](EJERCICIOS_04_LISTVIEW_GRIDVIEW.md)

## Resumen

El **ListView** es uno de los widgets más utilizados en Flutter. Dominar sus propiedades y comportamientos es fundamental para crear interfaces fluidas y con buen rendimiento. Recuerda siempre elegir la variante correcta (simple, builder o separated) según tus necesidades específicas.
