@integration_test
Feature: Integratio Test

Scenario: Validate response code for books list
  When Send post to endpoint book list
  Then Validate response code 200

Scenario: Validate request code correct for books create
  When Send post 'correct' to endpoint create books
  Then Validate response code 200
  And JsonSchema: "create_books"

Scenario: Validate request code wrong for books create
  When Send post 'wrong' to endpoint create books
  Then Validate response code 400

Scenario: Validate request code correct for books read
  When Send post 'correct' to endpoint read books
  Then Validate response code 200
  And JsonSchema: "read_books"

Scenario: Validate request code wrong for books read
  When Send post 'wrong' to endpoint read books
  Then Validate response code 404

Scenario: Validate request code correct for books update
  When Send post updte field 'Publisher' to endpoint update books
  Then Validate response code 200
  And JsonSchema: "read_books"

Scenario: Validate request code incorrect for books update
  When Send post updte field 'This_is_a_bug' to endpoint update books
  Then Validate response code 404

Scenario: Validate request code correct for books delete
  When Send post 'correct' to endpoint delete books
  Then Validate response code 200
  And JsonSchema: "read_books"

Scenario: Validate request code incorrect for books delete
  When Send post 'wrong' to endpoint delete books
  Then Validate response code 404
