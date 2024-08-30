# Finnish personal ID in PostgreSQL

This example creates a table to store a somewhat validated [Finnish personal ID code][id] and extract date of birth and gender from it. It
supports the new separators from the [2023 id code reform][reform]. Test ID numbers generated using the awesome [generator by
telepartikkeli][generator].

## Todo

- Create a stored procedure that validates the check digit:
  - modulo 31 of the nine-digit `ddmmyyid`
  - lookup: `0123456789ABCDEFHJKLMNPRSTUVWXY`
- Extract substring date mangling into a user function

## Code review

Code review available [here][review]. Thanks to J_H for the input.

[id]: https://dvv.fi/en/personal-identity-code
[reform]: https://dvv.fi/en/reform-of-personal-identity-code
[generator]: https://telepartikkeli.azurewebsites.net/tunnusgeneraattori
[review]: https://codereview.stackexchange.com/questions/292687/postgresql-generated-column-from-finnish-personal-identity-code
