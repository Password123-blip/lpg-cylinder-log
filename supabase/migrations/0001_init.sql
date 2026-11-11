-- LPG Cylinder Log — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.lpg_cylinder_log_refills (
  id uuid primary key default gen_random_uuid(),
  connection_id text,
  booked_on date,
  delivered_on date,
  price numeric,
  notes text,
  created_at timestamptz not null default now()
);

create index if not exists lpg_cylinder_log_refills_created_idx on public.lpg_cylinder_log_refills (created_at desc);

alter table public.lpg_cylinder_log_refills enable row level security;

drop policy if exists "lpg_cylinder_log_refills_read" on public.lpg_cylinder_log_refills;
create policy "lpg_cylinder_log_refills_read" on public.lpg_cylinder_log_refills for select using (true);

drop policy if exists "lpg_cylinder_log_refills_insert" on public.lpg_cylinder_log_refills;
create policy "lpg_cylinder_log_refills_insert" on public.lpg_cylinder_log_refills for insert with check (true);
