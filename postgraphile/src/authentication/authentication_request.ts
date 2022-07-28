import { ExtensionDefinition, gql, makeExtendSchemaPlugin } from 'postgraphile'

enum AuthenticationSource {
  Apple = 'Apple',
  Google = 'Google'
}
interface AuthenticationResponse {
    accessToken: String,
    refreshToken: String
}

export const AuthenticatePlugin = makeExtendSchemaPlugin(() => {
    return <ExtensionDefinition>{
      typeDefs:  gql`
        type AuthenticationResponse {
            accessToken: String,
            refreshToken: String
        }

        enum AuthenticationSource {
            Apple,
            Google
        }

        extend type Mutation {
            authenticate(source: AuthenticationSource, idToken: String): AuthenticationResponse
        }
      `,
      resolvers: {
        Mutation: {
            authenticate: (_query, args): AuthenticationResponse => {
              const { source, idToken } = args as { source: AuthenticationSource, idToken: string }

              switch (source) {
                case AuthenticationSource.Apple:
                    throw Error('blah')
                case AuthenticationSource.Google:
                    return {
                      accessToken: 'googl',
                      refreshToken: "goog" + idToken
                    }
              }
            }
        }
      },
    };
  });

