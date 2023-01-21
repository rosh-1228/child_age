# frozen_string_literal: true

require 'date'

def main
  birthday = Date.parse('2021-10-10')

  child_age(birthday, Date.parse('2022-3-9'))
  child_age(birthday, Date.parse('2022-11-15'))
  child_age(birthday, Date.parse('2024-3-21'))
  child_age(birthday, Date.parse('2011-5-11'))
end

def child_age(birthday, base_date)
  puts birthday > base_date ? '基準日が誕生日より前の日です。' : show_age(calculate_age_months(birthday, base_date))
end

def calculate_age_months(birthday, base_date)
  age_months = (base_date.year * 12 + base_date.month) - (birthday.year * 12 + birthday.month)

  age_months -= 1 if birthday.day > base_date.day
  age_months
end

def show_age(age_months)
  case age_months
  when 0..11
    puts "生後 #{age_months}ヶ月"
  when 12..23
    year = age_months / 12
    month = age_months - year * 12
    puts "#{year}歳 #{month}ヶ月"
  else
    year = age_months / 12
    puts "#{year}歳"
  end
end

main
