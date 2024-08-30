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

insert into people values
('070835U853H'),
('190678W326R'),
('190321B858S'),
('221289V3504'),
('121279V1997'),
('020481-198T'),
('120608U021A'),
('171092V061R'),
('200910A3811'),
('031291+1254'),
('160616F6796'),
('081065-670L'),
('190941X567C'),
('090858Y132F'),
('120422Y719U'),
('080195W708A'),
('010172U449H'),
('010215F5019'),
('110657W2656'),
('051027U2444'),
('180967X296P'),
('190796Y795A'),
('051292V3210'),
('080813X236K'),
('130764U553C'),
('200480-5971'),
('060833Y2840'),
('160960U756E'),
('161246V8177'),
('110513W874N'),
('020225-216A'),
('010306B396C'),
('241121D766F'),
('290905V625D'),
('060901B7364'),
('260642-6060'),
('160340-893V'),
('290174U7925'),
('200518F6706'),
('280749Y444N'),
('261245Y395T'),
('270393W144F'),
('230306Y611H'),
('221270Y899X'),
('200919D724D'),
('241290-049Y'),
('030349U307W'),
('291030-155H'),
('131020V684N'),
('020687X742H');
