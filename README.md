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

Runs node with default values, which also includes mining on one thread

```
docker run -it -v /path/to/dag/location:/root/.ethash eiabea/ethereum-testnode
```

## Run

```
docker run -it -v $(pwd)/dag:/root/.ethash \
        -e TESTNODE_RPC_PORT=8454 \
        -e TESTNODE_RPC_ADDRESS=0.0.0.0 \
        -e TESTNODE_RPC_API=debug,txpool,personal,db,eth,net,web3 \
        -e TESTNODE_IDENTITY=Testnode \
        -e TESTNODE_VERBOSITY=5 \
        -e TESTNODE_MINING=false \
        eiabea/ethereum-testnode
```

## Access geth console

```
docker exec -it eth_node /geth attach
```
