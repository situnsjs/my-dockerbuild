# Use base image we build as builder
FROM golang:alpine  as builder

# Make directory where we want to put our code for building.
RUN mkdir -p  $GOPATH/src/demo-app/go-app/ 

# copy codebase or get it from git once branch get finalised.
ADD server.go  $GOPATH/src/demo-app/go-app/

WORKDIR $GOPATH/src/demo-app/go-app/
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
# Fetch dependencies.
RUN go get ./

# Build the binary.
RUN go build -o  /go/bin/go-app

#final stage
FROM alpine:latest

# get argument for your app passed from docker-compose
ARG port
ENV PORT ${port}

RUN mkdir /app
# Copy our static executable.
COPY --from=builder /go/bin/go-app  /app/
WORKDIR /app

# Run the binary.
CMD ./go-app ${PORT}

