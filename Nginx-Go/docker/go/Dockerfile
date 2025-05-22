################################################################################
# Builder
################################################################################
FROM golang:1.24 AS builder

WORKDIR /app

COPY ./app/* ./
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o server


################################################################################
# Server
################################################################################
FROM alpine:latest AS server

RUN apk --no-cache add ca-certificates

RUN addgroup -S app && adduser -S app -G app

USER app

WORKDIR /app

COPY --from=builder /app/server ./server

EXPOSE 8080

CMD ["./server"]
