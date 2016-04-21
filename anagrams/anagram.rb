class Anagram
  attr_reader :anagram
  
  def initialize(anagram)
    @anagram = anagram
  end
  
  def match(words)
    words.select { |word| (word.downcase == anagram) ? false : anagram?(word) }.sort
  end
  
  def anagram?(word)
    word.downcase.split('').sort == anagram.downcase.split('').sort
  end
end
