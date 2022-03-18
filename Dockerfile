FROM openjdk:8

ADD target/javaexpress-springboot-docker.jar javaexpress-springboot-docker.jar

EXPOSE 8089

ENTRYPOINT ["java","-jar","javaexpress-springboot-docker.jar"]