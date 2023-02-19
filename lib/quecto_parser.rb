# frozen_string_literal: true

require_relative "quecto_parser/lexer"
require_relative "quecto_parser/parser"
require_relative "quecto_parser/version"

#
# A simple lexer/parser.
#
# Inspired by the David Callanan's "Make Your Own Programming Language" series
# @ https://github.com/davidcallanan/py-myopl-code
#
class QuectoParser
  #
  # Parse an expression.
  #
  # @param [String] expr
  #
  # @return [BinOpNode, NumberNode]
  #
  def parse_expr(expr)
    tokens = build_tokens(expr)
    build_ast(tokens)
  end

  #
  # Get a list of tokens from the string.
  #
  # @param [String] expr
  #
  # @return [Array<Token>] tokens
  #
  def build_tokens(expr)
    Lexer.new(expr).build_tokens
  rescue IllegalCharError => e
    puts "#{e.error_name} #{e.message}"
  end

  #
  # Build an abstract syntax tree from a list of tokens.
  #
  # @param [Array<Token>] tokens
  #
  # @return [BinOpNode, NumberNode]
  #
  def build_ast(tokens)
    Parser.new(tokens).parse
  rescue InvalidSyntaxError => e
    puts "#{e.error_name} #{e.message}"
  end
end
