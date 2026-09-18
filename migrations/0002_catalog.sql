create table if not exists products (
  id serial primary key,
  slug text not null unique,
  sku text not null unique,
  name text not null,
  category text not null,
  colour text not null default '',
  finish text not null default '',
  short_description text not null default '',
  description text not null default '',
  image text not null default '',
  gallery jsonb not null default '[]',
  length_mm integer not null default 222,
  width_mm integer not null default 106,
  height_mm integer not null default 73,
  price_zar numeric(10,2) not null default 0,
  visible boolean not null default true,
  compressive_strength text not null default '',
  water_absorption text not null default '',
  mass_kg numeric(6,2) not null default 2.7,
  bricks_per_m2 integer not null default 48,
  packing text not null default '500 per pack',
  applications jsonb not null default '[]',
  created_at timestamptz not null default now()
);

create table if not exists company_settings (
  id integer primary key default 1,
  phone_display text not null,
  phone_href text not null,
  whatsapp_number text not null,
  whatsapp_display text not null,
  email text not null,
  address_line1 text not null,
  address_line2 text not null,
  hours_weekday text not null,
  hours_saturday text not null
);
