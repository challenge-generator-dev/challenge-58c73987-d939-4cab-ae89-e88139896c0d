# Implementación de Infraestructura como Código con Terraform y Escáner de Seguridad

El equipo de DevOps de una empresa de fintech necesita versionar la infraestructura del servicio de notificaciones utilizando Terraform. Además, se requiere integrar un escaneo de dependencias y de imágenes en el pipeline de CI/CD para asegurar la seguridad de la cadena de suministro. El servicio de notificaciones se comunica con un servicio externo que proporciona las notificaciones a los usuarios. El pipeline debe ser capaz de detectar y reportar cualquier vulnerabilidad en las dependencias y en las imágenes utilizadas.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo y seguridad de la cadena |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 10 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Definición y versionado de la infraestructura

**Objetivo:** Crear y versionar la infraestructura del servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Identificar los componentes de la infraestructura necesarios para el servicio de notificaciones.
- Crear los archivos de Terraform para definir la infraestructura.
- Versionar los archivos de Terraform en un repositorio de código.

**Entregable:** Archivos de Terraform que definen la infraestructura del servicio de notificaciones, versionados en un repositorio.

<details>
<summary>Pistas de conocimiento</summary>

- Conceptos básicos de Terraform y su sintaxis.
- Prácticas recomendadas para la gestión de la infraestructura como código.

</details>

### Fase 2: Integración de escaneo de dependencias y de imágenes

**Objetivo:** Integrar un escaneo de dependencias y de imágenes en el pipeline de CI/CD.

**Tiempo estimado:** 4 horas

**Instrucciones:**

- Identificar las herramientas necesarias para el escaneo de dependencias y de imágenes.
- Configurar el pipeline de CI/CD para integrar el escaneo.
- Establecer criterios de aceptación para el escaneo y reportar cualquier vulnerabilidad encontrada.

**Entregable:** Pipeline de CI/CD configurado para integrar el escaneo de dependencias y de imágenes, con criterios de aceptación establecidos.

<details>
<summary>Pistas de conocimiento</summary>

- Herramientas comunes para el escaneo de dependencias y de imágenes.
- Configuración de pipelines de CI/CD.

</details>

### Fase 3: Validación y optimización del pipeline

**Objetivo:** Validar y optimizar el pipeline de CI/CD para asegurar la eficiencia y la seguridad.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar el pipeline y validar que el escaneo de dependencias y de imágenes se realiza correctamente.
- Identificar y corregir cualquier vulnerabilidad encontrada.
- Optimizar el pipeline para mejorar la eficiencia y la seguridad.

**Entregable:** Pipeline de CI/CD validado y optimizado, con todas las vulnerabilidades corregidas.

<details>
<summary>Pistas de conocimiento</summary>

- Prácticas recomendadas para la optimización de pipelines de CI/CD.
- Métodos para la corrección de vulnerabilidades.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es la infraestructura como código y por qué es importante en DevOps?
- **paraQueSirve**: ¿Para qué sirve integrar un escaneo de dependencias y de imágenes en el pipeline de CI/CD?
- **comoSeUsa**: ¿Cómo se usa Terraform para definir y versionar la infraestructura?
- **erroresComunes**: ¿Cuáles son los errores comunes al integrar un escaneo de dependencias y de imágenes en el pipeline de CI/CD?
- **queDecisionesImplica**: ¿Qué decisiones implica la optimización del pipeline de CI/CD para mejorar la eficiencia y la seguridad?

## Criterios de Evaluacion

- Definición y versionado de la infraestructura utilizando Terraform.
- Integración de escaneo de dependencias y de imágenes en el pipeline de CI/CD.
- Validación y optimización del pipeline de CI/CD.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
