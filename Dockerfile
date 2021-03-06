FROM elixir:1.13

ADD . /app
WORKDIR /app

RUN apt-get update && apt-get install -y inotify-tools && rm -rf /var/lib/apt/lists/*
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

EXPOSE 4000
CMD ["mix", "phx.server"]