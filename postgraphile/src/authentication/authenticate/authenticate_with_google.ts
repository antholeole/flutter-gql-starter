import { OAuth2Client } from 'google-auth-library'

const client = new OAuth2Client("test")

const verifyIdToken  = async (googleIdToken: string) => {
    const ticket = await client.verifyIdToken({
        idToken: googleIdToken,
        audience: ['client_id', 'client_id']
    })

    const payload = ticket.getPayload()

    if (!payload) {
        throw new Error('no payload for ticket')
    }

    const userid = payload.sub
}