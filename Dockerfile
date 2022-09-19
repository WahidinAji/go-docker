FROM golang:1.19 as base

WORKDIR /app
COPY . .
RUN go mod download && go mod verify

FROM base as dev

#
# RUN go build -o ./tmp/main
# EXPOSE 8080
# CMD ["./tmp/main"]

## Enable this one to run with air
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
CMD ["air"]