FROM alpine:3.11 as downloader

RUN apk add unzip curl && \
    curl -L 'https://dl.bintray.com/rabbitmq/community-plugins/3.8.x/rabbitmq_delayed_message_exchange/rabbitmq_delayed_message_exchange-20191008-3.8.x.zip' -o /dmex.zip && \
    unzip dmex.zip

FROM rabbitmq:3.8.3-management as runtime

MAINTAINER Elders

COPY --from=downloader /rabbitmq_delayed_message_exchange-20191008-3.8.x.ez /plugins/

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange && \
    rabbitmq-plugins enable rabbitmq_federation && \
    rabbitmq-plugins enable rabbitmq_federation_management