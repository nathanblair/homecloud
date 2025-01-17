import { building } from '$app/environment'

export const prerender = false

/** @type {import('./$types').LayoutServerLoad} */
export async function load(event) {
  if (building) return {}

  if (!event.locals.auth) {
    console.error("Session failed to load")
    return { user: null }
  }

  const session = await event.locals.auth()

  if (session === null) {
    console.error(`No session found`)
    return { user: null }
  }

  delete session.user?.id

  return { user: session.user }
}
