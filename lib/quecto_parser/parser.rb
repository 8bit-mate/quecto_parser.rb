# frozen_string_literal: true

require_relative "bin_op_node"
require_relative "number_node"
require_relative "quecto_parse_error"
require_relative "token_types"

#
# Parses list of tokens to build an abstract syntax tree.
#
class Parser
  include TokenTypes

  #
  # Initialize a parser instance.
  #
  # @param [Array<Token>] tokens
  #   List of tokens to parse.
  #
  def initialize(tokens)
    @tokens = tokens
    @cur_token = @tokens[0]
    @idx = 0
  end

  #
  # Parse list of tokens.
  #
  # @return [BinOpNode, NumberNode]
  #
  def parse
    _expr
  end

  private

  #
  # Buid a node for the expression.
  #
  # @return [BinOpNode, NumberNode] left
  #   Node for an expression. The left.class corresponds to the expression type: a single number or a binary operation
  #   (an operation between two numbers).
  #
  # @raise [InvalidSyntaxError]
  #
  def _expr
    # retrieve left part of the expression:
    left = _term

    while BIN_OPS.include?(@cur_token.type)
      # retrieve operator between two number nodes:
      op_tok = @cur_token

      # retrieve right part of the expression:
      _next_token
      right = _term

      left = BinOpNode.new(left, op_tok, right)
    end

    unless _valid_token?([TT_EOF])
      error_msg = "expected TT_PLUS or TT_MINUS, but got #{@cur_token.type}"
      raise InvalidSyntaxError, error_msg
    end

    left
  end

  #
  # Search for a term in the expression.
  #
  # @return [NumberNode] token
  #   Found term.
  #
  # @raise [InvalidSyntaxError]
  #
  def _term
    unless _valid_token?(TERMS)
      error_msg = "expected TT_INT or TT_CONST, but got #{@cur_token.type}"
      raise InvalidSyntaxError, error_msg
    end

    token = NumberNode.new(@cur_token)

    _next_token
    token
  end

  #
  # Process next token.
  #
  def _next_token
    @idx += 1
    @cur_token = @tokens[@idx] if @idx < @tokens.length
  end

  #
  # Check if @cur_token type is in a list of allowed types.
  #
  # @param [Array<Symbol>] allowed_types
  #
  # @return [Boolean]
  #
  def _valid_token?(allowed_types)
    allowed_types.include?(@cur_token.type)
  end
end
