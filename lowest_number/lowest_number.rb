def lowest_number(number)
  number.sort!.map!(&:to_s)
  number.sort_by { |x| x[0] }.join.to_i
end

puts lowest_number([1890, 18901])