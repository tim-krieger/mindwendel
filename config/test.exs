use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :mindwendel, Mindwendel.Repo,
  username: System.get_env("TEST_DATABASE_USER"),
  password: System.get_env("TEST_DATABASE_USER_PASSWORD"),
  database: "#{System.get_env("TEST_DATABASE_NAME")}#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: System.get_env("TEST_DATABASE_HOST"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mindwendel, MindwendelWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :mindwendel, :options,
  feature_brainstorming_teasers:
    Enum.member?(
      ["", "true"],
      String.trim(System.get_env("MW_FEATURE_BRAINSTORMING_TEASER") || "")
    )
