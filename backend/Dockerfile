FROM ruby:3.2.2-slim-bookworm AS builder
 
RUN apt update && apt install -y \
    git \
    curl \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    autoconf \
    bison \
    build-essential \
    libyaml-dev \
    libreadline-dev \
    libncurses5-dev \
    libffi-dev \
    libgdbm-dev \
    libpq-dev

RUN gem update --system 3.4.19

WORKDIR /usr/src/app

COPY ./ ./

RUN bundle install
RUN RAILS_ENV=production bundle exec rails assets:precompile

FROM ruby:3.2.2-slim-bookworm

RUN apt update && apt install -y libpq5 && rm -rf /var/lib/apt/lists/*; 

WORKDIR /usr/src/app 

COPY --from=builder /usr/local/bundle /usr/local/bundle
COPY --from=builder /usr/src/app/ ./
EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]