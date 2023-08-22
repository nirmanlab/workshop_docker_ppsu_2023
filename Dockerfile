FROM golang:1.21 as build-stage
ENV CGO_ENABLED 0
RUN mkdir -p /demo/app
WORKDIR /demo
COPY . . 
RUN go build -o ./app/server ./main.go


FROM alpine:3.14 as finalStage
COPY --from=build-stage /demo/app/server /deploy/app/server
RUN ls -lah .
RUN chmod +x /deploy/app/server
ENTRYPOINT [ "/deploy/app/server" ]
EXPOSE 8080