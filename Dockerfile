FROM cypress/included:3.2.0

RUN apt-get update \
  && apt-get install --assume-yes \
    awscli \
  && apt-get clean

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]