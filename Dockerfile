FROM ubuntu:14.04
MAINTAINER Víctor Blasco <victor.bf@gmail.com>

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install base package
RUN apt-get update
RUN apt-get install -y wget git build-essential

# Install Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN sudo apt-get update
RUN sudo apt-get install -y erlang

# Install Elixir
WORKDIR /tmp/elixir-build
RUN git clone https://github.com/elixir-lang/elixir.git
WORKDIR elixir
RUN git checkout v1.1.0 && make && make install

# GM-Players
RUN mix do local.rebar, local.hex --force
RUN mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v1.0.2/phoenix_new-1.0.2.ez

# Install app
RUN rm -rf /var/www/*
WORKDIR /var/www
RUN git clone https://github.com/victorblasco/gm-players.git

WORKDIR gm-players
RUN mix do deps.get, compile

EXPOSE 4000

CMD ["mix", "phoenix.server"]
