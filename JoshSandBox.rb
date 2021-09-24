#holds token and lexeme together
class Nonterminal
  def initialize(lexeme, token)
    @lexeme = lexeme
    @token = token
  end
end

#handles the lexical analysis
class Lexer
  def initialize
    @inFile = File.read(ARGV[0])
    print("The text of the input file is: #@inFile \n")
    @scanIndex = 0
    @tokenArray = Array.new
  end

  #works through the file and updates the array of token objects
  def fineScanner()

    #TODO: FIND A WAY TO MAKE IS SO THAT IT USES EOF INSTEAD OF "q"!
    while(@inFile[@scanIndex] != "q")

      workingChar = @inFile[@scanIndex]
      workingStr = Array.new
      workingStr.push(workingChar)
      indexAugment = 1
      indexJump = 1

      #handles int constants 
      #learned how to use regex from https://www.rubyguides.com/2015/06/ruby-regex/
      if(workingChar =~ /[0-9]/)
        while(@inFile[@scanIndex + indexAugment] =~ /[0-9]/)
          workingStr.push(@inFile[@scanIndex + indexAugment])

          print("workingStr is " + workingStr[0] + " ")
          print("indexAugment is " + indexAugment.to_s + " ")
          print("@inFile[@scanIndex + indexAugment] is " + @inFile[@scanIndex + indexAugment] + "\n")

          indexAugment = indexAugment + 1
          indexJump = indexJump + 1
        end
      end

      #handles ids
      if(workingChar =~ /[a-z]/i)
        while(@inFile[@scanIndex + indexAugment] =~ /[a-z]/i)
          workingStr.push(@inFile[@scanIndex + indexAugment])

          print("workingStr is " + workingStr[0] + " ")
          print("indexAugment is " + indexAugment.to_s + " ")
          print("@inFile[@scanIndex + indexAugment] is " + @inFile[@scanIndex + indexAugment] + "\n")

          indexAugment = indexAugment + 1
          indexJump = indexJump + 1
        end
      end

      @scanIndex = @scanIndex + indexJump
      puts("the character" + workingStr.to_s + "was found")
      @tokenArray.push(workingStr)
    end
    puts(@tokenArray.to_s)
  end
end

test = Lexer.new
test.fineScanner()
