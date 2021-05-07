FROM golang:alpine3.13 AS build

WORKDIR /go/app

COPY src/ .

RUN go mod init felipediasdev.com/main

RUN CGO_ENABLED=0 go build -o /bin/codeeducation

FROM scratch

COPY --from=build /bin/codeeducation /bin/codeeducation

ENTRYPOINT [ "/bin/codeeducation" ]