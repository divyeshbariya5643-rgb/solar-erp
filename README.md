# Siddhivinayak Engineering Company — Solar ERP

Initial browser-based solar management application.

## Included
- Dealer list
- Dealer-linked and company-direct customers
- Customer project amount
- Payment entry with recipient split: Company / Dealer
- Payment history and basic dashboard totals
- Supabase email/password authentication

## Setup
1. Create a Supabase project.
2. In Supabase SQL Editor, run all SQL in `supabase/schema.sql`.
3. In Supabase Authentication → Users, create your first user.
4. Deploy this repository to Cloudflare Pages (or test `index.html` locally).
5. Enter the Supabase Project URL and Publishable Key in the app and sign in.

## Security warning
The initial database policies allow every authenticated user to manage all company records. This is a development starter only. Do not invite employees or enter real customer/payment data until role-based permissions, audit logs, validation, and backups are implemented and tested. Never put a Supabase Secret/Service Role key in frontend code or GitHub.
