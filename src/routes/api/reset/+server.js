import { drop_database } from "$lib/server/reset_database.js"
import { get_tables } from "$lib/server/validate_auth_tables.js"
import { error } from "@sveltejs/kit"

/** @param {import("../../$types.js").RequestEvent} event */
export async function GET(event) {
  // Eventually we'll put this behind an authenticated check

  /** @type {import("@cloudflare/workers-types").D1Database} */
  const db = event.platform?.env.auth

  let tables
  try {
    tables = await get_tables(db)
  } catch (err) {
    // @ts-ignore
    error(500, err)
  }

  if (tables?.length === 0) {
    error(500, "Not at all tables exist")
  }

  /** @type {import('@cloudflare/workers-types').D1Result<any>[]} */
  let batched
  try {
    batched = await drop_database(db)
  } catch (err) {
    // @ts-ignore
    error(500, err)
  }
  console.debug(batched)
  console.debug("Auth databases reset")

  return Response.json({ status: "ok", tables })
}
