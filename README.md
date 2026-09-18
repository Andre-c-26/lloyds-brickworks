# Lloyd's Brickworks

South African clay brick manufacturer website (homepage, catalogue, quotes, cart, checkout, admin).

This is a **Node.js** app (TanStack Start + Vite + React + Postgres). It is **not** a static HTML site. Hostinger shared/PHP hosting cannot run it.

## Commands

```bash
npm install
npm run dev          # local development
npm run build        # production build + database migrations
npm start            # run the Node server (after a node-server build)
```

Requires **Node.js 22**.

## Hostinger (independent deploy)

Use **Hostinger VPS** or Hostinger **Node.js** hosting, not shared hosting.

### 1. Database

Provision **PostgreSQL** (Hostinger database, Neon, or similar).

On first build with `DATABASE_URL` set, migrations in `migrations/` create:

- products and company settings
- orders and order items
- admin auth tables

Without `DATABASE_URL`, the app falls back to an in-memory database that **resets on every restart**. Do not use that in production.

### 2. Environment variables

Set these on the server (not in git):

| Variable | Required | Purpose |
|---|---|---|
| `DATABASE_URL` | Yes | Postgres connection string |
| `BETTER_AUTH_URL` | Yes | Public site URL, e.g. `https://lloydsbrickworks.co.za` |
| `BETTER_AUTH_SECRET` | Yes | Long random string to sign admin sessions |
| `VITE_AUTH_ENABLED` | Yes | Set to `true` |
| `NITRO_PRESET` | Yes on Hostinger | Set to `node-server` |

`BETTER_AUTH_URL` must match the live https domain or admin login will fail.

Google / X buttons are tied to this build environment. On Hostinger, use **email + password** to create the admin account at `/login`.

### 3. Build and start

```bash
export NITRO_PRESET=node-server
npm ci
npm run build
npm start
```

### 4. Uploaded product images

- Catalogue photos in `public/images/` ship with the app.
- Admin **uploads** are stored as compressed JPEG **data URLs inside Postgres**, not as files on disk.
- No S3 is required. Back up the database — product photos live there.

### 5. What is not on the server

- Customer cart is browser `localStorage` only
- PayFast is a placeholder (not connected)
- Quote form opens email / WhatsApp (no mail server required)

## GitHub

Do not commit `.env`, `node_modules`, or database credentials.
