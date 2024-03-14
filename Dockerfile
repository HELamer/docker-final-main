FROM golang:1.22
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod tidy
RUN go get modernc.org/sqlite
COPY main.go parcel_test.go parcel.go tracker.db ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app
CMD ["/my_app"]