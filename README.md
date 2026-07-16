# Paradigmas de la Programación (Curso 2025/2026)

Este repositorio contiene las soluciones a los ejercicios prácticos de la asignatura **Paradigmas de la Programación**, realizados durante el curso académico **2025/2026**. 

La asignatura se centra principalmente en el desarrollo de la lógica de programación utilizando el paradigma funcional mediante el lenguaje **OCaml**.

---

## Calificaciones & Estado del Trabajo

A continuación se muestra el desglose del estado y la puntuación de cada una de las prácticas y entregas competitivas.

### Resumen de Calificaciones de Prácticas
* **Prácticas Ordinarias y Asistencia:** `2.00 / 2.00` **(Puntuación Máxima)**
* **Prácticas Competitivas:** `1.80 / 2.00`
  *  *Práctica Competitiva 1:* `0.8 / 0.8` (`tribo.ml`)
  *  *Práctica Competitiva 2:* `1.0 / 1.2` (`ajedrez.ml`) — *Nota: El algoritmo funciona correctamente pero presenta oportunidades de optimización de eficiencia.*

---

## Desglose de Prácticas

>  *Los códigos que se encuentran marcados con tareas pendientes (`NC` / `TI` / Errores) están en proceso de revisión y optimización.*

| Práctica | Archivo | Calificación | Estado / Comentarios |
| :--- | :--- | :---: | :--- |
| **Práctica 1** | `nombre.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `pi.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `expr.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `e.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 2** | `frases.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 3** | `def.ml` | **8 / 10** | <kbd> Optimizar</kbd> |
| | `def_a.ml` | **8 / 10** | <kbd> Optimizar</kbd> |
| | `funciones.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `frases_2.ml` | **0 / 10** | <kbd> Error</kbd> No corresponde el nombre con `frases.ml` (pendiente renombrar) |
| | `if_then_else` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 4** | `collatz.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `collatz_plus.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `mcd.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `mcd_plus.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 5** | `fibto.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `fast_fibto.ml` | **10 / 10** | <kbd> Completado</kbd> (Fibonacci optimizado) |
| | `strg.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 6** | `hanoi.ml` | **7 / 10** | <kbd> Optimizar</kbd> |
| | `prime.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `ej65.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 7** | `fact.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `myList.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 8** | `folding.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `listing.ml` | **10 / 10** | <kbd> Completado</kbd> |
| **Práctica 9** | `concat.ml` | **7 / 10** | <kbd> Optimizar</kbd> |
| | `tail.ml` | **10 / 10** | <kbd> Completado</kbd> (*Tail Recursion*) |
| | `tail2.ml` | **7 / 10** | <kbd> Optimizar</kbd> |
| **Práctica 10**| `tour.ml` | **7 / 10** | <kbd> Optimizar</kbd> |
| | `shortest.ml` | *Pendiente* | <kbd> NC</kbd> No calificado (para arreglar) |
| **Práctica 11**| `binTree.ml` | *Pendiente* | <kbd> TI</kbd> Tipos incorrectos, a cambiar |
| | `stBinTree.ml`| *Pendiente* | <kbd> NC</kbd> No calificado (a cambiar) |
| | `gTree.ml` | *Pendiente* | <kbd> NC</kbd> No calificado (a cambiar) |
| | `bst.ml` | *Pendiente* | <kbd> NC</kbd> No calificado (a cambiar) |
| **Práctica 12**| `simpleC.ml` | **10 / 10** | <kbd> Completado</kbd> |
| | `aTree.ml` | *Pendiente* | <kbd> NC</kbd> No calificado (para arreglar) |
| | `bq.ml` | *Pendiente* | <kbd> NC</kbd> No calificado (para arreglar) |

### Leyenda de Estados
* <kbd> Completado</kbd> : Ejercicio terminado con la máxima puntuación.
* <kbd> Optimizar</kbd> : Solución válida pero mejorable en estilo o eficiencia.
* <kbd> Error</kbd> : Error formal o administrativo (ej. mal renombrado).
* <kbd> TI</kbd> : Tipos incorrectos (*Type Error*).
* <kbd> NC</kbd> : No calificado, pendiente de implementación o corrección.

---

## Notas de Dependencias

<details>
<summary><b> Ver detalles de dependencias (Práctica 12)</b></summary>

En la **Práctica 12**, para poder compilar y ejecutar correctamente el archivo `aTree.ml`, es necesario tener implementado y guardado en el mismo directorio de trabajo el archivo **`binTree.ml`**.
</details>

---

## Próximos Pasos (Roadmap)
- [ ] Corregir nombres en `frases_2.ml` para solucionar el conflicto.
- [ ] Solucionar el error de tipos en `binTree.ml`.
- [ ] Completar los archivos marcados como **NC** (`shortest.ml`, `stBinTree.ml`, `gTree.ml`, `bst.ml`, `aTree.ml` y `bq.ml`).
- [ ] Optimizar la complejidad temporal de `ajedrez.ml` (prácticas competitivas).

---
*Este repositorio es de uso personal y académico. Las soluciones se irán actualizando y optimizando a lo largo del tiempo.*
