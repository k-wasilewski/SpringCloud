# SpringCloud - Configuration Server + Discovery Server + Gateway Server + REST API Clients

A cloud application, managing microservices.

### Configuration Server
Provides, manages and centralizes the configuration to externalize the configuration of different modules; via GIT repository.

Also, it supports symmetric encryption/decryption of passwords.

### Discovery Server
Enables services to find each other without hard-coding hostname and port. It acts as EurekaServer and is secured.

### Gateway Server
Acts as proxy and hides complexity of the app by providing all client APIs on one port, via Zuul routes. It provides security
for all clients and stores the authorization credentials in session.

### 'Book-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides
comprehensive tests with REST Assured API.

### 'Rating-service' Client
Provides REST API for CRUD operations on database entities and is accessible through Gateway, by service name. It also provides
comprehensive tests with REST Assured API.

### Client
Provides REST API for a simple client, accessing decrypted passwords at Configuration Server.
