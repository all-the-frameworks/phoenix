# Project Manager

This is an example Phoenix app, developed as part of [All The Frameworks](https://github.com/all-the-frameworks)

## Running

The easiest way to use this is via Visual Studio Code's remote container support,
if you're using VS Code just open up this directory and it will ask if you want
to reopen in a container.

If you aren't using VS Code Docker Compose is set up, and `docker compose run app bash`
will give you a shell in a container already set up to run everything.

### Bootstrapping

Start a shell in the app container, and then run `mix ecto.create` to create the
database.

### Starting the Server

`mix phx.server` starts the Phoenix server, or `iex -S mix phx.server` will start
an interactive console alongside the server. The server will be listening on
port 4000, and forwarded by Docker.

### Running Tests

`mix test` runs the test suite.