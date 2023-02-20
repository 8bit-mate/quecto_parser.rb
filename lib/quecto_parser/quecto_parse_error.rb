# frozen_string_literal: true

#
# Errors rised by the lexer/parser.
#
class QuectoParseError < ::StandardError
  attr_reader :message

  def initialize(message)
    @message = message
    super()
  end
end

#
# Raised by the lexer if an illegal character is found.
#
class IllegalCharError < QuectoParseError
  attr_reader :message

  def initialize(message = "")
    super(message)
  end
end

#
# Raised by the parser if an illegal syntax is found.
#
class InvalidSyntaxError < QuectoParseError
  attr_reader :message

  def initialize(message = "")
    super(message)
  end
end
