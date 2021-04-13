FROM golang:1.14 as gobase

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...
RUN go build -o hello

FROM scratch

WORKDIR /go/src/app

COPY --from=gobase /go/src/app/. .

CMD ["/go/src/app/hello"]