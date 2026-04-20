# MU0 Processor Dinosaur Game

Designed core MU0 processor components and deployed dinosaur game in MU0 Assembly on FPGA, verifying functionality via testbenches and simulations

## Overview

The player controls a dinosaur displayed on a 7-segment display and must dodge 10 incoming boxes. Successfully dodging all 10 boxes wins the game; a collision ends it immediately.

## How to Play

1. **Start** — Press button 1 to begin. The display shows `-START` while waiting.
2. **Countdown** — A 3-2-1 countdown appears on digit 0 before boxes start moving.
3. **Dodge** — Use the keypad to move the dinosaur:
   - Press **1** to move the dinosaur **up**
   - Press **2** (or no input) to move the dinosaur **down**
4. **Boxes** — Each box moves across the 6-digit display from right (digit 0) to left (digit 5), where the dinosaur sits. Boxes alternate between upper and lower positions across the 10 rounds.
5. **Win/Lose** — Dodge all 10 boxes to win; collide with any box to lose.
6. **Restart** — Press button 2 at the end screen to restart from the beginning.

## Display Layout

| Display | Purpose |
|---------|---------|
| digit5 (`&0FFA`) | Dinosaur position (leftmost) |
| digit4-digit1 | Box in transit |
| digit0 (`&0FF5`) | Incoming box spawn point (rightmost) |

The dinosaur has two positions:
- **Down** — segments show lower pattern (`0b000000000000100`)
- **Up** — segments show upper pattern (`0b000000000000010`)

## End States

| Outcome | Display | Traffic Lights |
|---------|---------|---------------|
| Win | `--Win-` | Green |
| Lose | `LOSE-<score>` | Red |

The lose screen shows the player's score (number of boxes successfully dodged, 0-9) on digit 1.

## Hardware I/O

| Address | Device |
|---------|--------|
| `&0FF0` | Buttons (start/restart) |
| `&0FF2` | Keypad (dino movement) |
| `&0FFF` | Traffic lights (win/lose indicator) |
| `&0FF5`-`&0FFA` | 7-segment digits 0-5 |

## Project Structure

| Location | Description |
|----------|-------------|
| `src/ex3/` | MU0 processor source code (hardware components) |
| `MU0 Code/lab4.s` | MU0 assembly source code for the dinosaur game |
| `lab4.s.kmd` | Full game source (assembled) |
| `exercise4.s` | Partial/earlier exercise version |
| `exercise4.s.kmd` | Assembled output for exercise 4 |

## Module

COMP12111 Fundamentals of Computer Engineering — Lab 4  
University of Manchester, December 2025  
Author: Ern Qi Teng
