import PgSimplifyInflectorPlugin from '@graphile-contrib/pg-simplify-inflector'
import ConnectionFilterPlugin from 'postgraphile-plugin-connection-filter'
import express from 'express'
import { postgraphile, PostGraphileOptions } from 'postgraphile'
import { translateAuthenticatedRequest } from './authentication/translate_authenticated_request'
import { AuthenticatePlugin } from './authentication/authentication_request'

const app = express()
const { POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB, POSTGRES_HOST, POSTGRES_PORT, JWT_SECRET } = process.env
const connStr = `postgres://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}`

const config: PostGraphileOptions = process.env.NODE_ENV === 'dev' ? {
  watchPg: true,
  showErrorStack: "json",
  extendedErrors: ["hint","detail","errcode"],
  graphiql: true,
  enhanceGraphiql: true,
  allowExplain: true,
  exportGqlSchemaPath: "/schema.graphql",
} : {
  retryOnInitFail: true,
  extendedErrors: ["errcode"],
  graphiql: false,
  disableQueryLog: true,
}

app.use(
    postgraphile(
      connStr,
      "public",
      {
        pgSettings: req => ({
          ...translateAuthenticatedRequest(req)
        }),
        enableQueryBatching: true,
        ignoreRBAC: false,
        setofFunctionsContainNulls: false,
        dynamicJson: true,
        legacyRelations: "omit",
        jwtSecret: JWT_SECRET,
        jwtPgTypeIdentifier: "public.jwt_token",
        appendPlugins: [
          PgSimplifyInflectorPlugin, 
          ConnectionFilterPlugin,
          AuthenticatePlugin
        ],
        subscriptions: true,
        ...config,
      }
    )
  )

app.listen(8080, () => {
  console.log(`listening on port ${8080}`)
})

