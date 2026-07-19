# Aero Fighters en PSeInt ✈️

Un juego de arcade tipo "shoot 'em up" recreado en pseudocódigo, diseñado para correr en [PSeInt](http://pseint.sourceforge.net/), el software educativo para aprender lógica de programación.

> **Versión actual: v1** — Primera versión jugable. El proyecto sigue en desarrollo, con la idea de ir sumando funciones con el tiempo.

## 🎮 Descripción

Controlas una nave que se mueve en la fila inferior de un mapa de 12x9, esquivando obstáculos (`+`) que caen desde arriba. Cada obstáculo esquivado suma puntos, y de vez en cuando aparecen power-ups:

- **R** → Rayo láser: dispara en 3 columnas a la vez.
- **B** → Bomba: explota en un área de 3x3 alrededor del impacto.

El objetivo es acumular **500 puntos** antes de que algún obstáculo llegue a tu fila.

## 🕹️ Controles

| Tecla | Acción |
|-------|--------|
| `a` | Mover a la izquierda |
| `d` | Mover a la derecha |
| `w` | Disparar / avanzar turno |

## ▶️ Cómo ejecutarlo

1. Descargá e instalá [PSeInt](http://pseint.sourceforge.net/).
2. Abrí el archivo `AeroFightersV1.psc` desde PSeInt.
3. Activá la opción de **usar PSeInt en estricto** (Configurar → Editor → Utilizar los patrones del "Modo Estricto"), ya que el código está escrito bajo esas reglas de sintaxis.
4. Ejecutá el algoritmo (`F2` o el botón de Run).
5. Presioná cualquier tecla en el menú de inicio para comenzar a jugar.
