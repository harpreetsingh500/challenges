class InvalidCodonError < Exception; end

class Translation
  CODONS = [ [['AUG'], 'Methionine'], 
             [['UUU', 'UUC'], 'Phenylalanine'],
             [['UUA', 'UUG'], 'Leucine'],
             [['UCU', 'UCC', 'UCA', 'UCG'], 'Serine'],
             [['UAU', 'UAC'], 'Tyrosine'],
             [['UGU', 'UGC'], 'Cysteine'],
             [['UGG'], 'Tryptophan'],
             [['UAA', 'UAG', 'UGA'], 'STOP']
           ]
  
  def self.check_invalid(code)
    codon_invalid = 0
    CODONS.each do |codon, protein|
      codon_invalid += 1 if codon.include?(code)
    end
    raise InvalidCodonError if codon_invalid == 0
  end
  
  def self.of_codon(code)
    proteins = []
    stop_at = CODONS.last.first
    CODONS.each do |codon, protein|
      self.check_invalid(code)
      break if stop_at.include?(code)
      proteins << protein if codon.include?(code)
    end
    return 'STOP' if proteins.empty?
    proteins.join(', ')
  end
  
  def self.of_rna(strand)
    proteins = []
    rna_length = strand.length / 3
    starting_index = 0
    rna_length.times do
      code = strand[starting_index, 3]
      proteins << self.of_codon(code)
      if proteins.last == 'STOP'
        proteins.pop
        break
      end
      starting_index += 3
    end
    proteins
  end
end
