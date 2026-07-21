# Aero Fighters en PSeInt ✈️

Un juego de arcade tipo "shoot 'em up" recreado en pseudocódigo, diseñado para correr en [PSeInt](http://pseint.sourceforge.net/), el software educativo para aprender lógica de programación.

> **Versión actual: v2** — Segunda versión jugable. Se rediseñó el sistema de armas y power-ups respecto a la v1. El proyecto sigue en desarrollo; la próxima meta es agregar un jefe final (boss) como condición de victoria.

## 🎮 Descripción

Controlás una nave que se mueve en la fila inferior de un mapa de 12x9, esquivando obstáculos (`+`) que caen desde arriba. A diferencia de la v1, esta versión no usa sistema de puntaje ni condición de victoria todavía — el objetivo por ahora es sobrevivir el mayor tiempo posible.

A lo largo de la partida puede aparecer un power-up:

- **P** → Potenciador: sube de nivel tu disparo principal (hasta nivel 3). Si pasa tiempo sin recoger otro, el nivel va bajando de a poco.

## 🕹️ Controles

| Tecla | Acción |
|-------|--------|
| `a` | Mover a la izquierda |
| `d` | Mover a la derecha |
| `w` | Disparar (el tipo de disparo depende de tu nivel de potenciador) |
| `r` | Rayo láser: dispara en 3 columnas a la vez (con tiempo de recarga) |
| `b` | Bomba: explota en un área de 3x3 alrededor del impacto (con tiempo de recarga) |

### Niveles de disparo (`w`)

| Nivel | Efecto |
|-------|--------|
| 1 | Disparo simple, una columna |
| 2 | Disparo triple |
| 3 | Disparo perforador  |

## ▶️ Cómo ejecutarlo

1. Descargá e instalá [PSeInt](http://pseint.sourceforge.net/).
2. Abrí el archivo `AeroFightersV2.psc` desde PSeInt.
3. Activá la opción de **usar PSeInt en estricto** (Configurar → Editor → Utilizar los patrones del "Modo Estricto"), ya que el código está escrito bajo esas reglas de sintaxis.
4. Ejecutá el algoritmo (`F2` o el botón de Run).
5. Movete con `a`/`d` y disparás con `w`, `r` o `b` para avanzar cada turno.

## 🚧 Pendiente

- [ ] Sistema de puntaje
- [ ] Jefe final (boss) como condición de victoria
- [ ] Pantalla de inicio con instrucciones
