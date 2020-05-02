# SpringCloud - Configuration Server + Discovery Server + Gateway Server + REST API Clients + Hibernate + Kafka broker + Spring Cloud Tasks via SCDF + REST Assured + Docker

A cloud application, managing microservices.

If you want to deploy all of the services locally - change all services' hosts (inside application.properties or bootstrap.properties) to 'localhost'.

### Configuration Server
Provides, manages and centralizes the configuration to externalize the configuration of different modules; via GIT repository.

Also, it supports symmetric encryption/decryption of passwords.

### Discovery Server
Enables services to find each other without hard-coding hostname and port. It acts as EurekaServer and is secured.

### Gateway Server
Acts as proxy and hides complexity of the app by providing all client APIs on one port, via Zuul routes. It provides security
for all clients and stores the authorization credentials in session. It also exposes Tasks' endpoints.

### 'Book-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides Kafka messaging for logging CRUD operations and comprehensive tests with REST Assured API.

### 'Rating-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides Kafka messaging for logging CRUD operations and comprehensive tests with REST Assured API.

### Spring Cloud Data Flow
A Spring Cloud Data Flow, after registering Tasks (see: individual tasks) launches particular Spring Boot Apps as Spring Cloud Tasks.

### Task_db
A Spring Cloud Task, accessed through gateway server (particularly: via SCDF server). It generates a book-service logged operations' history log file.

1. mvn install
2. Registering at SCDF: http://localhost:9393/dashboard -> Apps/Register application -> Name: task_db, Type: Task, URI: maven://com.springcloud:task_db:0.0.1-SNAPSHOT -> Tasks/Create task -> start-task_db-end -> Create -> Composed task name: wrapper-task_db 

### Task_db2
A Spring Cloud Task, accessed through gateway server (particularly: via SCDF server). It generates a rating-service logged operations' history log file.

1. mvn install
2. Registering at SCDF: http://localhost:9393/dashboard -> Apps/Register application -> Name: task_db2, Type: Task, URI: maven://com.springcloud:task_db2:0.0.1-SNAPSHOT -> Tasks/Create task -> start-task_db2-end -> Create -> Composed task name: wrapper-task_db2

### Task_db3
A Spring Cloud Task, accessed through gateway server (particularly: via SCDF server). It accepts multipart .sql dump file upload and updates the database.

1. mvn install
2. Registering at SCDF: http://localhost:9393/dashboard -> Apps/Register application -> Name: task_db3, Type: Task, URI: maven://com.springcloud:task_db3:0.0.1-SNAPSHOT -> Tasks/Create task -> start-task_db3-end -> Create -> Composed task name: wrapper-task_db3

### Redis server
docker run --name dataflow-redis -p 6379:6379 -d redis

### Apache Kafka
https://www.apache.org/dyn/closer.cgi?path=/kafka/2.5.0/kafka_2.12-2.5.0.tgz<br />
<br />
tar -xzf kafka_2.12-2.5.0.tgz<br />
cd kafka_2.12-2.5.0<br />
bin/zookeeper-server-start.sh config/zookeeper.properties<br />
bin/kafka-server-start.sh config/server.properties<br />

### Database
docker run --name dataflow-mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=cloud -p 3306:3306 -d mysql:5.7

### Spring Cloud Data Flow server
https://repo.spring.io/libs-release/org/springframework/cloud/spring-cloud-dataflow-server-local/1.3.0.RELEASE/spring-cloud-dataflow-server-local-1.3.0.RELEASE.jar

java -jar spring-cloud-dataflow-server-local-1.3.0.RELEASE.jar --spring.datasource.url=jdbc:mysql://localhost:3307/cloud --spring.datasource.username=root --spring.datasource.password=root --spring.datasource.driver-class-name=org.mariadb.jdbc.Driver

### Client
Provides REST API for a simple client, accessing decrypted passwords at Configuration Server.

### docker-compose
Alternatively, you can:
- package all services;
- build Dockerfile images ('server', 'discovery', 'gateway', 'books', 'ratings', 'client', 'scdf');
- run docker-compose up;
- install the tasks locally and register them at SCDF.
