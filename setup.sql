create type gender as enum('male', 'female');

create table people (
  id char(11),
  birthday date generated always as (
    case
      when upper(substring(id, 7, 1)) in ('A', 'B', 'C', 'D', 'E', 'F') then make_date((2000 + substring(id, 5, 2)::int), substring(id, 3, 2)::int, substring(id, 1, 2)::int)
      when upper(substring(id, 7, 1)) in ('Y', 'X', 'W', 'V', 'U', '-') then make_date((1900 + substring(id, 5, 2)::int), substring(id, 3, 2)::int, substring(id, 1, 2)::int)
      when substring(id, 7, 1) = '+' then make_date(1800 + substring(id, 5, 2)::int, substring(id, 3, 2)::int, substring(id, 1, 2)::int)
      else null
    end
  ) stored,
  gender gender generated always as (
    case
      when (substring(id, 8, 3))::int % 2 = 1 then 'male'::gender
      else 'female'::gender
    end
  ) stored
  
  constraint chk_id check (id ~ '(?:0[1-9]|[12][0-9]|3[01])(?:0[1-9]|1[0-2])(?:\d{2})(?:[ABCDEFYXWVU+-])(?:\d{3})(?:[0-9]|[ABCDEFHJKLMNPRSTUVWXY])')
);
