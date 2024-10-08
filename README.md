# Finnish personal ID in PostgreSQL

This example creates a table to store a somewhat validated [Finnish personal ID code][id] and extract date of birth and gender from it. It
supports the new separators from the [2023 id code reform][reform]. Test ID numbers generated using the awesome [generator by
telepartikkeli][generator].

I say _somewhat validated_ because it doesn't currently validate the checksum of the identity code. See below to do list.

## Usage

- Run the scripts in [setup.sql](setup.sql) to create the needed type and table
- Insert [test data](testdata.sql) into table
- Run `select * from people`

## Todo

- Create a stored procedure that validates the check digit:
  - modulo 31 of the nine-digit `ddmmyyid`
  - lookup reuslt from `0123456789ABCDEFHJKLMNPRSTUVWXY`
- Extract substring date mangling into a user function
- Calculate current age based on personal id code

## Code review

Code review available [here][review]. Thanks to J_H for the input.

[id]: https://dvv.fi/en/personal-identity-code
[reform]: https://dvv.fi/en/reform-of-personal-identity-code
[generator]: https://telepartikkeli.azurewebsites.net/tunnusgeneraattori
[review]: https://codereview.stackexchange.com/questions/292687/postgresql-generated-column-from-finnish-personal-identity-code
