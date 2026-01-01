# HybridAero -- Aero Interface for GTK (EN DESARROLLO)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Shinobu-haruto/CoreUI)](https://github.com/Shinobu-haruto/Hybrid-aero/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/Shinobu-haruto/CoreUI)](https://github.com/Shinobu-haruto/Hybrid-aero/issues)
**HybridAero** es un proyecto de interfaz inspirado en **Windows Vista /
7 Aero**, diseñado para recrear la sensación visual del **Desktop Window
Manager (DWM)** dentro del ecosistema **GTK y Cinnamon**.

No es únicamente un tema visual: HybridAero organiza su estilo como una
**capa de composición**, separando fuente, color, controles, ventanas y
compositor, de forma similar a cómo Windows gestionaba su interfaz a
nivel de sistema.

Todos los recursos visuales han sido recreados o rediseñados para evitar
cualquier conflicto de copyright.

------------------------------------------------------------------------

## ✨ Características principales

-   Composición visual inspirada en **Aero Glass**.
-   Headerbars con gradiente, reflejo y jerarquía visual tipo DWM.
-   Botones, sliders, scrollbars y checkboxes estilo Windows 7.
-   Progressbar verde estilo **Aero Green**.
-   Botones de ventana personalizados (close, minimize, maximize).
-   Separación conceptual entre sistema, controles y aplicaciones.
-   Paleta de colores equilibrada con estética clásica.
-   Compatibilidad con Cinnamon y aplicaciones GTK.

------------------------------------------------------------------------

## 🌈 Compatibilidad

-   **GTK 3.0**
-   **GTK 4.0** (adaptación en progreso)
-   **Cinnamon** (panel, menú y applets)

------------------------------------------------------------------------

## 🖼️ Vista previa

![preview_theme.png](https://github.com/Shinobu-haruto/Hybrid-aero/blob/main/preview_theme.png)

------------------------------------------------------------------------

## 📁 Estructura del proyecto

    HybridAero/
     ├── gtk-3.0/
     │   ├── gtk.css
     │   ├── SYSTEM/
     │   │   ├── font.cfg
     │   │   ├── Color-scheme.cfg
     │   │   └── DWM.cfg
     │   ├── UI/
     │   │   ├── controls/
     │   │   ├── window/
     │   │   └── Explorer/
     │   ├── assets/
     │   └── patch/
     │       └── picom.conf
     │
     ├── gtk-4.0/
     │   └── (versión adaptada)
     │
     ├── cinnamon/
     │   └── (estilos para panel y menú)
     │
     ├── LICENSE
     └── README.md

------------------------------------------------------------------------

## 🧩 Patch Layer -- Desktop Composition

El directorio `patch/` contiene configuraciones **opcionales pero
recomendadas** que permiten una representación visual más fiel del
estilo **Aero / DWM** cuando se utiliza HybridAero.

Estos archivos **no forman parte directa del tema GTK**, sino que actúan
como una **capa de compatibilidad de composición**, similar a cómo el
Desktop Window Manager (DWM) trabajaba junto al sistema gráfico en
Windows.

------------------------------------------------------------------------

### 🪟 picom.conf -- Composición tipo DWM

El archivo `picom.conf` proporciona una configuración recomendada para
**Picom** que complementa HybridAero con:

-   Desenfoque tipo **Aero Glass** (blur suave, no acrílico moderno).
-   Sincronización vertical para animaciones estables.
-   Transparencias jerárquicas según el tipo de ventana.
-   Esquinas suavemente redondeadas, al estilo Windows 7.

El objetivo de este parche no es modificar el comportamiento del
sistema, sino **alinear el compositor con la jerarquía visual y
profundidad definidas por HybridAero**.

------------------------------------------------------------------------

### ⚙️ Funciones cubiertas por el parche

-   Renderizado de blur en ventanas activas.
-   Separación visual entre ventanas principales, shell y diálogos.
-   Profundidad visual sin efectos exagerados.
-   Apariencia consistente con el estilo DWM clásico.

------------------------------------------------------------------------

### ⚠️ Notas importantes

-   El contenido de `patch/` es **opcional**.
-   HybridAero funciona sin Picom, pero algunas características visuales
    (blur y transparencias) no estarán disponibles.
-   Los valores están ajustados para priorizar **estabilidad y fidelidad
    visual** sobre efectos llamativos.
-   Se recomienda utilizar Picom con backend **GLX**.

------------------------------------------------------------------------

### 🧠 Filosofía del parche

HybridAero no intenta emular Windows a nivel funcional.

El directorio `patch/` existe para reproducir la **separación de
responsabilidades** propia del diseño de Aero:

-   GTK → controles y widgets
-   Tema → identidad visual
-   DWM → composición de ventanas
-   Compositor → profundidad y efectos

Esta separación es intencional y forma parte del diseño del proyecto.

------------------------------------------------------------------------

## ⚙️ Instalación

``` bash
mkdir -p ~/.themes
cp -r HybridAero ~/.themes/
```

En Cinnamon: 1. Abrir **Temas** 2. Seleccionar **HybridAero** en
"Controles"

------------------------------------------------------------------------

## 🌐 Contribuir

Las contribuciones son bienvenidas, especialmente en: - Ajustes
visuales - Compatibilidad GTK 4 - Optimización de CSS - Nuevos assets
recreados

------------------------------------------------------------------------

## 📜 Licencia

Proyecto **inspirado** en Windows Aero.\
No se utilizan assets originales de Microsoft.

Licencia: **MIT**

------------------------------------------------------------------------

## ❤️ Autor

**Shinobu Haruto**\
Ilustrador digital y creador del proyecto.

------------------------------------------------------------------------

⭐ Si te gusta el proyecto, considera darle una estrella en GitHub.
