FROM golang:alpine as builder

COPY . .
RUN go build -o /go/bin/fullcycle


FROM scratch

COPY --from=builder /go/bin/fullcycle /go/bin/fullcycle
ENTRYPOINT ["/go/bin/fullcycle"]