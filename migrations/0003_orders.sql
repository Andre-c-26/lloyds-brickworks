create table if not exists orders (
  id serial primary key,
  order_number text not null unique,
  status text not null default 'Pending Payment',
  full_name text not null,
  phone text not null,
  email text not null,
  address text not null,
  city text not null,
  province text not null,
  notes text not null default '',
  total_zar numeric(12,2) not null,
  created_at timestamptz not null default now()
);

create table if not exists order_items (
  id serial primary key,
  order_id integer not null references orders(id) on delete cascade,
  slug text not null,
  name text not null,
  colour text not null default '',
  image text not null default '',
  price_zar numeric(12,2) not null,
  quantity integer not null,
  line_total_zar numeric(12,2) not null
);
