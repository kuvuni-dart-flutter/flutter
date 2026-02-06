# Rutas (Routing) en Flutter - Guía Completa

## 📚 Tabla de Contenidos
1. [Introducción](#introducción)
2. [Conceptos fundamentales](#conceptos-fundamentales)
3. [Navegación básica con Navigator](#navegación-básica-con-navigator)
4. [Named Routes (Rutas nombradas)](#named-routes-rutas-nombradas)
5. [Parámetros en rutas](#parámetros-en-rutas)
6. [GoRouter (Recomendado)](#gorouter-recomendado)
7. [AutoRoute (Avanzado)](#autoroute-avanzado)
8. [Deep Linking](#deep-linking)
9. [Gestión de estado con rutas](#gestión-de-estado-con-rutas)
10. [Ejemplos prácticos](#ejemplos-prácticos)
11. [Mejores prácticas](#mejores-prácticas)
12. [Solución de problemas](#solución-de-problemas)

---

## Introducción

Las **rutas** en Flutter son el mecanismo que permite navegar entre diferentes pantallas de tu aplicación. Es como un sistema de direcciones que te dice: "Ve a esta pantalla" o "Vuelve a la pantalla anterior".

### ¿Por qué son importantes?

- **Experiencia de usuario**: Transiciones suaves entre pantallas
- **Estructura**: Organiza tu app en pantallas claras y lógicas
- **Deep linking**: Permite abrir pantallas específicas desde URLs
- **Estado**: Mantener el contexto al navegar
- **Accesibilidad**: Back button y navegación correcta

### Analogía del mundo real

Las rutas en Flutter son como los pasillos de un hotel:
- Cada habitación es una **pantalla** (screen)
- Los pasillos son las **rutas** que conectan habitaciones
- La recepción es la **pantalla principal** (home)
- El **botón atrás** es como volver por el mismo pasillo

---

## Conceptos fundamentales

### ¿Qué es una ruta?

Una **ruta** es una dirección que especifica qué widget mostrar. Puede ser:

```dart
// Ruta simple: un widget
MaterialPageRoute(builder: (_) => HomePage())

// Ruta nombrada: con un nombre
'/home'

// Ruta con parámetros: con información
'/product/123'

// Ruta profunda: desde URL externa
'myapp://product/123'
```

### El Stack de navegación (Navigator Stack)

Flutter usa un **stack** (pila) para gestionar las rutas:

```
Stack de pantallas:
┌─────────────────────┐
│   PantallaNueva     │  ← Tope del stack (visible)
├─────────────────────┤
│   PantallaActual    │
├─────────────────────┤
│   HomePage          │  ← Base del stack
└─────────────────────┘

Operaciones:
- push: Añade pantalla al tope
- pop: Elimina la pantalla del tope
- replace: Reemplaza la pantalla actual
```

### La clase Navigator

El `Navigator` es la clase principal que gestiona el stack de rutas:

```dart
// Navegar a una nueva pantalla (push)
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => DetailsScreen()),
);

// Volver a la pantalla anterior (pop)
Navigator.pop(context);

// Navegar a una ruta nombrada
Navigator.pushNamed(context, '/details');

// Reemplazar la pantalla actual
Navigator.pushReplacementNamed(context, '/home');

// Vaciar el stack y ir a una pantalla
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (_) => false,
);
```

---

## Navegación básica con Navigator

### Método 1: Navegación directa (MaterialPageRoute)

La forma más simple de navegar:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la siguiente pantalla
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(),
              ),
            );
          },
          child: Text('Ir a Detalles'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
        // El botón atrás aparece automáticamente
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pantalla de Detalles'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Volver a la pantalla anterior
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Método 2: Transiciones personalizadas

Puedes crear transiciones personalizadas:

```dart
// Transición suave (fade)
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return DetailsScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);

// Transición de deslizamiento desde la derecha
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return DetailsScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Slide transition
      final offset = Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).evaluate(animation);
      return SlideTransition(offset: offset, child: child);
    },
  ),
);

// Transición de escala
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return DetailsScreen();
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(scale: animation, child: child);
    },
  ),
);
```

### Método 3: Recibir datos de la pantalla siguiente

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (resultado != null)
              Text('Resultado: $resultado'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navegar y esperar resultado
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
                
                // Recibir datos de la pantalla anterior
                if (result != null) {
                  setState(() {
                    resultado = result;
                  });
                }
              },
              child: Text('Ir a Detalles'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Volver con datos
                Navigator.pop(context, 'Datos desde DetailsScreen');
              },
              child: Text('Volver con datos'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Named Routes (Rutas nombradas)

Las rutas nombradas son más fáciles de mantener que referencias directas.

### Configurar rutas nombradas

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Ruta inicial
      home: HomePage(),
      // Definir rutas nombradas
      routes: {
        '/home': (context) => HomePage(),
        '/details': (context) => DetailsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      // Ruta desconocida (404)
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar usando ruta nombrada
                Navigator.pushNamed(context, '/details');
              },
              child: Text('Ir a Detalles'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Ir a Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Center(child: Text('Pantalla de Detalles')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(child: Text('Pantalla de Perfil')),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configuración')),
      body: Center(child: Text('Pantalla de Configuración')),
    );
  }
}
```

### Ventajas de las rutas nombradas

```
✅ Fácil de mantener: Todas las rutas en un solo lugar
✅ Nombres consistentes: Evita errores tipográficos
✅ Cambios centralizados: Cambiar una ruta afecta toda la app
✅ Documentación: Claro qué rutas existen
```

---

## Parámetros en rutas

A menudo necesitas pasar datos a otras pantallas:

### Método 1: Parámetros directos

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar pasando el widget como parámetro
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  productId: 123,
                  productName: 'Producto ABC',
                ),
              ),
            );
          },
          child: Text('Ver Producto'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final int productId;
  final String productName;

  const DetailsScreen({
    required this.productId,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $productId'),
            Text('Nombre: $productName'),
          ],
        ),
      ),
    );
  }
}
```

### Método 2: Parámetros en rutas nombradas

```dart
// En main.dart
MaterialApp(
  routes: {
    '/details': (context) {
      // Obtener argumentos
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      return DetailsScreen(
        productId: args['id'],
        productName: args['name'],
      );
    },
  },
)

// Desde la pantalla anterior
Navigator.pushNamed(
  context,
  '/details',
  arguments: {
    'id': 123,
    'name': 'Producto ABC',
  },
);

// En DetailsScreen
class DetailsScreen extends StatelessWidget {
  final int productId;
  final String productName;

  const DetailsScreen({
    required this.productId,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Center(
        child: Column(
          children: [
            Text('ID: $productId'),
            Text('Nombre: $productName'),
          ],
        ),
      ),
    );
  }
}
```

### Método 3: Parámetros en URLs (rutas profundas)

```dart
// En main.dart
MaterialApp(
  onGenerateRoute: (settings) {
    // Parsear ruta con parámetros
    if (settings.name!.startsWith('/product/')) {
      final productId = settings.name!.split('/')[2];
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(productId: int.parse(productId)),
      );
    }
    return null;
  },
)

// Navegar a: /product/123
Navigator.pushNamed(context, '/product/123');
```

---

## GoRouter (Recomendado)

GoRouter es la solución moderna y recomendada para ruteo en Flutter. Es más poderosa que las rutas nombradas y soporta deep linking automáticamente.

### Instalación

En `pubspec.yaml`:

```yaml
dependencies:
  go_router: ^13.0.0
```

### Configuración básica

```dart
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final GoRouter _router;

  MyApp() {
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        // Ruta principal
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
          routes: [
            // Rutas secundarias (anidadas)
            GoRoute(
              path: 'details',
              builder: (context, state) => DetailsScreen(),
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inicio')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go('/details');
              },
              child: Text('Ir a Detalles'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/profile');
              },
              child: Text('Ir a Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pantalla de Detalles'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(child: Text('Pantalla de Perfil')),
    );
  }
}
```

### GoRouter con parámetros

```dart
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        // Ruta con parámetro
        GoRoute(
          path: 'product/:id',
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            return DetailsScreen(productId: productId);
          },
        ),
      ],
    ),
  ],
);

// Navegar con parámetros
context.go('/product/123');

// O con push (agregar al stack)
context.push('/product/123');
```

### GoRouter con query parameters

```dart
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'search',
          builder: (context, state) {
            final query = state.uri.queryParameters['q'] ?? '';
            final sort = state.uri.queryParameters['sort'] ?? 'name';
            return SearchScreen(query: query, sort: sort);
          },
        ),
      ],
    ),
  ],
);

// Navegar con query parameters
context.go('/search?q=flutter&sort=date');
```

### GoRouter con argumentos complejos

```dart
// Pasar objetos complejos usando extra
context.push(
  '/details',
  extra: {'product': productObject, 'userId': 123},
);

// Recibir en la ruta
GoRoute(
  path: 'details',
  builder: (context, state) {
    final args = state.extra as Map;
    final product = args['product'];
    final userId = args['userId'];
    return DetailsScreen(product: product, userId: userId);
  },
)
```

### GoRouter error handling

```dart
final router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Ruta no encontrada: ${state.location}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('Ir a Inicio'),
            ),
          ],
        ),
      ),
    );
  },
  routes: [
    // ...
  ],
);
```

---

## AutoRoute (Avanzado)

AutoRoute es una librería que genera código automáticamente para rutas. Ideal para aplicaciones grandes.

### Instalación

En `pubspec.yaml`:

```yaml
dependencies:
  auto_route: ^8.0.0

dev_dependencies:
  auto_route_generator: ^8.0.0
  build_runner: ^2.4.0
```

### Configuración

**lib/router/app_router.dart**

```dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// Importar tus screens

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: ProfileRoute.page),
  ];
}
```

### Usar AutoRoute

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mi App',
      routerConfig: appRouter.config(),
    );
  }
}
```

### Generar rutas

```bash
flutter pub run build_runner build
```

---

## Deep Linking

El deep linking permite abrir tu app en una pantalla específica desde una URL externa.

### Configurar Deep Linking en Android

**android/app/src/main/AndroidManifest.xml**

```xml
<application>
    <activity
        android:name=".MainActivity"
        android:exported="true">
        
        <intent-filter>
            <action android:name="android.intent.action.MAIN" />
            <category android:name="android.intent.category.LAUNCHER" />
        </intent-filter>
        
        <!-- Deep link intent filter -->
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <!-- Especificar tu dominio -->
            <data android:scheme="https" 
                  android:host="miapp.com" />
            <data android:scheme="myapp" />
        </intent-filter>
    </activity>
</application>
```

### Configurar Deep Linking en iOS

**ios/Runner/Info.plist**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    ...
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLName</key>
            <string>com.example.myapp</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>myapp</string>
            </array>
        </dict>
    </array>
    ...
</dict>
</plist>
```

### Procesar Deep Links

```dart
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    // Procesar deep links
    // Por defecto GoRouter los maneja automáticamente
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'product/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return DetailsScreen(productId: id);
          },
        ),
      ],
    ),
  ],
);

// URLs que se pueden abrir
// myapp://product/123
// https://miapp.com/product/123
```

---

## Gestión de estado con rutas

Combinar rutas con gestión de estado:

### Con Provider

```dart
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationProvider>(
        builder: (context, nav, _) {
          return IndexedStack(
            index: nav.selectedIndex,
            children: [
              HomeScreen(),
              SearchScreen(),
              ProfileScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, nav, _) {
          return BottomNavigationBar(
            currentIndex: nav.selectedIndex,
            onTap: (index) {
              context.read<NavigationProvider>().setIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
            ],
          );
        },
      ),
    );
  }
}
```

### Con Riverpod

```dart
import 'package:riverpod/riverpod.dart';

final currentRouteProvider = StateProvider<String>((ref) => '/');

final routerProvider = Provider((ref) {
  final route = ref.watch(currentRouteProvider);

  return GoRouter(
    initialLocation: route,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/details',
        builder: (context, state) => DetailsScreen(),
      ),
    ],
  );
});
```

---

## Ejemplos prácticos

### Ejemplo 1: App de comercio electrónico

```dart
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late final GoRouter _router;

  MyApp() {
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        // Página principal
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(),
          routes: [
            // Lista de productos
            GoRoute(
              path: 'products',
              builder: (context, state) => ProductsScreen(),
              routes: [
                // Detalles de un producto
                GoRoute(
                  path: ':productId',
                  builder: (context, state) {
                    final productId = state.pathParameters['productId']!;
                    return ProductDetailsScreen(productId: productId);
                  },
                ),
              ],
            ),
            // Carrito
            GoRoute(
              path: 'cart',
              builder: (context, state) => CartScreen(),
            ),
            // Checkout
            GoRoute(
              path: 'checkout',
              builder: (context, state) => CheckoutScreen(),
            ),
            // Perfil del usuario
            GoRoute(
              path: 'profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
        // Pantalla de login (no anidada)
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
      ],
      errorBuilder: (context, state) => ErrorScreen(error: state.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'E-commerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tienda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/products'),
              child: Text('Ver Productos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/cart'),
              child: Text('Ir al Carrito'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: Text('Mi Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = ['Producto 1', 'Producto 2', 'Producto 3'];
    
    return Scaffold(
      appBar: AppBar(title: Text('Productos')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            onTap: () {
              // Navegar a detalles del producto
              context.go('/products/${index + 1}');
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles del Producto')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Producto ID: $productId'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrito')),
      body: Center(child: Text('Carrito vacío')),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')),
      body: Center(child: Text('Checkout')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil')),
      body: Center(child: Text('Tu Perfil')),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: Text('Entrar'),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: ${error?.toString()}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: Text('Ir a Inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Ejemplo 2: App con autenticación

```dart
class MyApp extends StatelessWidget {
  late final GoRouter _router;

  MyApp() {
    _router = GoRouter(
      initialLocation: '/',
      redirect: (context, state) {
        final isLoggedIn = false; // Obtener del estado real
        final isLoginPage = state.location == '/login';

        if (!isLoggedIn && !isLoginPage) {
          return '/login';
        }

        if (isLoggedIn && isLoginPage) {
          return '/';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'profile',
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
```

---

## Mejores prácticas

### ✅ DO: Hacer esto

```dart
// Usar constantes para rutas
const String routeHome = '/';
const String routeDetails = '/details';
const String routeProfile = '/profile';

// Usar GoRouter para aplicaciones modernas
final router = GoRouter(
  routes: [
    // ...
  ],
);

// Pasar parámetros de forma estructurada
context.go('/product/$productId');

// Usar context.go() para navegación simple
context.go('/details');

// Usar context.push() para agregar al stack
context.push('/details');

// Usar context.pop() para volver
context.pop();

// Manejar deep links correctamente
// Dejar que GoRouter lo maneje automáticamente

// Crear rutas anidadas para mejor estructura
GoRoute(
  path: '/',
  routes: [
    GoRoute(path: 'details', ...),
  ],
)
```

### ❌ DON'T: No hacer esto

```dart
// ✗ No hardcodear rutas en muchos lugares
Navigator.pushNamed(context, '/my/deep/route');

// ✗ No pasar datos complejos sin serialización
Navigator.push(context, ...);

// ✗ No ignorar los parámetros de ruta
GoRoute(path: 'product/:id', ...)

// ✗ No mezclar múltiples sistemas de routing
// Elegir uno: Navigator.push, rutas nombradas o GoRouter

// ✗ No olvidar el botón atrás
// Flutter lo maneja automáticamente

// ✗ No navegar sin contexto
// Siempre usar context para navigator
```

### Checklist de mejores prácticas

- [ ] Usar GoRouter para nuevas apps
- [ ] Definir constantes para rutas
- [ ] Estructurar rutas de forma jerárquica
- [ ] Manejar rutas desconocidas
- [ ] Soportar deep linking
- [ ] Pasar parámetros de forma clara
- [ ] Usar transiciones personalizadas cuando sea apropiado
- [ ] Mantener coherencia en nombres de rutas
- [ ] Documentar rutas complejas
- [ ] Probar navegación en dispositivos reales

---

## Solución de problemas

### Problema: El botón atrás no funciona

**Solución:**
```dart
// Flutter maneja automáticamente el botón atrás
// Si no funciona, verifica:

// 1. Hay más de una ruta en el stack
Navigator.canPop(context) // true si hay rutas previas

// 2. Personaliza el comportamiento
WillPopScope(
  onWillPop: () async {
    // Tu lógica personalizada
    return true;
  },
  child: Scaffold(...),
)
```

### Problema: Deep links no funcionan

**Solución:**
```dart
// 1. Configura correctamente el manifest
// 2. Verifica el scheme (myapp:// o https://)
// 3. Usa GoRouter que lo maneja automáticamente
// 4. Prueba en dispositivo real, no emulador
```

### Problema: Pérdida de estado al navegar

**Solución:**
```dart
// Usar IndexedStack para mantener estado
IndexedStack(
  index: currentIndex,
  children: [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ],
)

// O usar gestión de estado (Provider, Riverpod)
```

### Problema: Transiciones lentas

**Solución:**
```dart
// Reducir duración
transitionDuration: Duration(milliseconds: 200),

// O usar transición más simple
FadeTransition(opacity: animation, child: child)
```

### Problema: Rutas nombradas no funcionan

**Solución:**
```dart
// Verificar:
// 1. Ruta está registrada en routes map
// 2. Nombre exacto coincide
// 3. MaterialApp tiene home definido

MaterialApp(
  home: HomePage(),
  routes: {
    '/details': (context) => DetailsScreen(),
  },
)
```

---

## Resumen comparativo

### Navigator.push vs Rutas nombradas vs GoRouter

```
┌─────────────────────┬──────────────┬──────────────┬───────────────┐
│ Característica      │ Navigator    │ Named Routes │ GoRouter      │
├─────────────────────┼──────────────┼──────────────┼───────────────┤
│ Facilidad           │ Baja         │ Media        │ Alta          │
│ Deep Linking        │ Manual       │ Manual       │ Automático    │
│ Parámetros          │ Directos     │ Limitados    │ Flexibles     │
│ Transiciones        │ Personaliza  │ Limitadas    │ Personaliza   │
│ Escalabilidad       │ Baja         │ Media        │ Alta          │
│ Recomendado para    │ Apps simple  │ Apps médias  │ Apps grandes  │
│ Curva aprendizaje   │ Baja         │ Media        │ Media-Alta    │
└─────────────────────┴──────────────┴──────────────┴───────────────┘
```

### Recomendaciones

- **Apps pequeñas/simples**: Navigator.push
- **Apps medianas**: Rutas nombradas o GoRouter
- **Apps grandes/complejas**: GoRouter
- **Apps con autenticación**: GoRouter con redirect
- **Apps de e-commerce**: GoRouter con deep linking

---

## Enlaces útiles

- [Documentación oficial de Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
- [GoRouter - Pub.dev](https://pub.dev/packages/go_router)
- [AutoRoute - Pub.dev](https://pub.dev/packages/auto_route)
- [Flutter Routing Tutorial](https://flutter.dev/docs/development/ui/navigation)
- [Deep Linking en Flutter](https://flutter.dev/docs/development/ui/navigation/deep-linking)

---

## Preguntas frecuentes

**P: ¿Cuál es la mejor forma de navegar?**
R: GoRouter es recomendado para aplicaciones modernas. Usa Navigator.push solo para apps muy simples.

**P: ¿Cómo paso datos complejos entre pantallas?**
R: Usa el parámetro `extra` en GoRouter o crea un modelo y pásalo como parámetro del constructor.

**P: ¿Puedo tener múltiples niveles de navegación?**
R: Sí, usa `IndexedStack` con BottomNavigationBar o `Navigator` anidados.

**P: ¿Deep linking funciona en web?**
R: Sí, GoRouter soporta deep linking en web, Android e iOS.

**P: ¿Cómo restauro el estado anterior después de navegar?**
R: Usa gestión de estado (Provider, Riverpod) o IndexedStack.

**P: ¿Puedo cambiar el botón atrás?**
R: Sí, personaliza el `leading` en AppBar.

---

## Conceptos Relacionados

- [02 - StatefulWidget](02_STATEFUL_STATELESS_LIFECYCLE.md) - Ciclo de vida
- [06 - Scaffold](06_SCAFFOLD_NAVEGACION.md) - Navegacion
- [09 - Responsive](09_RESPONSIVE_DESIGN.md) - Adaptativo
- [12 - Gestion Estado](12_GESTION_ESTADO.md) - Persistencia
- [EJERCICIOS_05 - Practicas](EJERCICIOS_05_RUTAS_ROUTING.md) - Ejercicios
- [GoRouter Docs](https://pub.dev/packages/go_router) - Referencia

---

**Documento actualizado: Febrero 2026**
**Versión: 1.0**
**Para alumnos de Flutter - Nivel Intermedio**
