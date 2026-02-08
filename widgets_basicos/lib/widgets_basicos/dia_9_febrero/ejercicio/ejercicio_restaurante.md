# 📖 Enunciado de Ejercicio: "App de Restaurante"

**Nivel:** Medio  
**Duración:** 2-3 horas  
**Fecha:** 9 de Febrero de 2026  

---

## 🎯 Objetivo General

Crear una **aplicación móvil de un restaurante** que permita:
- Navegar entre diferentes secciones (menú, mis pedidos, reservas)
- Visualizar un catálogo de platos en una lista dinámica
- Hacer pedidos y recibir confirmaciones
- Gestionar la interfaz con componentes Material Design

**Te enseñará a practicar:** Routing, Scaffold, SnackBars, ListViews y widgets personalizados.

---

## 📋 Descripción del Problema

Eres un desarrollador Flutter que debe construir una app para "Mi Restaurante". La app debe tener:

### 1. Estructura General (Scaffold)
La app debe tener una **pantalla principal** con:
- **Barra superior (AppBar)**: Mostrar el nombre del restaurante y un botón de información
- **Menú lateral (Drawer)**: Con 4 opciones de navegación:
  - 🍽️ Ver Menú (debe ir al tab 1)
  - 📦 Mis Pedidos (debe ir al tab 2)
  - 📅 Reservas (debe ir al tab 3)
  - ⚙️ Configuración (mostrar SnackBar)
- **Barra inferior (BottomNavigationBar)**: Con 3 tabs diferenciados
- **Botón flotante (FAB)**: Para hacer un nuevo pedido

### 2. Pantalla 1: Menú (Tab 1)
Mostrar una **lista de platos** con:
- Foto/icono del plato (puedes usar:', CircleAvatar, Icon, Container decorado, o imágenes desde `assets/images/`)
- Nombre del plato
- Descripción corta
- Precio
- Botón "Agregar al Carrito"

**Requisitos:**
- Usar `ListView.builder` para la lista (no ListView normal)
- Cada plato debe ser un `Card` con elevación
- Al presionar "Agregar al Carrito" → mostrar un `SnackBar` confirmando
- Mínimo 5 platos diferentes
- **BONUS:** Si usas imágenes reales del directorio `assets/images/`, consulta `my_images.dart` para ejemplos

**Datos de ejemplo:**
- Pizza Margarita - $12.99
- Pasta Carbonara - $11.50
- Ensalada César - $9.99
- Pollo al Horno - $13.50
- Tiramisú - $7.50

### 3. Pantalla 2: Mis Pedidos (Tab 2)
Mostrar los **pedidos realizados** (historial) con:
- Número del pedido
- Fecha de realización
- Estado (En preparación, En camino, Entregado)
- Total pagado
- Botón "Ver Detalles"

**Requisitos:**
- Usar `ListView.builder`
- Mostrar estado con ícono y color diferente según estado
  - 🔴 En preparación
  - 🟡 En camino
  - 🟢 Entregado
- Al presionar "Ver Detalles" → **navegar a una nueva pantalla** con detalles completos

### 4. Pantalla 3: Reservas (Tab 3)
Mostrar las **reservas del usuario** con:
- Fecha y hora de la reserva
- Número de personas
- Nombre de la reserva
- Botón "Cancelar Reserva"

**Requisitos:**
- Mostrar mínimo 3 reservas
- Al cancelar → mostrar SnackBar con opción "Deshacer"
- Mínimo 2 reservas debe poder cancelar exitosamente

### 5. Pantalla de Detalles de Pedido (Acceso por Routing)
Al presionar "Ver Detalles" en un pedido, debe abrirse una **pantalla nueva** con:
- Todos los platos del pedido en una lista
- Cantidad de cada plato
- Subtotal
- Impuestos
- Total
- Botón "Volver" para regresar

**Requisitos:**
- Usar **rutas nombradas** (no `Navigator.push` directo)
- Pasar el número de pedido como argumento
- Recibir los datos con `ModalRoute.of(context)?.settings.arguments`

### 6. Widgets Personalizados (Reutilizables)
Debes crear **mínimo 2 widgets personalizados**:

**Opción A:** Tarjeta de Plato (`PlatoCard`)
- Muestra: Icono, nombre, descripción, precio
- Parámetros personalizables
- Reutilizable en varias pantallas

**Opción B:** Tarjeta de Pedido (`PedidoCard`)
- Muestra: Número, fecha, estado, total
- Indicador visual del estado
- Reutilizable

**Opción C:** Encabezado de Sección (`SectionHeader`)
- Título personalizado
- Color de fondo personalizable
- Reutilizable

---

## 🎮 Interacciones Requeridas

### SnackBars
Debe haber **mínimo 6 SnackBars diferentes**:
1. ✅ "Plato agregado al carrito"
2. ✅ "Pedido realizado correctamente"
3. ✅ "Reserva cancelada"
4. ✅ Con opción "Deshacer" en cancelación
5. ✅ Confirmación en "Ver Detalles"
6. ✅ Mensaje al seleccionar opción del Drawer

### Navegación
- Entre los 3 tabs con BottomNavigationBar
- Mediante Drawer a diferentes opciones
- A pantalla de detalles (ruta nombrada)
- Volver de pantalla de detalles
- Mostrar diálogos (AlertDialog) para confirmaciones

### Estados Visuales
- Tab activo/inactivo (color diferente)
- Pérdidas en el estado (cambiar estado de checkbox, badge, etc.)
- Feedback visual al presionar botones

---

## 📐 Estructura de Carpetas (Recomendada)

```
lib/
├── main.dart                          (punto de entrada)
├── screens/
│   ├── home_screen.dart              (pantalla principal con tabs)
│   └── detalle_pedido_screen.dart    (pantalla de detalles)
└── widgets/
    ├── plato_card.dart               (widget personalizado)
    ├── pedido_card.dart              (widget personalizado)
    └── ...
```


## 🎓 Conceptos a Practicar

| Concepto | Dónde lo Usarás |
|----------|-----------------|
| **Routing rombrado** | Ir a pantalla de detalles |
| **Argumentos entre pantallas** | Pasar número de pedido |
| **Scaffold** | Estructura principal |
| **Drawer** | Menú de navegación |
| **BottomNavigationBar** | Cambiar entre tabs |
| **FloatingActionButton** | Crear nuevo pedido |
| **ListView.builder** | Mostrar platos, pedidos, reservas |
| **SnackBar** | Confirmaciones y mensajes |
| **setState** | Actualizar estado |
| **Widgets Personalizados** | Reutilizar Cards |
| **Card y ListTile** | UI de elementos |
| **AlertDialog** | Confirmaciones |

---

## 🔍 Criterios de Evaluación

### Muy Bien (85-100 puntos)
- ✅ Todos los requisitos funcionales incluidos
- ✅ Código limpio y comentado
- ✅ Widgets personalizados reutilizables
- ✅ Manejo correcto del estado con setState
- ✅ Routing y navegación sin errores
- ✅ UI coherente y profesional
- ✅ Al menos 3 widgets personalizados

### Bien (70-85 puntos)
- ✅ Mayoría de requisitos incluidos
- ✅ Código funcional pero con algunas mejoras posibles
- ✅ 2 widgets personalizados
- ✅ Navegación correcta
- ✅ SnackBars funcionando
- ⚠️ Pequeños detalles visuales mejorados

### Aceptable (60-70 puntos)
- ✅ Funcionalidad básica presente
- ✅ Navegación con algunos problemas menor
- ✅ 1 widget personalizado
- ⚠️ Código sin comentarios
- ⚠️ Algunos SnackBars faltantes

---

## 🚀 Extensiones (Bonus)

1. Agregar icono en AppBar para compartir menú
2. Agregar búsqueda de platos
3. Agregar filtro por categoría (Entrantes, Principales, Postres)
5. Cambiar los íconos sin estilo por verdaderas imágenes (ver `my_images.dart` para ejemplos)
6. Mostrar número de items en el FAB (badge)
7. Usar `Image.asset()` para mostrar fotos de platos desde la carpeta `assets/images/` 