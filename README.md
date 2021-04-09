# Consul Cluster project

## About

This is a project to create a Consul cluster with 1 master and 2 agents.
In this cluster there will be a service running on the agents that will have a domain being resolved by Consul.

These agents will have a Nginx running and doing a proxy to other HTTP APIs using least connections algorithm.

Finally the master also will have a Nginx, but this will use the Consul as resolver to do a proxy redirect to domain of the service.

## Up and Running

To run using docker-compose:

```bash
docker-compose up -d
```

To access the Consul UI, open on browser:
<http://localhost:8500>

The APIs are being served on:
<http://localhost:8090>
