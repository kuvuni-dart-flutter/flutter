# 📁 Gestión de Imágenes - Assets

Este directorio contiene todas las imágenes utilizadas en los ejemplos educativos de Flutter.

## 📸 Imágenes Disponibles

Las siguientes imágenes están configuradas en `pubspec.yaml` y listas para usar:

| Archivo | Dimensiones | Uso | Formato |
|---------|------------|-----|---------|
| `logo.png` | 100×100 | Logos / Iconos | PNG |
| `avatar.png` | 150×150 | Avatares de usuario | PNG |
| `foto.png` | 300×300 | Fotografías / Imágenes de contenido | PNG |
| `perfil.png` | 200×200 | Imágenes de perfil | PNG |
| `producto.png` | 300×400 | Imágenes de productos | PNG |
| `fondo.png` | 400×200 | Imágenes de fondo | PNG |
| `banner.png` | 400×150 | Banners / Headers | PNG |
| `placeholder.png` | 50×50 | Imágenes de carga / placeholder | PNG |

## 🔧 Cómo Usar las Imágenes

### Opción 1: Image.asset() - Imágenes Locales

```dart
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)
```

### Opción 2: AssetImage() - Para Decoraciones

```dart
Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/banner.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### Opción 3: CircleAvatar - Avatares

```dart
CircleAvatar(
  radius: 50,
  backgroundImage: AssetImage('assets/images/avatar.png'),
)
```

## 📱 Configuración en pubspec.yaml

Las imágenes están registradas en `pubspec.yaml`:

```yaml
flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
```

## 🎯 Requisitos por Plataforma

### Android
- Las imágenes se copian automáticamente en los directorios `drawable*/`
- Flutter maneja automáticamente la resolución correcta
- Versiones soportadas: Android 5.0+ (API level 21+)

### iOS
- Las imágenes se incluyen en los Assets.xcassets
- Flutter utiliza automáticamente @1x/@2x/@3x cuando sea necesario
- Versiones soportadas: iOS 11.0+

### Web
- Las imágenes se publican en el directorio `web/assets/images/`
- Accesibles directamente desde rutas relativas

## 💡 Mejores Prácticas

1. **Nombres descriptivos**: Usa nombres que indiquen el propósito de la imagen
2. **Optimización**: Asegúrate de que las imágenes estén optimizadas (tamaño menor a 1MB idealmente)
3. **Formato PNG**: Úsalo para imágenes con transparencia y logos
4. **Formato JPG**: Úsalo para fotografías de alta calidad sin transparencia
5. **Versioning**: Mantén control de versiones de tus imágenes en Git

## 📚 Recursos Educativos

Para entender mejor cómo funciona la gestión de imágenes en Flutter, consulta:
- Documentación oficial: https://flutter.dev/docs/development/ui/assets-and-images
- Guía de pubspec.yaml: https://flutter.dev/docs/development/pubspec

## ✨ Próximos Pasos

1. Revisa el archivo `lib/widgets_basicos/my_images.dart` para ver ejemplos prácticos
2. Ejecuta la app y visualiza cómo se renderizan las imágenes
3. Experimenta modificando los parámetros (BoxFit, opacity, etc.)
4. Crear tus propias imágenes y agregarlas a este directorio

---
**Última actualización**: 8 de febrero de 2026
**Versión del proyecto**: Flutter 3.x+
