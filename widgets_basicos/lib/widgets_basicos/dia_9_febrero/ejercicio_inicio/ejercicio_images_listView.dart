/*
╔═══════════════════════════════════════════════════════════════════════════════╗
║                   EJERCICIO: GALERÍA DE IMÁGENES INTERACTIVA                 ║
║                                                                               ║
║ Objetivo: Crear una aplicación completa que combine Scaffold, ListView,      ║
║           imágenes, SnackBars y manejo de eventos.                           ║
║                                                                               ║
║ Que aprenderás: Widgets complejos, gestión de estado, listas, imágenes,     ║
║                 navegación básica, interactividad.                           ║
╚═══════════════════════════════════════════════════════════════════════════════╝
*/

// ============================================================================
// NIVEL BÁSICO (PASOS 1-3)
// ============================================================================

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 1: Estructura básica del Scaffold                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Crea una clase GaleriaApp que extienda StatelessWidget                  │
│ 2. En el método build(), retorna MaterialApp con:                          │
│    - title: "Galería de Imágenes"                                          │
│    - home: GaleriaPage()                                                   │
│ 3. Crea la clase GaleriaPage que extienda StatefulWidget                   │
│ 4. En el Scaffold, agrega:                                                 │
│    - AppBar con título "📸 Mi Galería de Imágenes"                         │
│    - backgroundColor azul claro                                            │
│                                                                             │
│ RESULTADO ESPERADO: Una pantalla básica con AppBar                         │
│ DIFICULTAD: ⭐                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 2: Crear una lista de datos de imágenes                               │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Crea un modelo (clase) llamado ImagenItem con propiedades:              │
│    - id (int)                                                               │
│    - titulo (String)                                                        │
│    - descripcion (String)                                                   │
│    - rutaImagen (String) - usa 'assets/images/foto.png'                   │
│    - megusta (bool) - por defecto false                                    │
│                                                                             │
│ 2. En la clase _GaleriaPageState, crea una lista de 5 objetos ImagenItem  │
│    con datos diferentes (ej: "Playa", "Montaña", "Bosque", etc.)          │
│                                                                             │
│ 3. Cada elemento debe tener un ID único (1, 2, 3, 4, 5)                   │
│                                                                             │
│ RESULTADO ESPERADO: Una lista de datos lista para mostrar                  │
│ DIFICULTAD: ⭐⭐                                                           │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 3: Crear ListView con tarjetas de imágenes                            │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. En el body del Scaffold, agrega un ListView.builder que:                │
│    - Tome la lista de imágenes como itemCount                              │
│    - Para cada elemento, crea un Card que contenga:                        │
│      * Image.asset() con la imagen                                         │
│      * Texto con el título                                                 │
│      * Texto con la descripción                                            │
│                                                                             │
│ 2. Agrupa la imagen y los textos en un Column dentro del Card              │
│ 3. Usa padding (16 píxeles) alrededor de cada Card                         │
│ 4. Usa height: 200 para cada Card                                          │
│                                                                             │
│ RESULTADO ESPERADO: ListView con 5 tarjetas mostrando images y textos      │
│ DIFICULTAD: ⭐⭐                                                           │
└─────────────────────────────────────────────────────────────────────────────┘
*/

// ============================================================================
// NIVEL MEDIO (PASOS 4-7)
// ============================================================================

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 4: Agregar botón "Me gusta" en cada tarjeta                           │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. En el Card de cada imagen, agrega un IconButton:                        │
│    - Icon: Icons.favorite (cuando megusta=true) o Icons.favorite_border    │
│    - Color: rojo (Colors.red) si megusta=true, gris si es false            │
│    - onPressed: actualiza el estado de megusta para ese elemento           │
│                                                                             │
│ 2. Usa un Row para posicionar el IconButton en la esquina inferior derecha │
│ 3. El IconButton debe cambiar de ícono y color inmediatamente              │
│                                                                             │
│ RESULTADO ESPERADO: Botón funcional que cambia de estado                   │
│ DIFICULTAD: ⭐⭐⭐                                                        │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 5: Mostrar SnackBar cuando se hace clic en "Me gusta"                │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Dentro del onPressed del IconButton, agrega un ScaffoldMessenger        │
│ 2. Muestra un SnackBar con:                                                 │
│    - Content: Texto personalizado ("❤️ {titulo} te encanta" o similar)    │
│    - backgroundColor: Colors.red[400]                                      │
│    - duration: 2 segundos                                                   │
│                                                                             │
│ 3. El mensaje debe cambiar según el estado de megusta (agregar o quitar)   │
│                                                                             │
│ RESULTADO ESPERADO: SnackBar que aparece al hacer clic                     │
│ DIFICULTAD: ⭐⭐⭐                                                        │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 6: Agregar botón "Ver detalles" en cada tarjeta                       │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Agrega un ElevatedButton en cada Card con texto "Ver Detalles"          │
│ 2. Posiciónalo en la parte inferior izquierda (usa Row)                    │
│ 3. Al hacer clic:                                                           │
│    - Cambia el color del botón brevemente (visual feedback)                │
│    - Muestra un SnackBar diferente: "Mostrando detalles de {titulo}"       │
│    - backgroundColor: Colors.blue[400]                                     │
│ 4. El button debe tener un icon Icons.info                                 │
│                                                                             │
│ RESULTADO ESPERADO: Botón funcional con feedback visual                    │
│ DIFICULTAD: ⭐⭐⭐                                                        │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 7: Crear un contador de "Me gusta" en el AppBar                       │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. En el AppBar, agrega un Badge o contador que muestre:                   │
│    - Cantidad total de "Me gusta" en todas las imágenes                    │
│    - Actualízalo dinámicamente cada vez que se presiona el corazón         │
│                                                                             │
│ 2. El contador debe estar en la esquina derecha del AppBar                 │
│ 3. Usa un CircleAvatar o Badge para hacerlo visual                         │
│ 4. Color rojo con número blanco                                            │
│                                                                             │
│ RESULTADO ESPERADO: Contador dinámico en el AppBar                         │
│ DIFICULTAD: ⭐⭐⭐⭐                                                      │
└─────────────────────────────────────────────────────────────────────────────┘
*/

// ============================================================================
// NIVEL AVANZADO (PASOS 8-10)
// ============================================================================

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 8: Agregar filtro "Mostrar solo favoritos"                            │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Crea una variable booleana llamada mostrarSoloFavoritos (por defecto false)
│                                                                             │
│ 2. En el AppBar, agrega un IconButton que alterne este booleano:           │
│    - Icon: Icons.filter_list                                               │
│    - Color cambia según estado (azul si activo, gris si inactivo)          │
│                                                                             │
│ 3. Filtra el ListView para mostrar:                                         │
│    - Todas las imágenes si mostrarSoloFavoritos = false                    │
│    - Solo las que tienen megusta = true si está activo                     │
│                                                                             │
│ 4. Muestra un SnackBar cuando se activa/desactiva el filtro                │
│                                                                             │
│ RESULTADO ESPERADO: Filtro funcional que muestra/oculta favoritos          │
│ DIFICULTAD: ⭐⭐⭐⭐                                                      │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 9: Agregar animación al hacer clic en "Me gusta"                      │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Convierte GaleriaPage en StatefulWidget si aún no lo es                 │
│ 2. Agrega un AnimatedBuilder o ScaleTransition al IconButton:              │
│    - Cuando se presiona, el corazón debe crecer/encogerse brevemente       │
│    - Duración: 300 milisegundos                                            │
│                                                                             │
│ 3. Alternative: usa un Transform.scale en el IconButton                    │
│ 4. Usa setState() para controlar la animación                              │
│                                                                             │
│ RESULTADO ESPERADO: Efectos visuales de animación                          │
│ DIFICULTAD: ⭐⭐⭐⭐⭐                                                    │
└─────────────────────────────────────────────────────────────────────────────┘
*/

/*
┌─────────────────────────────────────────────────────────────────────────────┐
│ PASO 10: Agregar diálogo para editar descripción (DESAFÍO FINAL)           │
├─────────────────────────────────────────────────────────────────────────────┤
│ INSTRUCCIONES:                                                              │
│                                                                             │
│ 1. Agrega un IconButton Icons.edit en cada Card                            │
│ 2. Al hacer clic, abre un AlertDialog que contenga:                        │
│    - Título: "Editar descripción de {titulo}"                              │
│    - TextField con la descripción actual                                   │
│    - Botones: "Cancelar" y "Guardar"                                       │
│                                                                             │
│ 3. Si el usuario presiona "Guardar":                                       │
│    - Actualiza la descripción en el objeto ImagenItem                      │
│    - Cierra el diálogo                                                     │
│    - Muestra SnackBar: "✏️ Descripción actualizada"                        │
│                                                                             │
│ 4. Si presiona "Cancelar", solo cierra el diálogo                          │
│ 5. La UI debe actualizar automáticamente con la nueva descripción          │
│                                                                             │
│ RESULTADO ESPERADO: Diálogo funcional que permite edición                  │
│ DIFICULTAD: ⭐⭐⭐⭐⭐                                                    │
│                                                                             │
│ BONUS: Persiste los cambios usando SharedPreferences                       │
└─────────────────────────────────────────────────────────────────────────────┘
*/

// ============================================================================
// CHECKLIST DE VALIDACIÓN
// ============================================================================

/*
Al terminar, verifica que tu app tenga:

✓ Paso 1-3: Estructura básica + ListView + Cards con imágenes
✓ Paso 4-7: Botones "Me gusta" + SnackBars + Contador en AppBar
✓ Paso 8:   Filtro de favoritos funcional
✓ Paso 9:   Animación en el corazón
✓ Paso 10:  Diálogo para editar descripción

REQUISITOS DE CALIDAD:
  • El código debe ser limpio y bien comentado
  • Debe usar MaterialDesign 3
  • Sin errores consola
  • Interfaz responsiva
  • Feedback visual en todas las acciones
*/

// ============================================================================
// NOTA PARA ESTUDIANTES
// ============================================================================

/*
REFERENCIAS ÚTILES:
  - Revisa my_images2.dart para formas de mostrar imágenes
  - Revisa my_scaffold.dart para estructura de Scaffold
  - Revisa my_snackbar.dart para implementar SnackBars
  
PISTAS:
  - Usa setState() después de modificar datos en la lista
  - Los ListTile y Card son perfectos para layouts en ListView
  - ScaffoldMessenger.of(context).showSnackBar() es la forma moderna
  - AnimatedBuilder o Transform para animaciones simples

¡DIVIÉRTETE CREANDO! 🎨
*/
