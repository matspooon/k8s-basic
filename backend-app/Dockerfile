# 빌드 캐시 최적화를 위해 의존성 캐시 분리
# 1. 빌드
FROM eclipse-temurin:17-jdk AS builder
WORKDIR /app

# 2. 의존성 먼저 캐싱
COPY settings.gradle gradlew ./app/build.gradle ./
COPY gradle gradle
RUN ./gradlew dependencies --no-daemon || return 0

# 3. 소스 복사 및 빌드
COPY . .
RUN ./gradlew bootJar --no-daemon

# 4. 런타임 (Distroless)
FROM gcr.io/distroless/java17:nonroot
WORKDIR /app
COPY --from=builder /app/app/build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
