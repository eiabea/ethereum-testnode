FROM alpine:3.5
MAINTAINER eiabea<developer@eiabea.com>

RUN \
  apk add --update git go make gcc musl-dev linux-headers build-base cmake boost-dev && \
  git clone --depth 1 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /geth && \
  git clone --depth 1 --recursive -b release https://github.com/ethereum/solidity && \
  cd /solidity && cmake -DCMAKE_BUILD_TYPE=Release -DTESTS=0 -DSTATIC_LINKING=1 && \
  cd /solidity && make solc && install -s solc/solc /usr/bin && \
  cd / && rm -rf solidity && \
  apk del git go make gcc musl-dev linux-headers sed build-base cmake g++ curl-dev boost-dev && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/geth"]
