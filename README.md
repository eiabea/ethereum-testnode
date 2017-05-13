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

```
git clone https://github.com/eiabea/ethereum-testnode.git
cd ethereum-testnode
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
