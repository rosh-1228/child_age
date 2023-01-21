# frozen_string_literal: true

require 'minitest/autorun'
require './lib/birth'

class ChildBirthTest < Minitest::Test
  def setup
    @birthday = Date.parse('2021-10-10')
  end

  def test_calculate_age_months
    assert_equal calculate_age_months(@birthday, Date.parse('2022-11-15')), 13
  end

  def test_base_date_before_birthday
    assert_output(child_age(@birthday, Date.parse('2021-10-9'))) { '基準日が誕生日より前の日です。' }
  end

  def test_base_date_equal_birthday
    assert_output(child_age(@birthday, Date.parse('2021-10-10'))) { '生後 0ヶ月' }
  end

  def test_one_day_after_than_birthday
    assert_output(child_age(@birthday, Date.parse('2021-10-11'))) { '生後 0ヶ月' }
  end

  def test_one_month_after_birthday
    assert_output(child_age(@birthday, Date.parse('2021-11-11'))) { '生後 1ヶ月' }
  end

  def test_eight_months_after_birthday
    assert_output(child_age(@birthday, Date.parse('2022-07-03'))) { '生後 8ヶ月' }
  end

  def test_eleven_months_after_birthday
    assert_output(child_age(@birthday, Date.parse('2022-10-09'))) { '生後 11ヶ月' }
  end

  def test_be_one_year_old
    assert_output(child_age(@birthday, Date.parse('2022-10-10'))) { '1歳 0ヶ月' }
  end

  def test_be_one_year_and_seven_months_old
    assert_output(child_age(@birthday, Date.parse('2023-06-07'))) { '1歳 7ヶ月' }
  end

  def test_be_one_year_and_eleven_months_old
    assert_output(child_age(@birthday, Date.parse('2023-10-09'))) { '1歳 11ヶ月' }
  end

  def test_be_two_years_old
    assert_output(child_age(@birthday, Date.parse('2023-10-10'))) { '2歳' }
    assert_output(child_age(@birthday, Date.parse('2024-10-09'))) { '2歳' }
  end

  def test_be_three_years_old
    assert_output(child_age(@birthday, Date.parse('2024-10-10'))) { '3歳' }
  end
end
