FROM nginx:1.19-alpine

WORKDIR /usr/share/nginx/html/

RUN apk update && \
    apk add bash bind-tools vim curl netcat-openbsd jq

RUN mkdir -p /etc/consul.d/ && \
    mkdir -p /var/consul/

ENV CONSUL_VERSION=1.7.3

RUN curl --silent -LO \
  https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip

RUN unzip consul_${CONSUL_VERSION}_linux_amd64.zip && \
    rm consul_${CONSUL_VERSION}_linux_amd64.zip && \
    mv consul /usr/local/bin/

COPY ./docker-entrypoint.sh /var/opt/
RUN chmod +x /var/opt/docker-entrypoint.sh

# Server RPC address (TCP Only)
EXPOSE 8300/tcp

# The HTTP API (TCP Only)
EXPOSE 8500/tcp

# The Serf LAN port (TCP and UDP) (required by all agents)
EXPOSE 8301/tcp
EXPOSE 8301/udp

# The Serf WAN port (TCP and UDP)
EXPOSE 8302/tcp
EXPOSE 8302/udp

# The DNS server (TCP and UDP)
EXPOSE 8600/tcp
EXPOSE 8600/udp

ENTRYPOINT ["/var/opt/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
