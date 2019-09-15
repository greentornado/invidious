docker run --rm -it -v $PWD:/app -w /app durosoft/crystal-alpine:latest crystal build src/invidious.cr  --release --static --no-debug
