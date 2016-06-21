FROM rabbitmq:3.6.2-management

MAINTAINER Elders

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget

RUN wget http://www.rabbitmq.com/community-plugins/v3.6.x/rabbitmq_delayed_message_exchange-0.0.1.ez -P usr/lib/rabbitmq/lib/rabbitmq_server-3.6.2/plugins/

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange