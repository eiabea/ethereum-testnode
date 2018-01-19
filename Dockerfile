FROM alpine:3.7

ENV GO_ETHEREUM_VERSION=v1.7.3
ENV SOLIDITY_VERSION=v0.4.19

RUN \
  apk add --update git go make gcc musl-dev linux-headers build-base cmake boost-dev && \
  git clone --branch $GO_ETHEREUM_VERSION --depth 1 https://github.com/ethereum/go-ethereum && \
  (cd go-ethereum && make geth) && \
  cp go-ethereum/build/bin/geth /geth && \
  git clone --branch $SOLIDITY_VERSION --depth 1 --recursive -b release https://github.com/ethereum/solidity && \
  cd /solidity && cmake -DCMAKE_BUILD_TYPE=Release -DTESTS=0 -DSTATIC_LINKING=1 && \
  cd /solidity && make solc && install -s solc/solc /usr/bin && \
  cd / && rm -rf solidity && \
  apk del git go make gcc musl-dev linux-headers sed build-base cmake g++ curl-dev boost-dev && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

COPY ./genesis.json /genesis.json
COPY ./keystore /root/.ethereum/keystore
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV TESTNODE_RPC_PORT 8545
ENV TESTNODE_RPC_ADDRESS 0.0.0.0
ENV TESTNODE_RPC_API rpc,debug,txpool,personal,db,eth,net,web3
ENV TESTNODE_IDENTITY Testnode
ENV TESTNODE_VERBOSITY 5
ENV TESTNODE_MINING true
ENV TESTNODE_MINING_THREADS 1

EXPOSE 8545
EXPOSE 30303

VOLUME /root/.ethash

RUN /geth init /genesis.json

ENTRYPOINT ["/docker-entrypoint.sh"]
