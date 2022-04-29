require 'minitest/autorun'
require '../src/solitaire_cipher.rb'

class SolitaireCipherTest < Minitest::Test
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
    cipher = SolitaireCipher.new
    assert_equal [3], cipher.transform_string_to_number('C')
    assert_equal [3, 4], cipher.transform_string_to_number('CD')
  end

  def test_transform_number_to_string
    cipher = SolitaireCipher.new
    assert_equal 'C', cipher.transform_number_to_string([3])
    assert_equal 'CD', cipher.transform_number_to_string([3, 4])
  end

  #   C + D => 7
  #   7 => G
  def test_encrypt_one_char
    cipher = SolitaireCipher.new
    assert_equal 'G', cipher.encrypt('C', 'D')
  end

  #  CODEI => GLNCQ
  #  COD => CODXX => encrypt message
  #  CODEI NRUBY LIVEL ONGER => GLNCQ MJAFF FVOMB JIYCB
  #
end
