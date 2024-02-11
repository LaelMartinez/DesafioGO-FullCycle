FROM golang:stretch   AS builder
WORKDIR /app
COPY . .

RUN go mod init hello
RUN go build -o hello-world -ldflags="-s -w"   
RUN rm -rf go.*

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello-world /app
CMD ["./hello-world"]
