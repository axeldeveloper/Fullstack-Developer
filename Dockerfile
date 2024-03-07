FROM ruby:3.2.2-slim

ENV RACK_ENV="development"
ENV RAILS_ENV="development"

ENV NODE_VERSION 18
ENV INSTALL_PATH /usr/src/app


# Instalar pré-requisitos
RUN echo "Install prerequisites"
RUN apt-get update && apt-get install -y \
  apt-utils \
  curl
# Add NodeJS
RUN echo "Install NodeJS"
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN apt-get update && apt-get install -y \
  nodejs




# Add Yarn
RUN echo "Install Yarn"
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
  build-essential \
  gnupg2 \
  less \
  git \
  libpq-dev \
  postgresql-client \
  yarn \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure  Bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_BIM=/usr/local/bundle/bin\
  BUNDLE_RETRY=3

WORKDIR $INSTALL_PATH

ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock

RUN gem update --system && gem install bundler

ADD . $INSTALL_PATH
