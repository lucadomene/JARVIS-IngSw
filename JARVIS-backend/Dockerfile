FROM gradle:jdk21

WORKDIR /app

COPY . .

RUN ./gradlew build -x test

RUN cp /app/build/libs/backend-0.0.1-SNAPSHOT.jar /app.jar

CMD sleep 10; java -jar /app.jar
