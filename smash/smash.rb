def smash(str)
  str.split('').keep_if { |char| char.match(/[a-zA-Z]/) }.join(' ')
end

puts smash("Hello, World!")