# Ethereum Testnode

## Description

Alpine based Ethereum Testnode with 5 pre-generated Accounts

## Accounts

| Address | Password |
| ------------- |-------------| 
| 0x478c070adffad129531b867993547278fd29644c | kae3chah8peibeetohhohlieceeph8Ov |
| 0x09173545bbb0be46764b61fdf8b4a2c88fa81cd7 | phi9elooxunoxie9eroJoojeishi8Io9 |
| 0xc9837d802b5f6976de5a85b354addf91aaaf353f | faetahzayaeL4Mai5ohjaelijeemiech |
| 0x04d8a19bf844f406467bba01b60b41447b2b5216 | eey7UShahmae6XahYaM9iek7iekee4iu |
| 0x383471251ab78923c177275dd941579242dfa55d | tahP8ohthaequ2yieX9oox7aighei0vi |

## Quickstart

### Docker-Compose

```
version: "2"

volumes:
  chain:
    driver: "local"

services:
  ethereum_init:
    image: eiabea/ethereum-testnode
    command: "init /genesis.json"
    volumes:
      - "./genesis.json:/genesis.json"
      - "chain:/root"
  ethereum:
    build: eiabea/ethereum-testnode
    command: "--nodiscover --maxpeers=0 --rpc --rpcapi='debug,txpool,personal,db,eth,net,web3' --rpcport=8545 --rpccorsdomain='*' --rpcaddr='0.0.0.0' --port 30303 --identity='Testnode' --verbosity=5"
    depends_on:
      - "ethereum_init"
    ports:
      - "127.0.0.1:8545:8545"
      - "127.0.0.1:30303:30303"
    volumes:
      - "./keystore:/root/.ethereum/keystore"
      - "chain:/root"
```

```
docker-compose up
```

## Build

```
docker build --rm -t testnode .
```

## Init

Generates the genesis block (has to be run only once)

```
docker run -v /path/to/genesis.json:/genesis.json -v chain:/root testnode init /genesis.json
```

## Run

```
docker run --rm --name eth_node -v /path/to/keystore:/root/.ethereum/keystore -v chain:/root testnode --nodiscover --maxpeers=0 --rpc --rpcapi='debug,txpool,personal,db,eth,net,web3' --rpcport=8545 --rpccorsdomain='*' --rpcaddr='0.0.0.0' --port 30303 --identity='Test' --verbosity=5
```

## Access geth console

```
docker exec -it eth_node /geth attach
```

## Start mining

```
docker exec -it eth_node /geth attach --exec "miner.start(1)"
```

## Stop mining

```
docker exec -it eth_node /geth attach --exec "miner.stop()"
```