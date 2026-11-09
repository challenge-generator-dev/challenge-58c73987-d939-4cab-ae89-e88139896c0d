# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Implementación de Infraestructura como Código con Terraform y Escáner de Seguridad**.

| | |
|---|---|
| Tema | Infraestructura como codigo y seguridad de la cadena |
| Nivel | advanced-l2 |
| Chapter | DevSecOps |
| Especialidad | DevSecOps |
| Stack | HCL / Terraform |
| Patron arquitectonico | infraestructura como código con capas modulares y pipeline de CI/CD seguro |
| Tiempo estimado | 10 horas |

## Receta del stack

Esqueleto obligatorio:

- `azure-pipelines.yml o .github/workflows/*.yml con stages reales`
- `Dockerfile multi-stage`
- `.dockerignore`
- `main.tf, variables.tf y outputs.tf de Terraform en la raiz del proyecto`
- `environments/{env}/terraform.tfvars`
- `scripts/ con los scripts de build y healthcheck`
- `sonar-project.properties`

Trampas conocidas:

- `required_version` de Terraform va como RANGO (`>= 1.5`), nunca exacto: pineado, el proyecto no corre con otra version instalada.
- Los providers tambien con restriccion flexible (`~> 5.0`).
- El Dockerfile multi-stage necesita que la etapa final copie el artefacto de la etapa de build, no el codigo fuente.

Dependencias:

- hashicorp/aws ~> 5.0
- terraform >= 1.5
- trivy n/a
- owasp-dependency-check n/a
- sonarcloud n/a

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `docker build -t reto:local . && terraform init -backend=false && terraform validate` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `docker build -t reto:local . && terraform init -backend=false && terraform validate` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Definición y versionado de la infraestructura**: Archivos de Terraform que definen la infraestructura del servicio de notificaciones, versionados en un repositorio.
- **Fase 2 — Integración de escaneo de dependencias y de imágenes**: Pipeline de CI/CD configurado para integrar el escaneo de dependencias y de imágenes, con criterios de aceptación establecidos.
- **Fase 3 — Validación y optimización del pipeline**: Pipeline de CI/CD validado y optimizado, con todas las vulnerabilidades corregidas.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/notifications_service/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/notifications_service/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- [ ] `modules/notifications_service/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Lo que falta y tenes que completar

No se detectaron huecos: estan los archivos declarados, el boilerplate del stack y ninguna referencia quedo colgando. Igual corre el comando de verificacion — que los archivos existan no garantiza que compilen.

### Presentes (16)

- `variables.tf`
- `providers.tf`
- `modules/notifications_service/variables.tf`
- `main.tf`
- `outputs.tf`
- `Dockerfile`
- `.dockerignore`
- `modules/notifications_service/main.tf`
- `modules/notifications_service/outputs.tf`
- `environments/dev/terraform.tfvars`
- `environments/prod/terraform.tfvars`
- `.github/workflows/ci-cd-pipeline.yml`
- `scripts/build.sh`
- `scripts/healthcheck.sh`
- `sonar-project.properties`
- `README.md`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `modules/notifications_service`
- `environments/dev`
- `environments/prod`
- `scripts`
- `.github/workflows`

## Verificacion

```bash
docker build -t reto:local . && terraform init -backend=false && terraform validate
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **infraestructura como código con capas modulares y pipeline de CI/CD seguro**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Perfil: Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced
- Brecha que el reto ataca: Utiliza infraestructura como codigo e integra escaneo de dependencias y de imagenes en el pipeline
- Mision: Versionar la infraestructura del servicio de notificaciones

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
