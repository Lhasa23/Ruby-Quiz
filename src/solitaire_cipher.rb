class SolitaireCipher
  CONSTANT = 64

  def transform_string_to_numbers(text)
    text.bytes.map { |byte_number| byte_number - CONSTANT }
  end

  def transform_numbers_to_string(numbers)
    numbers.map(&method(:transform_number_to_char)).join
  end

  def encrypt(plain_text, key)
    handle_cipher(key, format_plain_text(plain_text)) do |char_number, key_number|
       char_number + key_number
    end
  end

  def decrypt(secret_text, key)
    handle_cipher(key, secret_text) do |char_number, key_number|
      char_number - key_number
    end
  end

  def format_plain_text(plain_text)
    fpt = plain_text.gsub(/\s+/, '').upcase
    fpt.ljust(fpt.size.fdiv(5).ceil * 5, 'X')
    # l= fpt.size / 5
    # if fpt.size % 5 > 0
    #   l =  l + 1
    # end
    # fpt.ljust(5 * l, 'X')
  end

  private

  def transform_number_to_char(number)
    return (number - 26 + CONSTANT).chr if number > 26
    return (number + 26 + CONSTANT).chr unless number.positive?
    (number + CONSTANT).chr
  end

  def handle_cipher(key, text)
    char_numbers = transform_string_to_numbers(text)
    key_numbers = transform_string_to_numbers(key)
    secret_numbers = char_numbers.map.with_index { |char_number, index| yield(char_number, key_numbers[index]) }
    transform_numbers_to_string(secret_numbers)
  end
end

