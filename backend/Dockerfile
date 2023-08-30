FROM ruby:3.2.2-slim-bookworm
 
RUN apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev

WORKDIR /usr/src/app

COPY . .

RUN bundle install

CMD ["./bin/dev"]