# lab10 — Clon de HBO Max en Flutter

Réplica responsive de la interfaz de **HBO Max (Perú)** hecha con **Flutter**, con
vista para **escritorio (web)** y **móvil**. Incluye 3 tipografías, imágenes propias
y la documentación del proyecto en PDF dentro de la carpeta [`doc/`](doc/).

> Para analizar la estructura, colores y tipografías de la página original se hizo
> un *scraping* de referencia; las imágenes con derechos de autor se reemplazaron
> por recursos propios para que el proyecto sea libre de usar.

---

## 📂 Estructura del proyecto

```
lib/
 ├─ main.dart                # punto de entrada
 └─ src/
    ├─ theme/                # colores, tema oscuro y tipografías
    ├─ responsive/           # puntos de quiebre (escritorio / tablet / móvil)
    ├─ models/               # objetos de datos (planes, pósters, géneros, FAQ)
    ├─ data/                 # contenido estático
    ├─ widgets/              # cada sección como componente aislado
    └─ screens/              # pantalla principal que arma todo
assets/
 ├─ fonts/                   # Anton, Bebas Neue, Poppins
 └─ images/                  # imágenes propias
doc/                         # documentación en PDF + capturas
```

---

## ✅ Requisitos previos

Necesitas tener instalado en tu equipo:

1. **Flutter SDK** (probado con la versión **3.44.0**, canal *stable*).
   Descárgalo desde 👉 https://docs.flutter.dev/get-started/install
2. **Git** — https://git-scm.com/downloads
3. Un destino para correr la app (elige al menos uno):
   - **Navegador** (Chrome / Brave / Edge) → la forma más rápida.
   - **Android**: Android Studio + un emulador o un celular con *Depuración USB*.
   - **Escritorio**: en Windows nativo, o en macOS con Xcode instalado.

Verifica que todo esté bien con:

```bash
flutter doctor
```

Las líneas con `[✓]` están listas. Para correr en navegador basta con que
`Flutter`, `Chrome` y `Connected device` aparezcan en verde.

---

## 🚀 Cómo iniciar el proyecto en otra PC, laptop o Mac

### 1. Clonar el repositorio

```bash
git clone https://github.com/Danoviel/lab10MP.git
cd lab10MP
```

### 2. Instalar las dependencias

```bash
flutter pub get
```

### 3. Ejecutar la aplicación

**Opción A — En el navegador (recomendada, sin instalar nada extra):**

```bash
flutter run -d chrome
```

> Si usas Brave o Edge, también funciona: `flutter run -d web-server` y abres la
> URL que muestra la terminal, o selecciona el navegador con `flutter devices`.

**Opción B — En un emulador o celular Android:**

```bash
flutter devices          # lista los dispositivos disponibles
flutter run              # corre en el dispositivo conectado
```

> ¿No aparece ningún dispositivo Android? Abre **Android Studio → Device Manager**
> y crea/inicia un emulador, o conecta tu celular con *Depuración USB* activada.

**Opción C — Como app de escritorio:**

```bash
flutter run -d windows   # en Windows
flutter run -d macos     # en macOS (requiere Xcode)
flutter run -d linux     # en Linux
```

---

## 🔥 Comandos útiles durante el desarrollo

Mientras `flutter run` está activo, en la terminal puedes presionar:

| Tecla | Acción |
|-------|--------|
| `r`   | Hot reload (aplica cambios al instante) |
| `R`   | Hot restart (reinicia la app) |
| `q`   | Salir |

Otros comandos:

```bash
flutter analyze          # revisa el código en busca de problemas
flutter test             # corre las pruebas
flutter build web        # compila la versión web (queda en build/web)
flutter build apk        # genera el APK de Android
```

---

## 📱 Ver la vista móvil sin emulador

Corre la app en el navegador (`flutter run -d chrome`), abre las **DevTools**
(`F12` o `Cmd+Option+I` en Mac) y activa el **modo dispositivo**
(`Ctrl+Shift+M` / `Cmd+Shift+M`). Elige un iPhone o Pixel y verás el layout móvil
(menú hamburguesa, tarjetas en una columna, etc.).

---

## 🛠️ Tecnologías

- **Flutter** (Dart) con **Material 3**
- Diseño **responsive** con puntos de quiebre propios
- Tipografías: **Anton**, **Bebas Neue**, **Poppins** (licencias OFL / Apache)
- Arquitectura por capas (theme · responsive · models · data · widgets · screens)

---

## 📄 Documentación

La explicación completa de cada sección, con capturas de escritorio y móvil, está en:

```
doc/Documentacion-HBOMax-Clon.pdf
```
