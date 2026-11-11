# LPG Cylinder Log

**When did the cylinder actually arrive**

When did the cylinder actually arrive.

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export) |

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `lpg_cylinder_log_refills` table,
enables row-level security, and adds read/insert policies for anonymous users.

## Data model

Table: `lpg_cylinder_log_refills`

| Column | Type |
| --- | --- |
| `connection_id` | text |
| `booked_on` | date |
| `delivered_on` | date |
| `price` | numeric |
| `notes` | text |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Pushing to `main` builds a static export with GitHub Actions and publishes it to
GitHub Pages. Set `NEXT_PUBLIC_SUPABASE_URL` and
`NEXT_PUBLIC_SUPABASE_ANON_KEY` as repository Actions secrets — the included
`.github/workflows/deploy-pages.yml` passes them to the build.

## What it does

- **Booking to delivery gap** — See the real waiting time, not the promised one.
- **Price history** — Subsidy and price changes over the year.
- **Connection reference** — Consumer number kept with each entry.

## License

MIT
