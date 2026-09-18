alter table orders add column if not exists delivery_zar numeric(12,2) not null default 0;
