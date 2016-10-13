use Mix.Config

config :hanks_first_birthday, HanksFirstBirthday.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "sleepy-coast-78221.heroku.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :logger, level: :info

config :hanks_first_birthday, HanksFirstBirthday.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

