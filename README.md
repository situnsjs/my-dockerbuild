# Go app Docker Deployment Demo
This is just PoC

## Use Multi-stage builds
we can build our application in a docker alpine image an produce a small image with only binary in a scratch image.

## Build base image
sudo docker build . -f Dockerfile.base

## Edit .env file
Edit the value of PORT

## Start the server
Type the following command to start the demo server -  
docker-compose up --build -d

## Access demo Server
http://{hostname}:8080/