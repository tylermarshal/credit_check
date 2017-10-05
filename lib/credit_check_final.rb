card_number = "4929735477250543"
separate_card_numbers = card_number.each_char.map(&:to_i)
valid = false

# Your Luhn Algorithm Here
def double_every_other_digit(card_number)
  card_number[14] = (card_number[14] * 2)
  card_number[12] = (card_number[12] * 2)
  card_number[10] = (card_number[10] * 2)
  card_number[8] = (card_number[8] * 2)
  card_number[6] = (card_number[6] * 2)
  card_number[4] = (card_number[4] * 2)
  card_number[2] = (card_number[2] * 2)
  card_number[0] = (card_number[0] * 2)
  card_number
end

def sum_values_over_9(card_number)
  doubled_card_number = double_every_other_digit(card_number)
  doubled_card_number.map do |number|
    if number > 9
      number.to_s.chars.map(&:to_i).inject(0){|sum,x| sum + x }
    else
      number
    end
  end
end

def add_all_numbers(card_number)
  sum_digits_card_number = sum_values_over_9(card_number)
  if sum_digits_card_number.inject(0){|sum,x| sum + x } % 10 == 0
    puts "The card number is valid."
  else
    puts "The card number is invalid."
  end
end

add_all_numbers(separate_card_numbers)
