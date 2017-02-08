# GitHub GraphQL API Example

The `github_graphql.rb` Ruby script generates a leader board of the most active pull request comment authors via the GitHub GraphQL API.

## Usage

```
GITHUB_TOKEN=<your token> ruby github_graphql.rb
``` 

## Example output from the Ruby on Rails repo

```
+--------------------------+----------+
| Author                   | Comments |
+--------------------------+----------+
| Rafael França            | 23       |
| Matthew Draper           | 21       |
| Jon Moss                 | 18       |
| Kasper Timm Hansen       | 14       |
| Andrew White             | 12       |
| Sean Griffin             | 10       |
| Ryuta Kamizono           | 10       |
| Arthur Nogueira Neves    | 7        |
| Vladimir Dementyev       | 7        |
| Klas Eskilson            | 6        |
| Robin Dupret             | 6        |
| Bradley Priest           | 6        |
| kenta-s                  | 5        |
| Kir Shatrov              | 5        |
| Nikolay Shebanov         | 5        |
| Koen Punt                | 4        |
| Egor Homakov             | 4        |
| David Faulkenberry       | 4        |
| Jeremy Daer              | 4        |
| Eileen M. Uchitelle      | 4        |
| Richard Beddington       | 4        |
| David Heinemeier Hansson | 4        |
| Travis Hunter            | 3        |
| Nathan                   | 3        |
| Guillermo Iguaran        | 3        |
| Mike Busch               | 3        |
| Alexander Marrs          | 3        |
| Mehmet Emin İNAÇ         | 3        |
+--------------------------+----------+
```