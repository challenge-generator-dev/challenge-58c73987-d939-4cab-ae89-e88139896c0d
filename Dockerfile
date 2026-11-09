# Etapa de construcción - Build stage
FROM eclipse-temurin:17-jdk-alpine AS builder

# Instalar herramientas necesarias para build
RUN apk add --no-cache \
    maven \
    git \
    curl

# Configurar directorio de trabajo
WORKDIR /build

# Copiar primero el POM para aprovechar caché de capas
COPY pom.xml .

# Descargar dependencias
RUN mvn dependency:go-offline -B

# Copiar código fuente
COPY src ./src

# Compilar la aplicación
RUN mvn clean package -DskipTests -B

# Etapa de ejecución - Runtime stage
FROM eclipse-temurin:17-jre-alpine

# Instalar runtime necesario para la aplicación
RUN apk add --no-cache \
    curl \
    ncurses \
    bash

# Crear usuario no root para seguridad
RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

# Crear directorio para la aplicación
RUN mkdir -p /app && \
    chown -R appuser:appgroup /app

# Cambiar a directorio de trabajo
WORKDIR /app

# Copiar el JAR construido desde la etapa de build
COPY --from=builder /build/target/notifications-service-*.jar app.jar

# Establecer permisos
RUN chown -R appuser:appgroup /app

# Cambiar a usuario no root
USER appuser

# Variables de entorno para configuración
ENV JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -Djava.security.egd=file:/dev/./urandom"
ENV SERVER_PORT=8080
ENV SPRING_PROFILES_ACTIVE=prod

# Exponer puertos
EXPOSE 8080 8081

# Healthcheck para verificar que la aplicación está corriendo
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8081/actuator/health || exit 1

# Etiquetas de metadatos
LABEL maintainer="devops@fintech.company"
LABEL version="1.0.0"
LABEL description="Servicio de notificaciones para la plataforma fintech"

# Punto de entrada con JavaOpts configurables
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]