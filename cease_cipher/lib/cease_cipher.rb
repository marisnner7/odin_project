puts 'What would you like to encrypt?'
message = gets.chomp
# Collect an integer from a user
puts 'How many places do you want to shift the cipher?'
code = gets.chomp.to_i

def caesar(message, code)
  coded = message.bytes.map do |digit|
    if digit.between?(97, 122) # 97 --122 Ascii lowcase notations for characteres
      (digit - 97 + code) % 26 + 97
    elsif digit.between?(65, 90) # uppercase notation
      (digit - 65 + code) % 26 + 65

    else
      digit
    end
  end
  coded.map(&:chr).join
end

puts caesar(message, code)
