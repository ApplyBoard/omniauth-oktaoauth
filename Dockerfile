ARG BASE_IMAGE

FROM $BASE_IMAGE
RUN apt-get update && apt-get install -y ruby-dev && rm -rf /var/lib/apt/lists/*
RUN gem install bundle bundler:2.2.7 rspec:3.7.0 docile:1.3.5 simplecov:0.18.5
COPY . ./workdir
WORKDIR /workdir
RUN bundle install
CMD bundle exec rspec