def caesar_cipher(string, num)
  cipher_string = ""
  num = num % 26 # keeps the cipher shift from 1 to 25
  
  # the following numbers are from the ASCII Binary Character Table
  string.each_byte do |c|
    if c >= 65 && c <= 90 && c-num < 65 # 65 to test edge case of letter 'A'
      cipher_string << c-num + 26 # to wrap from 'A' minus 1 (64) to 'Z' (90)
    elsif c >= 97 && c <= 122 && c-num < 97 # to test edge case of letter a
      cipher_string << c-num + 26 # to wrap from 'a' minus 1 (96) to 'z' (122)
    elsif c >= 65 && c <= 122
      cipher_string << c-num
    else 
      cipher_string << c # doesn't shift characters that aren't letters (a-z, A-Z)
    end
  end
  
  p string
  p cipher_string

  return cipher_string
end

# some basic testing
caesar_cipher("Hello, World", 5)
caesar_cipher("ABCDEFG", 5)
caesar_cipher("abcdefg", 32)
caesar_cipher("abcABCdefDEF", 54)
caesar_cipher("xyz XYZ uvw UVW 123", 3)
caesar_cipher("", 2)
caesar_cipher("Super Secret Message...", 26)