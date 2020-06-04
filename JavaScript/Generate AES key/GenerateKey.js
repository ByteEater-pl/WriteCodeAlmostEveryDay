async function generateKey(password) {
  const salt = crypto.getRandomValues(new Int8Array(16))
  return {salt, key:
    await crypto.subtle.deriveKey(
      {name: "PBKDF2", salt, iterations: 1000, hash: "SHA-256"},
      await crypto.subtle.importKey(
        "raw",
        await crypto.subtle.digest("SHA-256", new TextEncoder().encode(password)),
        "PBKDF2",
        false,
        ["deriveKey"]),
      {name: "AES-CTR", length: 256},
      true,
      ["wrapKey", "unwrapKey"])}
}
