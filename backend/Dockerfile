FROM ruby:3.2.2-slim-bookworm as build
 
RUN apt update && apt install -y git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libpq-dev
RUN gem update --system 3.4.19

WORKDIR /usr/src/app

COPY ./ ./

RUN bundle install
RUN RAILS_ENV=production bundle exec rails assets:precompile

FROM ruby:3.2.2-slim-bookworm

RUN apt update && apt install -y libpq5 && rm -rf /var/lib/apt/lists/*; 

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /usr/src/app/ ./

WORKDIR /usr/src/app 
CMD ["bin/rails", "s"].