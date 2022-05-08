import express from 'express'
import { postgraphile } from 'postgraphile'

const app = express()
const { POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB, POSTGRES_HOST, POSTGRES_PORT } = process.env
const connStr = `postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}`

app.use(
    postgraphile(
      connStr,
      "public",
      {
        watchPg: true,
        graphiql: true,
        enhanceGraphiql: true,
      }
    )
  )

