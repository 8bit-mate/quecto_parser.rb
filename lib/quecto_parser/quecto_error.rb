# frozen_string_literal: true

#
# Errors rised by the parser.
#
class QuectoError < ::StandardError
  attr_reader :error_name, :message

  def initialize(error_name, message)
    @error_name = error_name
    @message = message
    super()
  end
end

#
# Raised by the lexer if an illegal character is found.
#
class IllegalCharError < QuectoError
  attr_reader :message

  def initialize(message = "")
    super("Illegal Character:", message)
  end
end

#
# Raised by the parser if an illegal syntax is found.
#
class InvalidSyntaxError < QuectoError
  attr_reader :message

  def initialize(message = "")
    super("Syntax Error:", message)
  end
end
