FROM openjdk:17-jdk-slim
WORKDIR /devops-project-simple-hello-world.java
COPY . .
RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*
RUN mvn clean package
CMD ["java", "-jar", "hello-world.jar"]



