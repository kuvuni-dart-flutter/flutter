# Scaffold en Flutter - Guía Completa

## 📚 Tabla de Contenidos
1. [Introducción](#introducción)
2. [¿Qué es Scaffold?](#qué-es-scaffold)
3. [Estructura Básica](#estructura-básica)
4. [AppBar](#appbar)
5. [Body](#body)
6. [Drawer](#drawer)
7. [FloatingActionButton](#floatingactionbutton)
8. [BottomNavigationBar](#bottomnavigationbar)
9. [BottomAppBar](#bottomappbar)
10. [TabBar](#tabbar)
11. [SnackBar](#snackbar)
12. [BottomSheet](#bottomsheet)
13. [Ejemplo Completo](#ejemplo-completo)
14. [Mejores Prácticas](#mejores-prácticas)

---

## Introducción

**Scaffold** es el widget más importante para construir layouts Material Design en Flutter. Proporciona una estructura visual completa con:
- AppBar (barra superior)
- Body (contenido principal)
- Drawer (menú lateral)
- FloatingActionButton (botón flotante)
- BottomNavigationBar (barra de navegación inferior)
- SnackBar (notificaciones)
- BottomSheet (hojas inferiores)

### Jerarquía típica

```
MaterialApp
  └── Scaffold
        ├── AppBar
        ├── Body
        ├── Drawer
        ├── FloatingActionButton
        └── BottomNavigationBar
```

---

## ¿Qué es Scaffold?

Scaffold es un widget que implementa la estructura visual Material Design básica. Es como el "lienzo" donde se pintan otros widgets.

### Propiedades principales

```dart
Scaffold(
  appBar: AppBar?,              // Barra superior
  body: Widget,                 // Contenido principal
  drawer: Widget?,              // Menú lateral izquierdo
  endDrawer: Widget?,           // Menú lateral derecho
  floatingActionButton: Widget?, // Botón flotante
  floatingActionButtonLocation: FloatingActionButtonLocation?,
  persistentFooterButtons: List<Widget>?,
  bottomNavigationBar: Widget?,
  bottomSheet: Widget?,
  backgroundColor: Color?,
  resizeToAvoidBottomInset: bool,
  primary: bool,
  extendBody: bool,
  extendBodyBehindAppBar: bool,
  drawerDragStartBehavior: DragStartBehavior,
  drawerScrimColor: Color?,
  drawerEdgeDragWidth: double?,
  drawerEnableOpenDragGesture: bool,
  endDrawerEnableOpenDragGesture: bool,
  onDrawerChanged: VoidCallback?,
  onEndDrawerChanged: VoidCallback?,
)
```

---

## Estructura Básica

### Scaffold Mínimo

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: const Center(
        child: Text('Contenido principal'),
      ),
    );
  }
}
```

### Con todos los elementos

```dart
class CompleteScaffoldScreen extends StatefulWidget {
  @override
  State<CompleteScaffoldScreen> createState() => _CompleteScaffoldScreenState();
}

class _CompleteScaffoldScreenState extends State<CompleteScaffoldScreen> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('Mi Aplicación'),
        elevation: 0,
      ),

      // Contenido principal
      body: Center(
        child: Text('Contador: $_counter'),
      ),

      // Menú lateral
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menú'),
            ),
            ListTile(title: Text('Opción 1')),
            ListTile(title: Text('Opción 2')),
          ],
        ),
      ),

      // Botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),

      // Posición del botón flotante
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
```

---

## AppBar

### AppBar Básico

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Mi Título'),
  ),
  body: const SizedBox(),
)
```

### AppBar Completo

```dart
class CompleteAppBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título
        title: const Text('AppBar Completo'),
        
        // Subtítulo
        subtitle: const Text('Descripción'),

        // Centrar título
        centerTitle: true,

        // Color de fondo
        backgroundColor: Colors.blue,

        // Elevación
        elevation: 10,

        // Sombra
        shadowColor: Colors.black54,

        // Icono a la izquierda
        leading: Icon(Icons.menu),

        // Iconos a la derecha
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],

        // Espaciado de leading
        leadingWidth: 80,

        // Color del texto
        foregroundColor: Colors.white,

        // Widget personalizado en el título
        title: Row(
          children: [
            Icon(Icons.info),
            SizedBox(width: 8),
            Text('Información'),
          ],
        ),

        // Botones flexibles
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        // Altura personalizada
        toolbarHeight: 80,

        // Estilo del sistema (status bar)
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: const SizedBox(),
    );
  }
}
```

### AppBar con Búsqueda

```dart
class SearchAppBarScreen extends StatefulWidget {
  @override
  State<SearchAppBarScreen> createState() => _SearchAppBarScreenState();
}

class _SearchAppBarScreenState extends State<SearchAppBarScreen> {
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _isSearching
          ? AppBar(
              title: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Buscar...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _isSearching = false;
                    _searchQuery = '';
                  });
                },
              ),
              actions: [
                if (_searchQuery.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() => _searchQuery = '');
                    },
                  ),
              ],
            )
          : AppBar(
              title: const Text('Búsqueda'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => setState(() => _isSearching = true),
                ),
              ],
            ),
      body: Center(
        child: Text(_searchQuery.isEmpty
            ? 'Ingresa un término de búsqueda'
            : 'Resultados para: $_searchQuery'),
      ),
    );
  }
}
```

### AppBar con Gradient

```dart
Scaffold(
  appBar: AppBar(
    title: const Text('Gradient AppBar'),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple, Colors.pink],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ),
  ),
  body: const SizedBox(),
)
```

---

## Body

### Body simple

```dart
Scaffold(
  appBar: AppBar(title: const Text('Body')),
  body: const Center(
    child: Text('Contenido principal'),
  ),
)
```

### Body con ListView

```dart
Scaffold(
  appBar: AppBar(title: const Text('Lista')),
  body: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Elemento $index'),
        subtitle: Text('Descripción $index'),
        leading: CircleAvatar(child: Text('$index')),
      );
    },
  ),
)
```

### Body con GridView

```dart
Scaffold(
  appBar: AppBar(title: const Text('Grid')),
  body: GridView.count(
    crossAxisCount: 2,
    children: List.generate(
      20,
      (index) => Card(
        margin: EdgeInsets.all(8),
        child: Center(
          child: Text('Elemento $index'),
        ),
      ),
    ),
  ),
)
```

### Body con CustomScrollView

```dart
Scaffold(
  appBar: AppBar(title: const Text('Custom Scroll')),
  body: CustomScrollView(
    slivers: [
      SliverAppBar(
        title: const Text('SliverAppBar'),
        expandedHeight: 200,
        pinned: true,
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            title: Text('Elemento $index'),
          ),
          childCount: 20,
        ),
      ),
    ],
  ),
)
```

### Body con Padding y SafeArea

```dart
Scaffold(
  appBar: AppBar(title: const Text('Body')),
  body: SafeArea(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Contenido seguro'),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('Botón'),
          ),
        ],
      ),
    ),
  ),
)
```

---

## Drawer

### Drawer Básico

```dart
class DrawerBasicScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: const Text('Menú'),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () => Navigator.pop(context),
            ),
            Divider(),
            ListTile(
              title: const Text('Salir'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Contenido')),
    );
  }
}
```

### Drawer Completo

```dart
class CompleteDrawerScreen extends StatefulWidget {
  @override
  State<CompleteDrawerScreen> createState() => _CompleteDrawerScreenState();
}

class _CompleteDrawerScreenState extends State<CompleteDrawerScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drawer Completo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header personalizado
            UserAccountsDrawerHeader(
              accountName: const Text('Juan Pérez'),
              accountEmail: const Text('juan@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: const Text('JP'),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),

            // Opción 1
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Inicio'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),

            // Opción 2
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Configuración'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),

            // Opción 3
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('Acerca de'),
              selected: _selectedIndex == 2,
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),

            Divider(),

            // Logout
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                // Lógica de logout
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Sección ${_selectedIndex + 1}'),
      ),
    );
  }
}
```

### Drawer con Navegación

```dart
class DrawerNavigationScreen extends StatefulWidget {
  @override
  State<DrawerNavigationScreen> createState() =>
      _DrawerNavigationScreenState();
}

class _DrawerNavigationScreenState extends State<DrawerNavigationScreen> {
  String _currentSection = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitleForSection(_currentSection)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: const Text('Navegación'),
            ),
            ..._buildDrawerItems(),
          ],
        ),
      ),
      body: _getBodyForSection(_currentSection),
    );
  }

  List<Widget> _buildDrawerItems() {
    final items = [
      ('home', Icons.home, 'Inicio'),
      ('profile', Icons.person, 'Perfil'),
      ('settings', Icons.settings, 'Configuración'),
      ('help', Icons.help, 'Ayuda'),
    ];

    return items.map((item) {
      final section = item.$1;
      final icon = item.$2;
      final label = item.$3;

      return ListTile(
        leading: Icon(icon),
        title: Text(label),
        selected: _currentSection == section,
        onTap: () {
          setState(() => _currentSection = section);
          Navigator.pop(context);
        },
      );
    }).toList();
  }

  String _getTitleForSection(String section) {
    switch (section) {
      case 'home':
        return 'Inicio';
      case 'profile':
        return 'Mi Perfil';
      case 'settings':
        return 'Configuración';
      case 'help':
        return 'Ayuda';
      default:
        return 'App';
    }
  }

  Widget _getBodyForSection(String section) {
    switch (section) {
      case 'home':
        return const Center(child: Text('Contenido: Inicio'));
      case 'profile':
        return const Center(child: Text('Contenido: Perfil'));
      case 'settings':
        return const Center(child: Text('Contenido: Configuración'));
      case 'help':
        return const Center(child: Text('Contenido: Ayuda'));
      default:
        return const SizedBox();
    }
  }
}
```

### Drawer Derecho (endDrawer)

```dart
Scaffold(
  appBar: AppBar(title: const Text('Drawer Derecho')),
  endDrawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.orange),
          child: const Text('Menú Derecho'),
        ),
        ListTile(title: const Text('Opción A')),
        ListTile(title: const Text('Opción B')),
      ],
    ),
  ),
  body: const Center(child: Text('Desliza desde la derecha')),
)
```

---

## FloatingActionButton

### FAB Básico

```dart
Scaffold(
  appBar: AppBar(title: const Text('FAB')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  body: const SizedBox(),
)
```

### FAB Completo

```dart
Scaffold(
  appBar: AppBar(title: const Text('FAB Completo')),
  floatingActionButton: FloatingActionButton(
    // Color personalizado
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,

    // Forma personalizada
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),

    // Tamaño
    // FloatingActionButtonAnimator
    // FloatingActionButtonLocation

    // Tooltip
    tooltip: 'Agregar',

    // Elevación
    elevation: 8,

    // Callback
    onPressed: () {
      print('FAB presionado');
    },

    child: const Icon(Icons.add, size: 28),
  ),
  body: const SizedBox(),
)
```

### FAB Múltiples

```dart
class MultipleFABScreen extends StatefulWidget {
  @override
  State<MultipleFABScreen> createState() => _MultipleFABScreenState();
}

class _MultipleFABScreenState extends State<MultipleFABScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFAB() {
    setState(() => _isExpanded = !_isExpanded);
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FAB Múltiples')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
            ),
            child: FloatingActionButton(
              heroTag: 'fab1',
              mini: true,
              onPressed: () {
                print('Opción 1');
                _toggleFAB();
              },
              child: Icon(Icons.edit),
            ),
          ),
          SizedBox(height: 8),
          ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
            ),
            child: FloatingActionButton(
              heroTag: 'fab2',
              mini: true,
              onPressed: () {
                print('Opción 2');
                _toggleFAB();
              },
              child: Icon(Icons.delete),
            ),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _toggleFAB,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
            ),
          ),
        ],
      ),
      body: const SizedBox(),
    );
  }
}
```

### FAB con Posiciones Personalizadas

```dart
Scaffold(
  appBar: AppBar(title: const Text('FAB Posiciones')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  // Posiciones predefinidas
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  // Otras opciones:
  // FloatingActionButtonLocation.centerDocked
  // FloatingActionButtonLocation.endTop
  // FloatingActionButtonLocation.startTop
  body: const SizedBox(),
)
```

---

## BottomNavigationBar

### BottomNavigationBar Básico

```dart
class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigation')),
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text('Inicio'));
      case 1:
        return const Center(child: Text('Buscar'));
      case 2:
        return const Center(child: Text('Agregar'));
      case 3:
        return const Center(child: Text('Perfil'));
      default:
        return const SizedBox();
    }
  }
}
```

### BottomNavigationBar Completo

```dart
Scaffold(
  appBar: AppBar(title: const Text('Bottom Nav Completo')),
  body: const SizedBox(),
  bottomNavigationBar: BottomNavigationBar(
    // Índice actual
    currentIndex: 0,

    // Callback cuando cambia
    onTap: (index) {},

    // Tipo de navegación
    type: BottomNavigationBarType.fixed, // o shifting

    // Color de fondo
    backgroundColor: Colors.white,

    // Color del icono no seleccionado
    unselectedItemColor: Colors.grey,

    // Color del icono seleccionado
    selectedItemColor: Colors.blue,

    // Items
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
        // Icono activo diferente
        activeIcon: Icon(Icons.home, color: Colors.blue),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],

    // Tamaño de letra
    selectedLabelStyle: TextStyle(fontSize: 14),
    unselectedLabelStyle: TextStyle(fontSize: 12),

    // Mostrar etiquetas
    showSelectedLabels: true,
    showUnselectedLabels: false,

    // Elevación
    elevation: 8,
  ),
)
```

### BottomNavigationBar con Navegación

```dart
class BottomNavNavigationScreen extends StatefulWidget {
  @override
  State<BottomNavNavigationScreen> createState() =>
      _BottomNavNavigationScreenState();
}

class _BottomNavNavigationScreenState extends State<BottomNavNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi Pantalla')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pantalla: Inicio'));
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pantalla: Buscar'));
  }
}

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pantalla: Agregar'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Pantalla: Perfil'));
  }
}
```

---

## BottomAppBar

### BottomAppBar Básico

```dart
Scaffold(
  appBar: AppBar(title: const Text('BottomAppBar')),
  body: const SizedBox(),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: BottomAppBar(
    shape: CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    ),
  ),
)
```

### BottomAppBar Completo

```dart
BottomAppBar(
  // Color de fondo
  color: Colors.white,

  // Elevación
  elevation: 8,

  // Muesca para el FAB
  shape: CircularNotchedRectangle(),

  // Contenido
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      ),
      SizedBox(width: 48), // Espacio para FAB
      IconButton(
        icon: Icon(Icons.message),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ),
    ],
  ),
)
```

---

## TabBar

### TabBar Básico

```dart
class BasicTabBarScreen extends StatefulWidget {
  @override
  State<BasicTabBarScreen> createState() => _BasicTabBarScreenState();
}

class _BasicTabBarScreenState extends State<BasicTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Básico'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Inicio'),
            Tab(icon: Icon(Icons.search), text: 'Buscar'),
            Tab(icon: Icon(Icons.person), text: 'Perfil'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Tab 1: Inicio')),
          Center(child: Text('Tab 2: Buscar')),
          Center(child: Text('Tab 3: Perfil')),
        ],
      ),
    );
  }
}
```

### DefaultTabController - Explicación Completa

**¿Qué es DefaultTabController?**

`DefaultTabController` es un widget que proporciona un `TabController` de forma automática a todos sus descendientes. Es una forma simplificada de usar tablas sin necesidad de gestionar manualmente el ciclo de vida del controlador.

**Comparativa: TabController vs DefaultTabController**

| Aspecto | TabController | DefaultTabController |
|--------|---------------|----------------------|
| **Control** | Manual, total control | Automático |
| **Ciclo de vida** | Necesita dispose | Se maneja automáticamente |
| **Complejidad** | Mayor | Menor |
| **Listeners** | Sí (customizable) | Limitado |
| **Casos de uso** | Apps complejas | Prototipos, apps simples |
| **Performance** | Optimizado | Bueno |
| **Multicontroller** | Sí, múltiples | Solo uno por árbol |

**¿Cuándo usar cada uno?**

```dart
// ✅ Usar TabController si:
// - Necesitas control total sobre la animación
// - Quieres listeners personalizados
// - Tienes múltiples TabControllers
// - Necesitas programar el cambio de tabs
// - Requieres animación personalizada

// ✅ Usar DefaultTabController si:
// - Es un prototipo rápido
// - Solo necesitas funcionalidad básica
// - No requieres control detallado
// - La app es simple
// - Quieres menos boilerplate
```

**Ejemplo con DefaultTabController**

```dart
class DefaultTabControllerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DefaultTabController'),
          bottom: TabBar(
            // No necesita controller
            tabs: const [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Contenido Tab 1')),
            Center(child: Text('Contenido Tab 2')),
            Center(child: Text('Contenido Tab 3')),
          ],
        ),
      ),
    );
  }
}
```

**Diferencias clave en el código**

```dart
// ❌ Con TabController (más verboso)
class TabControllerVersion extends StatefulWidget {
  @override
  State<TabControllerVersion> createState() => _TabControllerVersionState();
}

class _TabControllerVersionState extends State<TabControllerVersion>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this, // Necesario
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // Obligatorio
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController, // Explícito
          tabs: [Tab(text: 'Tab 1')],
        ),
      ),
      body: TabBarView(
        controller: _tabController, // Explícito
        children: [Center(child: Text('Contenido'))],
      ),
    );
  }
}

// ✅ Con DefaultTabController (más simple)
class DefaultTabControllerVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // Sin controller, se usa automáticamente
            tabs: [Tab(text: 'Tab 1')],
          ),
        ),
        body: TabBarView(
          // Sin controller, se usa automáticamente
          children: [Center(child: Text('Contenido'))],
        ),
      ),
    );
  }
}
```

**Cómo acceder al controlador en DefaultTabController**

```dart
class AccessControllerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Acceder al Controller')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obtener el controlador actual
              ElevatedButton(
                onPressed: () {
                  final tabController = DefaultTabController.of(context);
                  print('Tab actual: ${tabController.index}');
                  
                  // Cambiar a una tab específica
                  tabController.animateTo(1);
                },
                child: Text('Ir a Tab 2'),
              ),
              SizedBox(height: 16),
              
              // Otro botón
              ElevatedButton(
                onPressed: () {
                  final tabController = DefaultTabController.of(context);
                  
                  // Ir a la siguiente tab
                  if (tabController.index < tabController.length - 1) {
                    tabController.animateTo(tabController.index + 1);
                  }
                },
                child: Text('Siguiente'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: TabBar(
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
    );
  }
}
```

**Ventajas de DefaultTabController**

```dart
// 1. Menos código
// 2. Sin necesidad de SingleTickerProviderStateMixin
// 3. Sin dispose
// 4. Ideal para prototipos
// 5. Fácil de entender para principiantes

class SimpleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: const [
            Tab(text: 'Tab A'),
            Tab(text: 'Tab B'),
          ]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('A')),
            Center(child: Text('B')),
          ],
        ),
      ),
    );
  }
}
```

**Desventajas de DefaultTabController**

```dart
// 1. No hay control fino sobre la animación
// 2. No puedes agregar listeners personalizados
// 3. Solo un DefaultTabController por widget
// 4. No ideal para aplicaciones complejas

// Ejemplo de limitación: No puedes hacer esto fácilmente
class Limitation extends StatefulWidget {
  @override
  State<Limitation> createState() => _LimitationState();
}

class _LimitationState extends State<Limitation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // No puedes suscribirse a cambios de tab fácilmente
          // Con TabController harías: _controller.addListener(...)
          bottom: TabBar(tabs: [Tab(text: 'Tab')]),
        ),
        body: TabBarView(
          children: [Center(child: Text('Content'))],
        ),
      ),
    );
  }
}
```

**Recomendación: ¿Cuál usar?**

```
┌─────────────────────────────────────────────────────────┐
│           ¿Qué tipo de aplicación es?                   │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  Pequeña / Prototipo / Aprendizaje                      │
│  ↓                                                       │
│  DefaultTabController ✅                                │
│                                                          │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  Grande / Production / Control fino necesario           │
│  ↓                                                       │
│  TabController ✅                                       │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

**Ejemplo Comparativo Práctico**

```dart
// DefaultTabController - Recomendado para esto
class SimpleNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notas'),
          bottom: TabBar(tabs: const [
            Tab(icon: Icon(Icons.note), text: 'Todas'),
            Tab(icon: Icon(Icons.star), text: 'Favoritas'),
            Tab(icon: Icon(Icons.archive), text: 'Archivadas'),
          ]),
        ),
        body: TabBarView(children: [
          NotesList(),
          FavoritesList(),
          ArchivedList(),
        ]),
      ),
    );
  }
}

// TabController - Recomendado para esto
class ComplexMediaApp extends StatefulWidget {
  @override
  State<ComplexMediaApp> createState() => _ComplexMediaAppState();
}

class _ComplexMediaAppState extends State<ComplexMediaApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    
    // Listener personalizado
    _tabController.addListener(() {
      setState(() {
        _isPlaying = false; // Pausar al cambiar tab
      });
      
      print('Tab cambió a: ${_tabController.index}');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Música'), Tab(text: 'Videos'), Tab(text: 'Podcasts')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MediaPlayer(type: 'music'),
          MediaPlayer(type: 'video'),
          MediaPlayer(type: 'podcast'),
        ],
      ),
    );
  }
}
```



### TabBar Completo

```dart
class CompleteTabBarScreen extends StatefulWidget {
  @override
  State<CompleteTabBarScreen> createState() => _CompleteTabBarScreenState();
}

class _CompleteTabBarScreenState extends State<CompleteTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );

    // Escuchar cambios de tab
    _tabController.addListener(() {
      print('Tab cambiado a: ${_tabController.index}');
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Completo'),
        bottom: TabBar(
          controller: _tabController,

          // Tabs
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Inicio'),
            Tab(icon: Icon(Icons.star), text: 'Favoritos'),
            Tab(icon: Icon(Icons.message), text: 'Mensajes'),
            Tab(icon: Icon(Icons.settings), text: 'Configuración'),
          ],

          // Color indicador
          indicatorColor: Colors.white,

          // Grosor indicador
          indicatorWeight: 4,

          // Padding indicador
          indicatorPadding: EdgeInsets.symmetric(horizontal: 16),

          // Color de fondo
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,

          // Tamaño de letra
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 12),

          // Espacio entre tabs
          isScrollable: true, // Para muchas tabs
          tabAlignment: TabAlignment.start,

          // Animación
          indicatorSize: TabBarIndicatorSize.label, // o tab

          // Comportamiento de scroll
          dragStartBehavior: DragStartBehavior.start,

          // Divider debajo
          dividerColor: Colors.transparent,
          dividerHeight: 0,

          // Onchange callback
          onTap: (index) {
            print('Tab seleccionado: $index');
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent('Inicio'),
          _buildTabContent('Favoritos'),
          _buildTabContent('Mensajes'),
          _buildTabContent('Configuración'),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print('Botón en $title presionado');
            },
            child: Text('Acción en $title'),
          ),
        ],
      ),
    );
  }
}
```

### TabBar con Contenido Dinámico

```dart
class DynamicTabBarScreen extends StatefulWidget {
  @override
  State<DynamicTabBarScreen> createState() => _DynamicTabBarScreenState();
}

class _DynamicTabBarScreenState extends State<DynamicTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Tab 1', 'Tab 2', 'Tab 3'];
  final List<IconData> _icons = [Icons.home, Icons.star, Icons.settings];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addTab() {
    setState(() {
      _tabs.add('Tab ${_tabs.length + 1}');
      _icons.add(Icons.more_horiz);
    });
    _tabController.dispose();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Dinámico'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: List.generate(
            _tabs.length,
            (index) => Tab(
              icon: Icon(_icons[index]),
              text: _tabs[index],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          _tabs.length,
          (index) => Center(
            child: Text('Contenido de ${_tabs[index]}'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTab,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### TabBar con Múltiples Listados

```dart
class MultiListTabBarScreen extends StatefulWidget {
  @override
  State<MultiListTabBarScreen> createState() => _MultiListTabBarScreenState();
}

class _MultiListTabBarScreenState extends State<MultiListTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Múltiples Listados'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Todos'),
            Tab(text: 'Completados'),
            Tab(text: 'Pendientes'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(['Item 1', 'Item 2', 'Item 3', 'Item 4']),
          _buildList(['Item 2', 'Item 4']),
          _buildList(['Item 1', 'Item 3']),
        ],
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          leading: Icon(Icons.check_circle),
          trailing: Icon(Icons.more_vert),
        );
      },
    );
  }
}
```

### TabBar Personalizado

```dart
class CustomTabBarScreen extends StatefulWidget {
  @override
  State<CustomTabBarScreen> createState() => _CustomTabBarScreenState();
}

class _CustomTabBarScreenState extends State<CustomTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Personalizado'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // TabBar personalizado
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.white,
              labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              tabs: const [
                Tab(text: 'Opción 1'),
                Tab(text: 'Opción 2'),
                Tab(text: 'Opción 3'),
              ],
            ),
          ),
          
          // Contenido
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTabContent('Opción 1'),
                _buildTabContent('Opción 2'),
                _buildTabContent('Opción 3'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return Center(
      child: Text(title, style: TextStyle(fontSize: 20)),
    );
  }
}
```

### TabBar con Indicador Personalizado

```dart
class CustomIndicatorTabBar extends StatefulWidget {
  @override
  State<CustomIndicatorTabBar> createState() => _CustomIndicatorTabBarState();
}

class _CustomIndicatorTabBarState extends State<CustomIndicatorTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicador Personalizado'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            // Indicador personalizado
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.blue),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            // Otro tipo de indicador
            // indicator: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: Colors.blue,
            // ),
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: Text('Contenido 1')),
                Center(child: Text('Contenido 2')),
                Center(child: Text('Contenido 3')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

### TabBar con ScrollView

```dart
class ScrollableTabBarScreen extends StatefulWidget {
  @override
  State<ScrollableTabBarScreen> createState() =>
      _ScrollableTabBarScreenState();
}

class _ScrollableTabBarScreenState extends State<ScrollableTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Desplazable'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true, // Permite scroll
          tabs: List.generate(
            8,
            (index) => Tab(text: 'Categoría ${index + 1}'),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(
          8,
          (index) => Center(
            child: Text('Contenido Categoría ${index + 1}'),
          ),
        ),
      ),
    );
  }
}
```

---

## SnackBar

### SnackBar Básico

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('¡Hola SnackBar!'),
  ),
)
```

### SnackBar Completo

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Mensaje importante'),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.blue,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    action: SnackBarAction(
      label: 'Deshacer',
      textColor: Colors.white,
      onPressed: () {
        print('Acción ejecutada');
      },
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
  ),
)
```

### Diferentes tipos de SnackBar

```dart
// SnackBar de éxito
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 8),
        Text('Guardado correctamente'),
      ],
    ),
    backgroundColor: Colors.green,
  ),
)

// SnackBar de error
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.error, color: Colors.white),
        SizedBox(width: 8),
        Text('Error al guardar'),
      ],
    ),
    backgroundColor: Colors.red,
  ),
)

// SnackBar de advertencia
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.warning, color: Colors.white),
        SizedBox(width: 8),
        Text('Advertencia importante'),
      ],
    ),
    backgroundColor: Colors.orange,
  ),
)
```

---

## BottomSheet

### BottomSheet Básico

```dart
showBottomSheet(
  context: context,
  builder: (context) => Container(
    height: 200,
    color: Colors.white,
    child: Center(
      child: Text('Bottom Sheet'),
    ),
  ),
)
```

### BottomSheet Modal

```dart
showModalBottomSheet(
  context: context,
  builder: (context) => Container(
    height: 300,
    color: Colors.white,
    child: ListView(
      children: [
        ListTile(
          title: Text('Opción 1'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Opción 2'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text('Opción 3'),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  ),
)
```

### BottomSheet Personalizado

```dart
showModalBottomSheet(
  context: context,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) => Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Indicador
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Selecciona una opción',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Opción 1'),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Opción 2'),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Opción 3'),
        ),
      ],
    ),
  ),
)
```

### BottomSheet con Draggable

```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  builder: (context) => DraggableScrollableSheet(
    expand: false,
    builder: (context, scrollController) => ListView(
      controller: scrollController,
      children: [
        for (int i = 0; i < 20; i++)
          ListTile(
            title: Text('Elemento $i'),
          ),
      ],
    ),
  ),
)
```

---

## Ejemplo Completo

### Aplicación con todos los elementos

```dart
class CompleteScaffoldApp extends StatefulWidget {
  @override
  State<CompleteScaffoldApp> createState() => _CompleteScaffoldAppState();
}

class _CompleteScaffoldAppState extends State<CompleteScaffoldApp> {
  int _selectedBottomNav = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);

    // Mostrar SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Contador: $_counter'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Opciones adicionales'),
            SizedBox(height: 16),
            ListTile(
              title: Text('Compartir'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Guardar'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text('Aplicación Completa'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: _showBottomSheet,
          ),
        ],
      ),

      // Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contador: $_counter'),
          SizedBox(height: 20),
          Text('Bottom Nav: $_selectedBottomNav'),
        ],
      ),

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Usuario'),
              accountEmail: Text('usuario@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('U'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),

      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomNav,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedBottomNav = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
```

---

## Mejores Prácticas

### 1. Siempre usar SafeArea en Body

```dart
// ✅ Bien
Scaffold(
  body: SafeArea(
    child: MyContent(),
  ),
)

// ❌ Evitar - Contenido bajo notch o status bar
Scaffold(
  body: MyContent(),
)
```

### 2. Manejar teclado apropiadamente

```dart
// ✅ Bien - Ajustar cuando aparece teclado
Scaffold(
  resizeToAvoidBottomInset: true,
  body: SafeArea(
    child: TextField(),
  ),
)

// ❌ Evitar - Campo cubierto por teclado
Scaffold(
  resizeToAvoidBottomInset: false,
  body: TextField(),
)
```

### 3. Usar ScaffoldMessenger para SnackBar

```dart
// ✅ Bien - Usar ScaffoldMessenger
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Mensaje')),
);

// ❌ Evitar - Acceso directo a Scaffold
Scaffold.of(context).showSnackBar(...);
```

### 4. Lazy load de drawer content

```dart
// ✅ Bien - Drawer se carga on demand
drawer: Drawer(
  child: ListView(
    children: [
      DrawerHeader(...),
      ...buildDrawerItems(), // Construido cuando se necesita
    ],
  ),
)

// ❌ Evitar - Construir todo en initState
```

### 5. Usar const donde sea posible

```dart
// ✅ Bien - Const optimiza rendering
Scaffold(
  appBar: AppBar(title: const Text('Título')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
)

// ❌ Evitar - Reconstruir widgets innecesariamente
Scaffold(
  appBar: AppBar(title: Text('Título')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

### 6. Notificaciones con contexto

```dart
// ✅ Bien - Obtener contexto del builder
showModalBottomSheet(
  context: context,
  builder: (context) => Container(
    child: ElevatedButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Cerrar'),
    ),
  ),
)

// ❌ Evitar - Usar contexto incorrecto
builder: (_) => ElevatedButton(
  onPressed: () => Navigator.pop(context), // Context padre
  child: Text('Cerrar'),
)
```

### 7. Controlar duración de SnackBar

```dart
// ✅ Bien - Duración apropiada
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Mensaje importante'),
    duration: Duration(seconds: 4),
  ),
)

// Para errores críticos, permitir cerrar manualmente
SnackBar(
  content: Text('Error crítico'),
  duration: Duration(seconds: 10),
  action: SnackBarAction(
    label: 'Cerrar',
    onPressed: () {},
  ),
)
```

---

## Checklist de Scaffold

**Estructura:**
- ✅ Scaffold como root del layout
- ✅ AppBar con título y acciones
- ✅ Body con SafeArea
- ✅ Drawer si hay navegación lateral

**Componentes:**
- ✅ FloatingActionButton si hay acción principal
- ✅ BottomNavigationBar para múltiples vistas
- ✅ SnackBar para notificaciones

**Usabilidad:**
- ✅ Respetar notches y status bar
- ✅ Manejar teclado (resizeToAvoidBottomInset)
- ✅ Transiciones suaves entre secciones
- ✅ Iconos consistentes

**Performance:**
- ✅ Usar const widgets
- ✅ Lazy load de contenido
- ✅ Manejar navigator pop correctamente
- ✅ Limpiar listeners

---

**Documento actualizado: Febrero 2026**
**Versión: 1.0**
**Para alumnos de Flutter - Nivel Principiante/Intermedio**
