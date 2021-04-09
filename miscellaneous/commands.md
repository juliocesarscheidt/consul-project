# Some commands

```bash

docker-compose up --build -d

docker-compose logs -f --tail=50


docker-compose logs -f --tail=50 consul-master

docker-compose exec consul-master bash


docker-compose logs -f --tail=50 consul-agent-0 consul-agent-1

docker-compose exec consul-agent-0 bash
docker-compose exec consul-agent-1 bash


docker-compose logs -f --tail=50 api-v1 api-v2


docker-compose stop



consul reload

consul members



nginx -t
nginx -s reload
nginx -s stop



ip -4 a | grep eth0
# e.g.: inet 192.168.176.2/20 brd 192.168.191.255 scope global eth0



dig @consul-master -p 8600 -t SRV webserver.service.consul

dig @127.0.0.1 -p 8600 -t SRV webserver.service.consul


dig @consul-master -p 8600 -t A webserver.service.consul

dig @127.0.0.1 -p 8600 -t A webserver.service.consul


dig @consul-master -p 8600 -t NS webserver.service.consul

dig @127.0.0.1 -p 8600 -t NS webserver.service.consul


curl --silent 127.0.0.1:8500/v1/catalog/services | jq -r .

curl --silent 127.0.0.1:8500/v1/catalog/service/webserver?pretty | jq -r .

```
