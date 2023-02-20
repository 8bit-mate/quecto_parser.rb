# QuectoParser

A very simple lexer/parser for primitive arithmetic expressions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quecto_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install quecto_parser

## Usage

### Examples

```ruby
require "quecto_parser"

parser = QuectoParser.new

expr = "1 + foo - bar"

# get list of tokens:
tokens = parser.build_tokens(expr)

# build AST from tokens:
ast = parser.build_ast(tokens)

# or parse expression with a single command:
ast = parser.parse_expr(expr)

```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/8bit-mate/quecto_parser.

## Acknowledges

The lexer and the parser were inspired by the David Callanan's "[Make Your Own Programming Language](https://github.com/davidcallanan/py-myopl-code)" series.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
