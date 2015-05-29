require 'test_helper'

class HangulTest < MiniTest::Test

  def setup
  end

  def test_simple
    assert_equal 'annyeong haseyo', Hangul.to_roman('안녕 하세요')
  end

  def test_s_in_sh
    skip
    assert_equal 'shu shi shya shyo', '슈 시 샤 쇼'.to_roman
  end

  def test_l_in_r
    skip
    assert_equal 'malgo marha bareum', '말구 밀하 발음'.to_roman
  end

  def test_eu
    skip
    assert_equal 'eusa hida', '의사 희다'.to_roman
  end

  def test_double_ending_first
    skip
    assert_equal 'neok an al il ul eobtta eobseul', '넋 앉 앏 잀 욽 없다 없을'.to_roman
  end

  def test_double_ending_second
    skip
    assert_equal 'ik am ub ib ilgo', '읽 앎 욻 잂 읽오'.to_roman
  end

  def test_hi
    skip
    assert_equal 'aki ati api achi', '악히 앋히 압히 앚히'.to_roman
  end

  def test_aspiration_t_d
    skip
    assert_equal 'kaji kachi', '갇이 같이'.to_roman
  end

  def test_aspiration_t_d_hi
    skip
    assert_equal 'machi machi', '맏히 맡히'.to_roman
  end

  def test_aspiration_h
    skip
    assert_equal 'maneun anneun', '많은 않는'.to_roman
  end

  def test_ending_shifting
    skip
    assert_equal 'ip pak pak mid mid mid mid', '잎 밬 밖 밑 및 밎 밋'.to_roman
  end

  def test_assimilation_first
    skip
    assert_equal 'irryeon shimni shirra channip', '일년 심리 신라 창립'.to_roman
  end

  def test_assimilation_k_r
    skip
    assert_equal 'ingnip ingnip ingnip ingnip ingnip', '익립 잌립 읶립 읽립 읷립'.to_roman
  end

  def test_assimilation_k_m
    skip
    assert_equal 'ingmul ingmul ingmul ingmul ingmul', '익물 잌물 읶물 읽물 읷물'.to_roman
  end

  def test_assimilation_k_n
    skip
    assert_equal 'ingnyeon ingnyeon ingnyeon ingnyeon ingnyeon', '익년 잌년 읶년 읽년 읷년'.to_roman
  end

  def test_assimilation_t_r
    skip
    assert_equal 'kanneun kanneun kanneun kanneun kanneun kanneun', '갇른 같른 갖른 갗른 갓른 갔른'.to_roman
  end

  def test_assimilation_t_m
    skip
    assert_equal 'kanmul kanmul kanmul kanmul kanmul kanmul ', '갇물 같물 갖물 갗물 갓물 갔물'.to_roman
  end

  def test_assimilation_t_n
    skip
    assert_equal 'kanneun kanneun kanneun kanneun kanneun kanneun', '갇는 같는 갖는 갗는 갓는 갔는'.to_roman
  end

  def test_assimilation_b_r
    skip
    assert_equal 'hyeomneul hyeomneul hyeomneul hyeomneul', '협를 혚를 혎를 혒를'.to_roman
  end

  def test_assimilation_b_m
    skip
    assert_equal 'imman imman imman imman', '입만 잎만 잂만 잆만'.to_roman
  end

  def test_assimilation_b_n
    skip
    assert_equal 'hamni hamni hamni hamni', '합니 핲니 핦니 핪니'.to_roman
  end

  def test_assimilation_d_ss
    skip
    assert_equal 'deusseumnida', '듣씁니다'.to_roman
  end
end
