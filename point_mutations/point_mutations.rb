class DNA
  attr_reader :strand_1
  
  def initialize(strand)
    @strand_1 = strand.split('')
  end
  
  def hamming_distance(strand)
    strand_2 = strand
    counter = 0
    strand_1.each_with_index do |_, idx|
      break if strand_1[idx] == nil || strand_2[idx] == nil
      counter += 1 if strand_1[idx] != strand_2[idx]
    end
    counter
  end
end
