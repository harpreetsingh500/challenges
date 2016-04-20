class PigLatin
  VOWELS = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
  
  def self.translate(word)
    new_word = word.split('')
    word.split('').each do |char|
      if VOWELS.include?(char)
        return (new_word.join + 'ay')
      else
        letter = new_word.shift
        new_word << letter
      end
    end
  end
end
