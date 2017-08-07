# summon-example
This is a working demonstration of how to fetch secrets from Conjur using Summon.

## Expectations
This demo expects the following:
1. [You have a Conjur environment running](https://developer.conjur.net/quickstart)
2. [The Conjur CLI is installed](https://developer.conjur.net/cli)
3. [You've already run `conjur init`](https://developer.conjur.net/cli#quickstart)
4. [You have Summon installed](https://github.com/conjurinc/summon#install)
5. [You have a Conjur provider for Summon installed](https://github.com/conjurinc/summon-conjur#install)

## Running the Demo
1. Run `setup.sh` in the root directory. This will prompt you to enter the `admin` password so it may load the policies provided, create a self signed certificate and put it in Conjur.
2. Run `summon bin/weather-service` to run the "Weather Service" with secrets provided from Conjur via Summon.
