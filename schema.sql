-- Stark Solar ERP: run this entire script in Supabase SQL Editor.
create extension if not exists pgcrypto;
create table if not exists public.dealers (
 id uuid primary key default gen_random_uuid(), name text not null,
 phone text, city text, created_at timestamptz not null default now()
);
create table if not exists public.customers (
 id uuid primary key default gen_random_uuid(), name text not null,
 phone text, city text, dealer_id uuid references public.dealers(id) on delete set null,
 created_at timestamptz not null default now()
);
create table if not exists public.projects (
 id uuid primary key default gen_random_uuid(),
 customer_id uuid not null references public.customers(id) on delete cascade,
 project_amount numeric(14,2) not null default 0 check(project_amount >= 0),
 created_at timestamptz not null default now()
);
create table if not exists public.payments (
 id uuid primary key default gen_random_uuid(),
 customer_id uuid not null references public.customers(id) on delete cascade,
 amount numeric(14,2) not null check(amount > 0),
 received_by text not null check(received_by in ('company','dealer')),
 payment_date date not null default current_date,
 payment_mode text, reference_no text, notes text,
 created_at timestamptz not null default now()
);
alter table public.dealers enable row level security;
alter table public.customers enable row level security;
alter table public.projects enable row level security;
alter table public.payments enable row level security;
create policy "authenticated manage dealers" on public.dealers for all to authenticated using(true) with check(true);
create policy "authenticated manage customers" on public.customers for all to authenticated using(true) with check(true);
create policy "authenticated manage projects" on public.projects for all to authenticated using(true) with check(true);
create policy "authenticated manage payments" on public.payments for all to authenticated using(true) with check(true);
grant usage on schema public to authenticated;
grant select,insert,update,delete on public.dealers,public.customers,public.projects,public.payments to authenticated;
