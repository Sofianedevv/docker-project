# Etape 1 : Construction
FROM golang:1.16-alpine
WORKDIR /goapp
COPY goapp/ .
RUN go mod init my-go-app
RUN go env -w CGO_ENABLED=0 GOOS=linux GOARCH=amd64
RUN go build -o my-go-app ./my-go-app/
USER 1000
EXPOSE 9090
CMD ["./my-go-app"]


FROM