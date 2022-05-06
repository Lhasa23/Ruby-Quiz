require 'minitest/autorun'
require '../src/solitaire_cipher.rb'

class SolitaireCipherTest < Minitest::Test
  def setup
    @cipher = SolitaireCipher.new
  end

  #  Key: DWJXH YRFDG TMSHP UURXJ
  #  A..Z 1 - 26
  # ASCII A - ' '
  #   A - ' '
  # HASH A => 1
  #   init { A => 1, ...}
  #  Happy Path:
  #  C => G
  #   C => 3, D => 4
  def test_transform_string_to_number
    assert_equal [3], @cipher.transform_string_to_numbers('C')
    assert_equal [3, 4], @cipher.transform_string_to_numbers('CD')
  end

  def test_transform_number_to_string
    assert_equal 'C', @cipher.transform_numbers_to_string([3])
    assert_equal 'CD', @cipher.transform_numbers_to_string([3, 4])
  end

  def test_transform_number_to_string_when_number_over_26
    assert_equal 'B', @cipher.transform_numbers_to_string([28])
  end

  def test_transform_number_to_string_when_number_non_positive
    assert_equal 'O', @cipher.decrypt('L', 'W')
    assert_equal 'Z', @cipher.decrypt('L', 'L')
  end

  #   C + D => 7
  #   7 => G

  def test_encrypt_string
    assert_equal 'GLNCQ', @cipher.encrypt('CODEI', 'DWJXH')
  end

  #  CODEI => GLNCQ
  #  COD => CODXX => encrypt message
  #  CODEI NRUBY LIVEL ONGER => GLNCQ MJAFF FVOMB JIYCB

  # GLNCQ => CODEI

  def test_decrypt_one_char
    assert_equal 'C', @cipher.decrypt('G', 'D')
  end

  def test_decrypt_string
    assert_equal 'CODEI', @cipher.decrypt('GLNCQ', 'DWJXH')
  end

  def test_format_a_group_plain_text
    assert_equal 'CVBNM', @cipher.format_plain_text('cvbnm')
  end

  def test_format_a_sentence_plain_text
    assert_equal 'CODEINRUBYLIVELONGER', @cipher.format_plain_text('code in Ruby live longer')
  end

  def test_format_plain_text_when_a_sentence_not_divided_by_5
    assert_equal 'CODEINRUBYLIVELONGERNOWXX', @cipher.format_plain_text('code in Ruby live longer now')
  end

  def test_encrypt_with_any_plain_text
    assert_equal 'GLNCF', @cipher.encrypt('code', 'DWJXH')
  end

end
