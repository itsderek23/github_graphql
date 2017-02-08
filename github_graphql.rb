# Ensure the GitHub token has been set as an environment variable
unless ENV['GITHUB_TOKEN']
  puts "The GITHUB_TOKEN environment variable must be set. Ex: GITHUB_TOKEN=<your token> ruby github_graphql.rb"
  exit
end

gem 'terminal-table'
require 'terminal-table'
gem 'graphql-client'
require "graphql/client"
require "graphql/client/http"
require "open-uri"

variables = {
  login: "rails",
  repo: "rails",
  pullRequestsCount: 100
}

HTTPAdapter = GraphQL::Client::HTTP.new("https://api.github.com/graphql") do
  def headers(context)
    {
      "Authorization" => "Bearer #{ENV['GITHUB_TOKEN']}"
    }
  end
end

Client = GraphQL::Client.new(
  schema: "schema.json",
  execute: HTTPAdapter
)

CommentQuery = Client.parse <<-'GRAPHQL'
query($login: String!, $repo: String!, $pullRequestsCount: Int, $commentsCount: Int) {
  repositoryOwner(login: $login) {
    repository(name: $repo) {
      name
      pullRequests(last: $pullRequestsCount, states: [OPEN]) {
        edges {
          node {
            title
            author {
              name
            }
            comments(last: $commentsCount) {
              edges {
                node {
                  author {
                    name
                  }
                  
                }
              }
            }
          }
        }
      }
    }
  }
}
GRAPHQL

# Execute the query and parse the result
result=Client.query(CommentQuery, variables: variables)
authors = result.data.repositoryOwner.repository.pullRequests.edges.map(&:node).map(&:comments).map { |comments| comments.edges.map { |edge| edge.node.author.name } }.flatten
by_author = authors.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
sorted = by_author.sort_by {|_key, value| value}.reverse

# Output the result
table = Terminal::Table.new :headings => ['Author', 'Comments'], :rows => sorted
puts table