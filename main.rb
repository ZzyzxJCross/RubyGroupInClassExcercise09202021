#holds token and lexeme together
class Nonterminal
  def initialize(lexeme, token)
    @lexeme = lexeme
    @token = token
  end

  def to_s()
    output = "\n\nlexeme:\n" + @lexeme.to_s() + "\ntoken:\n" + @token.to_s()
  end
end

#handles the lexical analysis
class Lexer
  def initialize
    @inFile = File.read(ARGV[0])
    print("The text of the input file is: #@inFile \n")
    @scanIndex = 0
    @lexemeArray = Array.new
    @tokenArray = Array.new
    @tokenTypeArray = Array.new
  end



  #works through the file and updates the array of token objects
  def fineScanner()

    #when the scanner reaches the EOF, stops
    while(@inFile[@scanIndex] != nil)

      workingChar = @inFile[@scanIndex]
      workingStr = Array.new
      workingStr.push(workingChar)
      indexAugment = 1
      indexJump = 1

      #handles int constants 
      #learned how to use regex from https://www.rubyguides.com/2015/06/ruby-regex/
      if(workingChar =~ /[0-9]/)
        @tokenTypeArray.push("int constant")
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
        @tokenTypeArray.push("id")
        while(@inFile[@scanIndex + indexAugment] =~ /[a-z]/i)
          workingStr.push(@inFile[@scanIndex + indexAugment])

          print("workingStr is " + workingStr[0] + " ")
          print("indexAugment is " + indexAugment.to_s + " ")
          print("@inFile[@scanIndex + indexAugment] is " + @inFile[@scanIndex + indexAugment] + "\n")

          indexAugment = indexAugment + 1
          indexJump = indexJump + 1
        end
      end

      #handles +, -, *, /, (, and )
      if(workingChar =~ /[+\-*\/\(\)]/)
        @tokenTypeArray.push(workingChar)
        while(@inFile[@scanIndex + indexAugment] =~ /[+\-*\/\(\)]/)
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
      @lexemeArray.push("#{workingStr.join("")}")
    end
    puts(@lexemeArray.to_s)
    counter = 0
    for i in @lexemeArray
      puts(i)
      @tokenArray.push(Nonterminal.new(i, @tokenTypeArray[counter]))
      counter = counter + 1
    end
    for j in @tokenArray
      puts(j.to_s() + "\n")
    end
  end
  
end

test = Lexer.new
test.fineScanner()
