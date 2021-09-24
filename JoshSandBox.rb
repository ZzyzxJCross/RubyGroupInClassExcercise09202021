class Token
  def initialize(lexeme, token)
    @lexeme = lexeme
    @token = token
  end
end

class Lexer
  def initialize
    @inFile = File.read(ARGV[0])
    print(@inFile)
    @scanIndex = 0
  end

  def fineScanner()
    workingChar = @inFile[scanIndex]
  end
end

test = Lexer.new
