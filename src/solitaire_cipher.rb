class SolitaireCipher
  CONSTANT = 64

  def transform_string_to_number(text)
    text.bytes.map { |byte_number| byte_number - CONSTANT }
  end

  def transform_number_to_string(numbers)
    numbers.map do |number|
      (number + CONSTANT).chr
    end.join
  end

  def encrypt(chars, key)
    char_numbers = transform_string_to_number(chars)
    key_numbers = transform_string_to_number(key)
    secret_numbers = char_numbers.map.with_index { |char_number, index| char_number + key_numbers[index] }
    transform_number_to_string(secret_numbers)
  end
end
