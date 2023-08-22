FROM golang:1.21

RUN mkdir -p /demo/app
WORKDIR /demo/app
COPY . . 
RUN go build -o server main.go
RUN chmod +x server
ENTRYPOINT [ "/demo/app/server" ]
EXPOSE 8080
