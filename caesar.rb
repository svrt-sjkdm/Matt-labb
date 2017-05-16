# A - Z (65 - 90)
# a - z (97 - 122)
# This is a TEST Motherfuckkker!!
def CaesarCipher(words,shift)
  encryptedM = []
  words.each {
    |letter|
    if (letter >= 65) && (letter <= 90)  #The letter is Upcase
      if (letter + shift <= 90)
        encryptedM.push(letter+shift)
      elsif (letter + shift > 90)
        trueShift = ((letter + shift) - 90).abs - 1
        encryptedM.push(65 + trueShift)
      end
    elsif (letter >= 97) && (letter <= 122) #The letter is Downcase
      if (letter + shift <= 122)
        encryptedM.push(letter+shift)
      elsif (letter + shift > 122)
        trueShift = ((letter + shift) - 122).abs - 1
        encryptedM.push(97 + trueShift)
      end
    else #The letter is a space or other symbol
      encryptedM.push(letter)
    end
  }
  return encryptedM
end
#E: 69 - 5 = 64 , 90 - ( (65-64) - 1)
# =>                  ****trueShift****
def DecryptCaesar(words,shift) #Descifrar restando el desplazamiento
  decryptedM = []
  words.each {
    |letter|
    if (letter >= 65) && (letter <= 90)  #The letter is Upcase
      if (letter - shift) < 65
        trueShift = (65-(letter-shift)) - 1
        decryptedM.push(90 - trueShift)
      else
        decryptedM.push(letter-shift)
      end
    elsif (letter >= 97) && (letter <= 122) #The letter is Downcase
      if (letter - shift) < 97
        trueShift = (97-(letter-shift)) - 1
        decryptedM.push(122 - trueShift)
      else
        decryptedM.push(letter-shift)
      end
    else #A space or a symbol
      decryptedM.push(letter)
    end
  }
  return decryptedM
end

asciiMessage = [] #The ascii code of the original message
asciiEncryptedM = [] #The ascii code of the encrypted message
asciiDecryptedM = [] #The ascii code of the decrypted message
puts "Write the message to be encrypted:"
message = gets.chomp
puts "Write the shift"
shift = gets.chomp.to_i
#The ascii code of each letter is stored in the array asciiMessage
message.each_byte {
  |i|
  asciiMessage.push(i)
}

puts "Ascii code of the original message:"
print asciiMessage
puts
asciiEncryptedM = CaesarCipher(asciiMessage,shift)
puts "Ascii code of the encrypted message:"
print asciiEncryptedM
puts "\nEncrypted message:"
asciiEncryptedM.each {
  |i|
  print i.chr
}
puts
asciiDecryptedM = DecryptCaesar(asciiEncryptedM,shift)
puts "The original message is:"
asciiDecryptedM.each {
  |i|
  print i.chr
}
puts "\n\n"
