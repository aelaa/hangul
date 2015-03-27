require 'test_helper'

class HangulTest < MiniTest::Test
  include Hangul

  def setup
    @hangul = Hangul.new
  end

  def test_one_way
    assert_equal "privet", @hangul.transcript(:russian, :transcript, 'привет')
  end

  def test_two_way
    assert_equal "ㅍㄹㅣㅜㅔㅌ", @hangul.transcript(:russian, :korean, 'привет')
  end

  def test_ru_en
    assert_equal "privet", @hangul.transcript(:russian, :english, 'привет')
  end

  def test_en_ru
    assert_equal "хелло", @hangul.transcript(:english, :russian, 'hello')
  end
end
