import { mixed } from 'graphile-build'
import { IncomingMessage } from 'http'

export const translateAuthenticatedRequest = (req: IncomingMessage): Record<string, mixed> => {
    if (req.headers.authorization) {
        console.log(req.headers.authorization)
    }

    //break token up, return fields that matter
    //userID?

    return {}
}