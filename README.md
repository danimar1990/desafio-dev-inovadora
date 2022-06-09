# About this project
Build an API that queries cat breeds. To populate database must use TheCatAPI (https://thecatapi.com/).
The only endpoint that must implement is “/breeds”, the query key can acquire through from the API website.

## Local setup

- First of all, certificate with you have Docker installed and initialized
- Clone this repo
- Access the project root in your terminal
- Prepare environment, for dev version you can use the example environment:
```
cp env-example .env
```
- Create the postgres and redis volumes:
```
docker volume create --name postgres
docker volume create --name redis
```
- Build images and up the containers:
```
docker compose up --build
```
- After all container are up, an arror has ocurred in console related with database, ignore it and press ctrl + c to interrup the execution
- Drop, create and migrate a database:
```
docker run -it rails-app db:migrate:reset
```
- Run again:
```
docker compose up
```
- All done. The docker containers are up and working fine now!
- In your browser acccess:
[localhost:8020](http://localhost:8020/)

## Tests
[![Run in Postman](https://run.pstmn.io/button.svg)](https://god.gw.postman.com/run-collection/21179271-2308b322-429c-41ce-89d4-06794651a3ac?action=collection%2Ffork&collection-url=entityId%3D21179271-2308b322-429c-41ce-89d4-06794651a3ac%26entityType%3Dcollection%26workspaceId%3D34abeb11-f3a1-4a25-840e-3ce74a418776#?env%5BThe%20Cat%20API%20-%20Localhost%5D=W3sia2V5IjoiZW5kcG9pbnQiLCJ2YWx1ZSI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAyMCIsImVuYWJsZWQiOnRydWUsInNlc3Npb25WYWx1ZSI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAyMCIsInNlc3Npb25JbmRleCI6MH0seyJrZXkiOiJZT1VSLUFQSS1LRVkiLCJ2YWx1ZSI6IjcwYTJiNTUzLTU4NjEtNGVkYi1hYjQ0LTBlM2Q4NGNjNDQ2NSIsImVuYWJsZWQiOnRydWUsInNlc3Npb25WYWx1ZSI6IjcwYTJiNTUzLTU4NjEtNGVkYi1hYjQ0LTBlM2Q4NGNjNDQ2NSIsInNlc3Npb25JbmRleCI6MX1d)

## Tecnologies

### Backend
- Ruby 3 on Rails 7 with --API only

### Frontend
- Not implemented yet

## Tools
- Linux Ubuntu (Windows have some problems with map directories)
- Git and Github
- Docker with Portainer
- VSCode
- DBeaver
- Postman
- [Swagger](https://app.swaggerhub.com/apis/danimar1990/desafio-dev-inovadora-danimar/1.0#/)
