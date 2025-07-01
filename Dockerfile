FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY server/ .
RUN go build -o server .

FROM alpine
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080

ENTRYPOINT ["./server"]