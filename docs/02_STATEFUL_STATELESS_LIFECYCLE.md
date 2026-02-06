# StatefulWidget vs StatelessWidget: Ciclo de Vida en Flutter

## Introducción

En Flutter, **todo es un widget**, pero existen dos tipos fundamentales:
- **StatelessWidget** - Inmutable, no cambia
- **StatefulWidget** - Mutable, puede cambiar

Esta es una de las decisiones más importantes que tomarás al diseñar componentes.

---

## 1. StatelessWidget (Widget sin Estado)

### Definición

Un `StatelessWidget` es un widget **inmutable** que no puede cambiar después de ser creado. Una vez renderizado, su apariencia no cambia a menos que los parámetros del widget padre cambien.

### Estructura

```dart
class MiWidgetSimple extends StatelessWidget {
  const MiWidgetSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Soy un StatelessWidget'),
    );
  }
}
```

### Características

```
✅ Immutable - No cambia
✅ Eficiente - Sin overhead de estado
✅ Fácil de entender
✅ Rápido de renderizar
✅ Predecible
```

### Casos de Uso

```dart
// 1. Mostrar información estática
class UserCard extends StatelessWidget {
  final String name;
  final String email;

  const UserCard({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Text(email),
        ],
      ),
    );
  }
}

// 2. Componentes UI puros
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Button({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

// 3. Layouts estáticos
class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.purple,
      child: const Text(
        'Mi Aplicación',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}
```

### Ejemplo Completo: App de Tarjetas

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Mis Contactos')),
        body: const ContactList(),
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ContactCard(name: 'Juan', email: 'juan@example.com'),
        ContactCard(name: 'María', email: 'maria@example.com'),
        ContactCard(name: 'Pedro', email: 'pedro@example.com'),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String email;

  const ContactCard({
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 2. StatefulWidget (Widget con Estado)

### Definición

Un `StatefulWidget` es un widget **mutable** que puede cambiar durante su ciclo de vida. Mantiene un estado interno que puede ser modificado y cuando cambia, el widget se reconstruye.

### Estructura

```dart
class MiWidgetConEstado extends StatefulWidget {
  const MiWidgetConEstado({Key? key}) : super(key: key);

  @override
  State<MiWidgetConEstado> createState() => _MiWidgetConEstadoState();
}

class _MiWidgetConEstadoState extends State<MiWidgetConEstado> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              contador++;
            });
          },
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### Características

```
⚠️ Mutable - Puede cambiar
⚠️ setState() - Para actualizar
⚠️ Ciclo de vida - initState(), dispose()
⚠️ Más complejo
✅ Flexible
✅ Interactivo
```

### Ciclo de Vida Completo

```
1. Creación (createState)
   ↓
2. initState() ← Llamado una vez
   ↓
3. build() ← Llamado cuando setState() es invocado
   ↓
4. didUpdateWidget() ← Cuando el widget padre cambia
   ↓
5. setState() ← Modifica el estado
   ↓
6. build() ← Se reconstruye
   ↓
7. dispose() ← Limpieza y cierre
```

### Ejemplo del Ciclo de Vida

```dart
class ConadorConLog extends StatefulWidget {
  const ConadorConLog({Key? key}) : super(key: key);

  @override
  State<ConadorConLog> createState() {
    print('1. createState() - Crear State');
    return _ConadorConLogState();
  }
}

class _ConadorConLogState extends State<ConadorConLog> {
  int contador = 0;

  @override
  void initState() {
    super.initState();
    print('2. initState() - Inicializar (solo una vez)');
    // Aquí inicializar controladores, listeners, etc.
  }

  @override
  void didUpdateWidget(ConadorConLog oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('4. didUpdateWidget() - Widget padre cambió');
  }

  @override
  Widget build(BuildContext context) {
    print('3. build() - Construir/reconstruir UI');
    return Column(
      children: [
        Text('Contador: $contador'),
        ElevatedButton(
          onPressed: () {
            print('5. setState() - Cambiar estado');
            setState(() {
              contador++;
            });
          },
          child: const Text('Incrementar'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    print('7. dispose() - Limpiar recursos');
    // Limpiar controllers, cancelar subscripciones
    super.dispose();
  }
}
```

### Casos de Uso

```dart
// 1. Formularios con validación
class FormularioLogin extends StatefulWidget {
  const FormularioLogin({Key? key}) : super(key: key);

  @override
  State<FormularioLogin> createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    setState(() {
      if (emailController.text.isEmpty) {
        errorMessage = 'Email requerido';
      } else {
        errorMessage = null;
        // Realizar login
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(hintText: 'Contraseña'),
          obscureText: true,
        ),
        if (errorMessage != null)
          Text(errorMessage!, style: const TextStyle(color: Colors.red)),
        ElevatedButton(
          onPressed: _login,
          child: const Text('Login'),
        ),
      ],
    );
  }
}

// 2. Temporizador
class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  int segundos = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        segundos++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Segundos: $segundos'),
    );
  }
}

// 3. Toggle/Switch
class Toggle extends StatefulWidget {
  const Toggle({Key? key}) : super(key: key);

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isEnabled,
      onChanged: (value) {
        setState(() {
          isEnabled = value;
        });
      },
    );
  }
}
```

---

## 3. Comparativa Rápida

| Aspecto | StatelessWidget | StatefulWidget |
|--------|---|---|
| **Estado** | Inmutable | Mutable |
| **Cambios** | No | Sí (setState) |
| **Performance** | Mejor | Peor (overhead) |
| **Complejidad** | Baja | Alta |
| **Uso** | UI estática | UI dinámica |
| **initState** | ❌ No | ✅ Sí |
| **dispose** | ❌ No | ✅ Sí |
| **Caso de uso** | Botones, textos | Formularios, timers |

---

## 4. Cuándo Usar Cada Uno

### Usa StatelessWidget Cuando:
```
✅ El widget no cambia después de ser creado
✅ Solo depende de sus parámetros
✅ Es un componente presentacional puro
✅ Quieres mejor performance
✅ No necesitas inicializar recursos
```

### Usa StatefulWidget Cuando:
```
✅ El widget necesita cambiar su apariencia
✅ Necesitas mantener estado interno
✅ Tienes controladores (TextEditingController)
✅ Necesitas listeners o subscripciones
✅ Necesitas limpiar recursos (dispose)
```

---

## 5. Buenas Prácticas

### ✅ DO's

```dart
// 1. Usar const cuando sea posible
class MiBotón extends StatelessWidget {
  const MiBotón({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      child: Text('Click me'),
    );
  }
}

// 2. Limpiar en dispose()
@override
void dispose() {
  controller.dispose(); // ✅ Correcto
  super.dispose();
}

// 3. Usar private state class
class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);
  @override
  State<MyWidget> createState() => _MyWidgetState(); // ✅ Privado
}

class _MyWidgetState extends State<MyWidget> { // ✅ _Privado
  // ...
}

// 4. Inicializar en initState
@override
void initState() {
  super.initState();
  controller = TextEditingController(); // ✅ Aquí
}
```

### ❌ DON'Ts

```dart
// 1. No inicializar en variable de instancia
class MalWidget extends StatefulWidget {
  const MalWidget({Key? key}) : super(key: key);
  @override
  State<MalWidget> createState() => _MalWidgetState();
}

class _MalWidgetState extends State<MalWidget> {
  late TextEditingController controller = TextEditingController(); // ❌ Malo
  // ...
}

// 2. No olvidar dispose
@override
void dispose() {
  // ❌ Falta dispose
  super.dispose();
}

// 3. No usar setState innecesariamente
setState(() {
  // ❌ Múltiples setState en build
  variable = newValue;
});

// 4. No hacer operaciones costosas en build
@override
Widget build(BuildContext context) {
  var result = fetchDataFromAPI(); // ❌ ¡Nunca!
  return Text(result);
}
```

---

## 6. Ejercicios

### Ejercicio 1: App Todo Simple
Crear app con StatefulWidget que:
- Agregue tareas
- Las elimine
- Muestre contador

### Ejercicio 2: Formulario Validado
Crear formulario con:
- Email, contraseña
- Validación en tiempo real
- Mensajes de error

### Ejercicio 3: Galería Interactiva
- Mostrar imágenes
- Seleccionar una
- Mostrar detalles

---

## 7. Resumen

```
StatelessWidget → Usa para UI estática
                → build() solo

StatefulWidget → Usa para UI dinámica
              → initState(), build(), dispose()
              → setState() para actualizar
```

**Recuerda:** La mayoría de tus widgets serán `StatelessWidget`. Usa `StatefulWidget` solo cuando necesites estado interno.

---

## 📚 Conceptos Relacionados

- [01 - Fundamentos de Widgets](01_FUNDAMENTOS_WIDGETS_BASICOS.md) - Base de estateless/stateful
- [03 - Builders Avanzados](03_ADVANCED_BUILDERS_STREAMS_FUTURE.md) - StreamBuilder y FutureBuilder
- [12 - Gestión de Estado](12_GESTION_ESTADO.md) - Alternativas a setState()
- [EJERCICIOS_02 - Prácticas](EJERCICIOS_02_STATEFUL_LIFECYCLE.md) - Ejercicios paso a paso
- [Flutter State Docs](https://api.flutter.dev/flutter/widgets/State-class.html) - Referencia oficial

---

## 8. Checklist

- ✅ Entiendo la diferencia
- ✅ Sé cuándo usar cada uno
- ✅ Puedo crear ambos tipos
- ✅ Entiendo el ciclo de vida
- ✅ Limpiar en dispose()
- ✅ Usar setState() correctamente
