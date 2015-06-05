require 'test_helper'

class HangulTest < MiniTest::Test
  include Hangul

  def setup
    @hangul = Hangul.new
  end

  def test_one_way
    assert_equal "privet", @hangul.transcript(:russian, :transcript, 'привет')[0]
  end

  def test_two_way
    assert_equal "ㅍㄹㅣㅜㅔㅌ", @hangul.transcript(:russian, :korean, 'привет')[1]
  end

  def test_ru_en
    assert_equal "preevet", @hangul.transcript(:russian, :english, 'привет')[1]
  end

  def test_en_ru
    assert_equal "хелло", @hangul.transcript(:english, :russian, 'hello')[1]
  end
end
