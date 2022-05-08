module.exports = {
  "connectionString": "postgres://vscode:notsecure@localhost:5433/mydb",
  "shadowConnectionString": "postgres://vscode:notsecure@localhost:5434/mydb",
  "afterAllMigrations": [
    {
      "_": "command",
      "command": "echo hi"
    },
    {
      "_": "command",
      "shadow": true,
      "command": "pg_dump --schema-only --no-owner --exclude-schema=graphile_migrate --file=data/schema.sql \"$GM_DBURL\""
    }
  ],
}