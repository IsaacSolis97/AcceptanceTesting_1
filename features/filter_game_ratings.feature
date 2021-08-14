# language: en

Feature: Search games by raiting

  @gamesByRatings
  Scenario: Filter games that contain 'M,T' as their rate
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the ratings: M,T
      When the user search games by ratings
      Then 3 games will match
      And the names of these games are
      | NAME                       |
      | The Witcher 3: Wild Hunt   |
      | Splatoon                   |
      | The Last of Us             |
      And the following message is displayed: 3 games were found.

  @gamesByRatings
  Scenario: Filter games by ratings without finding result
      Given a set of games
     | NAME                       | RELEASE DATE | DEVELOPER            | RATE   |
     | The Witcher 3: Wild Hunt   | 2015         | CD Projekt           | M      |
     | Splatoon                   | 2016         | Nintendo             | T      |
     | Super Smash Bros. Ultimate | 2018         | Bandai Namco Studios | E      |
     | The Last of Us             | 2013         | Naughty Dog          | M      |
      Given the user enters the ratings: 'xyz'
      When the user search games by ratings
      Then 0 games will match
      And the following message is displayed: No game with the specified rating was found.
