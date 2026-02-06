# Widgets Avanzados: Builder, Stream, Future y Más

## Introducción

Existen widgets especializados que sirven para casos específicos y permiten optimizar el rendimiento y manejar operaciones complejas de forma elegante.

Los más importantes son:
- **Builder** - Controlar rebuilds
- **StreamBuilder** - Datos en tiempo real
- **FutureBuilder** - Operaciones asincrónicas
- **Consumer** - State management
- **ValueListenableBuilder** - Reactividad simple
- **InheritedWidget** - Pasar datos down-tree

---

## 1. Builder Widget

### ¿Qué es Builder?

Es un widget que crea un nuevo contexto (BuildContext). Sirve para evitar que el widget padre se reconstruya innecesariamente.

### Problema que Resuelve

```dart
// ❌ MALO - El Container completo se reconstruye
class MalEjemplo extends StatefulWidget {
  @override
  State<MalEjemplo> createState() => _MalEjemploState();
}

class _MalEjemploState extends State<MalEjemplo> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    print('❌ TODO se reconstruye: $contador'); // Se imprime cada vez
    
    return Column(
      children: [
        Container(
          color: Colors.blue,
          child: const Text('Componente costoso'), // Se reconstruye siempre
        ),
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () => setState(() => contador++),
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Solución con Builder

```dart
// ✅ BIEN - Solo el contador se reconstruye
class BuenEjemplo extends StatefulWidget {
  @override
  State<BuenEjemplo> createState() => _BuenEjemploState();
}

class _BuenEjemploState extends State<BuenEjemplo> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(
          builder: (context) {
            print('✅ Solo Builder se reconstruye');
            return Container(
              color: Colors.blue,
              child: const Text('Componente costoso'),
            );
          },
        ),
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () => setState(() => contador++),
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Ejemplo Práctico: Modal Dialog

```dart
class ModalDialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ElevatedButton(
          onPressed: () {
            // Necesitamos el BuildContext correcto para showDialog
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Éxito'),
                content: const Text('Diálogo mostrado correctamente'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Mostrar Diálogo'),
        );
      },
    );
  }
}
```

### Ejemplo: Acceder a MediaQuery

```dart
class ResponsiveBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < 600;
        
        return isMobile 
          ? const MobileLayout()
          : const DesktopLayout();
      },
    );
  }
}
```

---

## 2. FutureBuilder Widget

### ¿Qué es FutureBuilder?

Maneja datos que vienen de operaciones asincrónicas (APIs, base de datos, etc.) y actualiza la UI automáticamente cuando el Future se completa.

### Sintaxis Básica

```dart
FutureBuilder<T>(
  future: myFuture,           // El Future a esperar
  initialData: initialValue,  // Dato inicial (opcional)
  builder: (context, snapshot) {
    // snapshot.connectionState: loading, done, active, none
    // snapshot.data: el dato cuando está listo
    // snapshot.error: el error si falla
    
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    
    return Text('Dato: ${snapshot.data}');
  },
)
```

### Ejemplo: Cargar Datos de API

```dart
class UserProfile extends StatelessWidget {
  final int userId;

  const UserProfile({required this.userId});

  Future<User> fetchUser(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return User(id: id, name: 'Juan Pérez', email: 'juan@example.com');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: fetchUser(userId),
      builder: (context, snapshot) {
        // Estado: Cargando
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Estado: Error
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        // Estado: Éxito
        if (snapshot.hasData) {
          final user = snapshot.data!;
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(user.email),
                ],
              ),
            ),
          );
        }

        // Estado: Sin datos
        return const Center(child: Text('Sin datos'));
      },
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}
```

### Ejemplo: Cargar Lista de Datos

```dart
class TodoList extends StatelessWidget {
  Future<List<String>> fetchTodos() async {
    await Future.delayed(const Duration(seconds: 1));
    return ['Tarea 1', 'Tarea 2', 'Tarea 3'];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchTodos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final todos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index]),
              leading: const Icon(Icons.check_circle),
            );
          },
        );
      },
    );
  }
}
```

---

## 3. StreamBuilder Widget

### ¿Qué es StreamBuilder?

Similar a FutureBuilder, pero para Streams (datos continuos en el tiempo, no solo una sola respuesta).

### Sintaxis Básica

```dart
StreamBuilder<T>(
  stream: myStream,          // El Stream a escuchar
  initialData: initialValue, // Dato inicial (opcional)
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    
    return Text('Dato: ${snapshot.data}');
  },
)
```

### Ejemplo: Chat en Tiempo Real

```dart
class ChatScreen extends StatelessWidget {
  // Stream simulado de mensajes
  Stream<String> getMessages() async* {
    await Future.delayed(const Duration(seconds: 1));
    yield 'Hola desde el servidor';
    
    await Future.delayed(const Duration(seconds: 2));
    yield '¿Cómo estás?';
    
    await Future.delayed(const Duration(seconds: 1));
    yield 'Me alegra hablarte';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: getMessages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('Esperando mensajes...'));
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.hasData) {
          return Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(snapshot.data ?? ''),
              ),
            ),
          );
        }

        return const Center(child: Text('Sin mensajes'));
      },
    );
  }
}
```

### Ejemplo: Escuchar Cambios de Temperatura

```dart
class TemperatureMonitor extends StatelessWidget {
  // Stream que emite temperaturas cada segundo
  Stream<double> getTemperatureStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield (20 + (DateTime.now().second % 10)).toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
      stream: getTemperatureStream(),
      initialData: 20.0,
      builder: (context, snapshot) {
        final temp = snapshot.data ?? 0;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${temp.toStringAsFixed(1)}°C',
                style: const TextStyle(fontSize: 48),
              ),
              const SizedBox(height: 20),
              Text(
                snapshot.connectionState == ConnectionState.active
                    ? '🔴 En vivo'
                    : '⏸️ Desconectado',
              ),
            ],
          ),
        );
      },
    );
  }
}
```

---

## 4. ValueListenableBuilder Widget

### ¿Qué es ValueListenableBuilder?

Permite reconstruir solo una parte del widget cuando un ValueNotifier cambia, sin necesidad de setState.

### Sintaxis Básica

```dart
final myNotifier = ValueNotifier<int>(0);

ValueListenableBuilder<int>(
  valueListenable: myNotifier,
  builder: (context, value, child) {
    return Text('Valor: $value');
  },
)
```

### Ejemplo: Contador Reactivo

```dart
class ReactiveCounter extends StatefulWidget {
  @override
  State<ReactiveCounter> createState() => _ReactiveCounterState();
}

class _ReactiveCounterState extends State<ReactiveCounter> {
  final counterNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    counterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Solo el ValueListenableBuilder se reconstruye
        ValueListenableBuilder<int>(
          valueListenable: counterNotifier,
          builder: (context, value, child) {
            print('Reconstruyendo solo el contador');
            return Text(
              'Contador: $value',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
        const SizedBox(height: 20),
        // Este Container NO se reconstruye
        Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(20),
          child: const Text('Componente costoso'),
        ),
        ElevatedButton(
          onPressed: () => counterNotifier.value++,
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Ejemplo: Validación de Formulario en Tiempo Real

```dart
class ReactiveForm extends StatefulWidget {
  @override
  State<ReactiveForm> createState() => _ReactiveFormState();
}

class _ReactiveFormState extends State<ReactiveForm> {
  final emailNotifier = ValueNotifier<String>('');
  final passwordNotifier = ValueNotifier<String>('');

  bool isValidEmail(String email) =>
      email.contains('@') && email.contains('.');

  bool isValidPassword(String password) => password.length >= 6;

  @override
  void dispose() {
    emailNotifier.dispose();
    passwordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) => emailNotifier.value = value,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          onChanged: (value) => passwordNotifier.value = value,
          decoration: const InputDecoration(hintText: 'Contraseña'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        // Botón que se actualiza reactivamente
        ValueListenableBuilder<String>(
          valueListenable: emailNotifier,
          builder: (context, email, _) {
            return ValueListenableBuilder<String>(
              valueListenable: passwordNotifier,
              builder: (context, password, _) {
                final isValid =
                    isValidEmail(email) && isValidPassword(password);

                return ElevatedButton(
                  onPressed: isValid ? () {} : null,
                  child: const Text('Login'),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
```

---

## 5. Consumer Widget (Provider)

### ¿Qué es Consumer?

Cuando usas state management como Provider, Consumer te permite reconstruir solo la parte que depende del estado.

### Sintaxis

```dart
Consumer<MyProvider>(
  builder: (context, provider, child) {
    return Text('Dato: ${provider.data}');
  },
)
```

### Ejemplo: App con Provider

```dart
// Primero, crear el provider
class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

// Luego, usar Consumer
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Consumer Demo')),
          body: Consumer<CounterProvider>(
            builder: (context, provider, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Contador: ${provider.counter}'),
                    child!,
                  ],
                ),
              );
            },
            // child es un widget que NO se reconstruye
            child: ElevatedButton(
              onPressed: () {
                // Acceder al provider sin BuildContext
              },
              child: const Text('Incrementar'),
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 6. InheritedWidget

### ¿Qué es InheritedWidget?

Pasa datos desde un widget padre a todos sus descendientes de forma eficiente.

### Ejemplo: Tema Global

```dart
class ThemeInheritedWidget extends InheritedWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const ThemeInheritedWidget({
    required this.primaryColor,
    required this.secondaryColor,
    required Widget child,
  }) : super(child: child);

  static ThemeInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) {
    return oldWidget.primaryColor != primaryColor ||
        oldWidget.secondaryColor != secondaryColor;
  }
}

// Usar en un widget descendiente
class Button extends StatelessWidget {
  final String label;

  const Button({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeInheritedWidget.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme?.primaryColor,
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
```

---

## 7. Comparativa Rápida

| Widget | Uso | Cuándo Usar |
|--------|-----|-----------|
| **Builder** | Evitar rebuilds | Dentro de otros widgets |
| **FutureBuilder** | Operación async única | APIs, carga de datos |
| **StreamBuilder** | Datos continuos | WebSockets, real-time |
| **ValueListenableBuilder** | Estado reactivo simple | Sin Provider |
| **Consumer** | State management | Con Provider/Riverpod |
| **InheritedWidget** | Pasar datos down-tree | Temas, configuración |

---

## 8. Best Practices

### ✅ DO's

```dart
// 1. Usar Builder para evitar rebuilds innecesarios
Builder(
  builder: (context) {
    return ElevatedButton(
      onPressed: () => showDialog(context: context),
      child: const Text('Click'),
    );
  },
)

// 2. Manejar todos los estados en FutureBuilder
if (snapshot.connectionState == ConnectionState.waiting) {
  // Loading
}
if (snapshot.hasError) {
  // Error
}
if (snapshot.hasData) {
  // Success
}

// 3. Limpiar ValueNotifiers
@override
void dispose() {
  myNotifier.dispose();
  super.dispose();
}

// 4. Usar child en Consumer para evitar rebuilds
Consumer<MyProvider>(
  builder: (context, provider, child) => child!,
  child: ExpensiveWidget(), // Solo se construye una vez
)
```

### ❌ DON'Ts

```dart
// 1. No usar setState innecesariamente
setState(() {}); // ❌ Evitar

// 2. No ignorar snapshot.connectionState
if (snapshot.hasData) { // ❌ Incompleto
  // ¿Y si está cargando o hay error?
}

// 3. No olvidar dispose()
final notifier = ValueNotifier(0); // ❌ Nunca libera memoria

// 4. No acceder a context fuera de build()
onPressed: () {
  Navigator.of(context).push(...); // ❌ Mal, context puede estar invalido
}
```

---

## 9. Ejercicios

### Ejercicio 1: App con FutureBuilder
Crear app que cargue lista de usuarios desde API simulada

### Ejercicio 2: Chat con StreamBuilder
Simular chat en tiempo real con Stream

### Ejercicio 3: Validación Reactiva
Crear formulario con ValueListenableBuilder

---

## 10. Resumen

```
Builder           → Controlar contexto y evitar rebuilds
FutureBuilder     → Operaciones async únicas
StreamBuilder     → Datos continuos en tiempo real
ValueListenableBuilder → Estado reactivo simple
Consumer          → Integración con Provider
InheritedWidget   → Pasar datos a descendientes
```

Elige el widget correcto para cada situación y tu app será más eficiente.

---

## 📚 Conceptos Relacionados

- [02 - StatefulWidget](02_STATEFUL_STATELESS_LIFECYCLE.md) - Ciclo de vida base
- [04 - ListView](04_LISTVIEW_SCROLLVIEW.md) - ListView.builder optimizado
- [12 - Gestión Estado](12_GESTION_ESTADO.md) - Provider con Consumer
- [14 - Consumo APIs](14_CONSUMO_APIS.md) - FutureBuilder con APIs reales
- [EJERCICIOS_03 - Prácticas](EJERCICIOS_03_BUILDERS_STREAMS.md) - Casos prácticos
- [StreamBuilder Docs](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html) - Referencia oficial
