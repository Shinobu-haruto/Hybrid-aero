# HybridAero -- Installation Guide

Este documento describe el proceso de instalación recomendado para
**HybridAero** y los requisitos necesarios para obtener una experiencia
visual fiel al estilo **Aero / Desktop Window Manager (DWM)**.

HybridAero puede utilizarse como un tema GTK estándar, pero algunas
características visuales dependen del compositor.

------------------------------------------------------------------------

## 📦 Requisitos del sistema

### Entorno de escritorio

-   **Cinnamon** (recomendado)
-   Otros entornos GTK son compatibles, pero pueden presentar
    variaciones visuales.

### Toolkits

-   **GTK 3.0** (obligatorio)
-   **GTK 4.0** (opcional, soporte en progreso)

------------------------------------------------------------------------

## 🎨 Instalación del tema

1.  Crear el directorio de temas (si no existe):

``` bash
mkdir -p ~/.themes
```

2.  Copiar el directorio del tema:

``` bash
cp -r HybridAero ~/.themes/
```

3.  Activar el tema:

-   Abrir **Configuración del sistema**
-   Ir a **Temas**
-   Seleccionar **HybridAero** en "Controles"

------------------------------------------------------------------------

## 🧩 Capa de composición (opcional pero recomendada)

Para reproducir correctamente los efectos de **Aero Glass**, se
recomienda utilizar un compositor compatible.

### Compositor recomendado: Picom

HybridAero incluye una configuración sugerida ubicada en:

    gtk-3.0/patch/picom.conf

Esta configuración está ajustada para: - Desenfoque suave tipo Aero -
Transparencias jerárquicas - Sincronización vertical - Esquinas
suavemente redondeadas

------------------------------------------------------------------------

## ⚙️ Instalación de Picom

1.  Instalar Picom desde los repositorios:

``` bash
sudo apt install picom
```

2.  Copiar la configuración recomendada:

``` bash
mkdir -p ~/.config/picom
cp ~/.themes/HybridAero/gtk-3.0/patch/picom.conf ~/.config/picom/picom.conf
```

3.  Iniciar Picom (o reiniciar la sesión):

``` bash
picom --experimental-backends &
```

En Cinnamon, Picom puede configurarse para iniciar automáticamente.

------------------------------------------------------------------------

## ⚠️ Notas importantes

-   El uso de Picom es **opcional**.
-   Sin compositor, HybridAero funcionará correctamente, pero sin blur
    ni transparencias.
-   Los valores incluidos priorizan **estabilidad** y **fidelidad
    visual** sobre efectos modernos exagerados.
-   Se recomienda backend **GLX** para una experiencia más cercana a
    DWM.

------------------------------------------------------------------------

## 🧠 Filosofía de instalación

HybridAero sigue una separación clara de responsabilidades:

-   Tema GTK → controles y estilo base
-   Configuración del sistema → tipografía y colores
-   Compositor → profundidad, blur y composición

La instalación respeta esta separación y permite activar cada capa de
forma independiente.

------------------------------------------------------------------------

## ✅ Verificación

Después de la instalación: - Los headerbars deben mostrar gradientes
suaves. - Las ventanas activas deben presentar blur (si Picom está
activo). - Los botones de ventana deben coincidir con el estilo clásico
de Aero.

Si estos elementos están presentes, HybridAero está funcionando
correctamente.
