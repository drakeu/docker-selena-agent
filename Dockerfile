FROM dockerfile/ubuntu
MAINTAINER drakeu <dstosor@gmail.com>

RUN apt-get update && apt-get install -y \
  python-dev \
  python-virtualenv \
  libmysqlclient-dev \
  libmysqld-dev \
  git \
  libcurl4-gnutls-dev

USER root

ADD run.sh /run.sh

RUN chmod 0755 /run.sh

RUN bash -c "cd /root && git clone https://github.com/allegro/selena-agent.git"
RUN bash -c "cd /root/selena-agent && virtualenv venv --distribute --no-site-packages && source /root/selena-agent/venv/bin/activate && pip install -e ."

ENV REDIS_HOST=127.0.0.1
ENV REDIS_PORT=6379
ENV REDIS_DB=None
ENV REDIS_PASSWORD=None
ENV REDIS_QUEUE_NAME='agent'
ENV REDIS_SALT=''

CMD /run.sh $REDIS_HOST $REDIS_PORT $REDIS_DB $REDIS_PASSWORD $REDIS_QUEUE_NAME $REDIS_SALT
