class Hangman
  puts "Welcome to Hangman Game"
  WORD_LIST = File.read('dict.txt').split("\n")
  def initialize
  word = WORD_LIST[rand(WORD_LIST.length)]
  wordlen = word.length
  convertWord = word.split('')
  dashArray  = Array.new
  dashArray.each do |i|
    collect = dashArray.each_index.select{|i| dashArray[i].casecmp(userchar) == 0}
    collect+=1
  end
  for i in (0..(wordlen-1))
    print ' _'
    dashArray.push '_'
  end
  correctWord =  Array.new(wordlen)
  @attempt = 0
  count=0
    loop do
    puts "\n\nGuess word\n"
    guessWord = gets.chomp
       if guessWord.length > 1 && guessWord != 'QUIT'
      guessWord = guessWord.split("").first
      puts "That was not a valid word. #{guessWord}."
    elsif guessWord.empty?
      puts "You can enter a blank space, Please enter any word."
    elsif guessWord == 'QUIT'
      exit
    end
    puts "you gussed #{guessWord}"
    collect = convertWord.each_index.select{|i| convertWord[i].casecmp(guessWord) == 0}
    collect.each do |tt|
      dashArray[tt] = guessWord
      count +=1
    end
    dashArray.each do |t|
      print " "+t
    end
    unless guessWord==word
      if (posi = word.index(guessWord)) then
        puts " ::correct.this is @ position #{posi}"
        dashArray[posi]=guessWord
        print "\n#{dashArray}"
          if (count==wordlen)
          print "Hey dude, congrats................."
          exit
       end
     else
        puts ":: incorrect"
        puts "It took you #{@attempt} guesses."
        @attempt+=1
        hangee
        if (@attempt==7) then
      exit
        end
      end
    end
    end
  end

def hangee
  case @attempt
      when 0
      guy = "
      \t|---
      \t|
      \t|
      \t|
      \t|
      \t|_____"
    when 1
      guy = "
      \t|---
      \t|  O
      \t|
      \t|
      \t|_____"
    when 2
      guy = "
      \t|---
      \t|  O
      \t|  |
      \t|
      \t|_____"
    when 3
      guy = "
      \t|---
      \t|  O
      \t|  |/
      \t|
      \t|
      \t|_____"
    when 4
      guy = "
      \t|---
      \t|  O
      \t| \\|/
      \t|
      \t|
      \t|_____"
    when 5
      guy = "
      \t|---
      \t|  O
      \t| \\|/
      \t| /
      \t|
      \t|_____"
    when 6
      guy = "
      \t|---
      \t|  O
      \t| \\|/
      \t| /\\
      \t|
      \t|_____"
    when 7
      guy = "
      \t|---
      \t|  |
      \t|  O
      \t| \\|/
      \t| /|\\
      \t|_____"
  end
  puts guy+"\n\n"
 end
end
Hangman.new

