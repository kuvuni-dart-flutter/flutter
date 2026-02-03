# EJERCICIO AVANZADO: Dashboard de estadísticas

## Nivel: Intermedio-Avanzado

### Objetivo
Crear un **Dashboard de estadísticas complejo** que use solo **Column, Row y Stack** para mostrar un resumen de métricas de una aplicación. Este ejercicio enfatiza la composición de layouts simples para crear interfaces complejas.

---

## Requisitos

### 1. Estructura general
Crea una clase `StatisticsDashboard` que sea un StatelessWidget que muestre un dashboard profesional.


## Datos de ejemplo

```dart
// KPI Data
const int usuariosActivos = 1234;
const double ingresos = 45600.50;
const int tasaConversion = 78;

// Cambios
const int cambioUsuarios = 12;    // positivo = ↑ verde
const int cambioIngresos = -5;    // negativo = ↓ rojo
const int cambioConversion = 23;  // positivo = ↑ verde

// Gráfico
const List<int> datosGrafico = [65, 42, 78, 91, 55];
const List<String> diasSemana = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'];

// Transacciones
const List<Map<String, dynamic>> transacciones = [
  {'id': '#1001', 'monto': '125.50€', 'estado': 'Completado'},
  {'id': '#1002', 'monto': '89.99€', 'estado': 'Pendiente'},
  {'id': '#1003', 'monto': '234.75€', 'estado': 'Cancelado'},
  {'id': '#1004', 'monto': '456.00€', 'estado': 'Completado'},
  {'id': '#1005', 'monto': '178.25€', 'estado': 'Pendiente'},
];
```

---

## Cómo insertar iconos en Flutter

### Material Design Icons
Flutter incluye la librería `material.dart` que proporciona acceso a todos los iconos de Material Design. No requiere instalación adicional.

### Importar Icons
```dart
import 'package:flutter/material.dart';

// Ya está incluido en el import anterior
```

### Usar Iconos en tu código
```dart
// Icono simple
Icon(Icons.people)

// Icono con tamaño y color
Icon(
  Icons.attach_money,
  size: 32,
  color: Colors.green,
)

// En un Button
ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.download),
  label: Text('Descargar'),
)

// En AppBar
AppBar(
  title: const Text('Dashboard'),
  actions: [
    IconButton(
      icon: Icon(Icons.account_circle),
      onPressed: () {},
    ),
  ],
)
```

### Iconos usados en este ejercicio
```dart
Icons.people              // Usuarios
Icons.euro                // Dinero/Ingresos
Icons.trending_up         // Estadísticas/Conversión
Icons.download            // Descargar
Icons.upload              // Compartir/Subir
Icons.settings            // Configurar
Icons.help                // Ayuda
Icons.account_circle      // Perfil de usuario
```

### Dónde buscar más iconos

**📱 Flutter Icons Gallery (Oficial)**
- URL: https://api.flutter.dev/flutter/material/Icons-class.html
- Descripción: Galería oficial de todos los iconos de Material Design disponibles en Flutter
- Búsqueda: Usa Ctrl+F en la página para buscar iconos por nombre

**🎨 Material Design Icons (Referencia)**
- URL: https://fonts.google.com/icons
- Descripción: Todos los iconos de Material Design (versión web)
- Búsqueda: Puedes buscar por nombre o categoría

**💡 Alternativa: Custom Icons**
- Si necesitas iconos especiales, puedes usar librerías como:
  - `font_awesome_flutter`: Font Awesome icons
  - `cupertino_icons`: Iconos estilo iOS
  - Importar imágenes personalizadas como PNG/SVG

### Ejemplos de iconos por categoría

**Transacciones:**
- Icons.receipt
- Icons.payment
- Icons.credit_card
- Icons.attach_money

**Usuarios:**
- Icons.people
- Icons.person
- Icons.account_circle
- Icons.group

**Acciones:**
- Icons.edit
- Icons.delete
- Icons.download
- Icons.upload
- Icons.share

**Estado:**
- Icons.check_circle
- Icons.error_outline
- Icons.warning
- Icons.info

**Navegación:**
- Icons.home
- Icons.search
- Icons.menu
- Icons.close

### Búsqueda rápida de iconos

```dart
// Copiar el nombre del icono desde la galería oficial
Icon(Icons.trending_up)  // Después de Icons.

// Ejemplos adicionales:
Icon(Icons.pie_chart)        // Gráficos
Icon(Icons.bar_chart)        // Gráficos de barras
Icon(Icons.analytics)        // Análisis
Icon(Icons.dashboard)        // Dashboard
Icon(Icons.calendar_today)   // Fechas
Icon(Icons.schedule)         // Horarios
```

---
