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
  # @return [BinOpNode, NumberNode, nil]
  #
  def parse_expr(expr)
    tokens = build_tokens(expr)
    build_ast(tokens) if tokens
  end

  #
  # Build an abstract syntax tree from a list of tokens.
  #
  # @param [Array<Token>] tokens
  #
  # @return [BinOpNode, NumberNode, nil]
  #
  def build_ast(tokens)
    Parser.new(tokens).parse
  rescue InvalidSyntaxError => e
    puts "[#{e.class}] #{e.message}"
  end

  #
  # Get a list of tokens from the string.
  #
  # @param [String] expr
  #
  # @return [Array<Token>, nil] tokens
  #
  def build_tokens(expr)
    Lexer.new(expr).build_tokens
  rescue IllegalCharError => e
    puts "[#{e.class}] #{e.message}"
  end
end
