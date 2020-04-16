# SpringCloud - Configuration Server + Discovery Server + Gateway Server + REST API Clients + Kafka broker + Spring Cloud Tasks via SCDF

A cloud application, managing microservices.

### Configuration Server
Provides, manages and centralizes the configuration to externalize the configuration of different modules; via GIT repository.

Also, it supports symmetric encryption/decryption of passwords.

### Discovery Server
Enables services to find each other without hard-coding hostname and port. It acts as EurekaServer and is secured.

### Gateway Server
Acts as proxy and hides complexity of the app by providing all client APIs on one port, via Zuul routes. It provides security
for all clients and stores the authorization credentials in session. It also exposes Tasks' endpoints.

### 'Book-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides
comprehensive tests with REST Assured API and Kafka messaging.

### 'Rating-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides
comprehensive tests with REST Assured API and Kafka messaging.

### Spring Cloud Data Flow
A Spring Cloud Data Flow, after registering Tasks (see: individual tasks) launches particular Spring Boot Apps as Spring Cloud Tasks.

### Task_db
A Spring Cloud Task, accessed through gateway server (particularly: via SCDF server). It generates a book-service operations' history log file.

Registering at SCDF: http://localhost:9393/dashboard -> Apps/Register application -> Name: task_db, Type: Task, URI: maven://com.springcloud:task_db:0.0.1-SNAPSHOT -> Tasks/Create task -> start-task_db-end -> Create -> Composed task name: wrapper-task_db 

### Client
Provides REST API for a simple client, accessing decrypted passwords at Configuration Server.
