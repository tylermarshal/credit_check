card_number = "4929735477250543"
separate_card_numbers = card_number.each_char.map(&:to_i)
valid = false

# if card_number.length == 16
#   card_type = "Most"
# elsif card_number.length == 15
#   card_type = "Amex"
# else
#   puts "Based on the length of the number you provided, this is not a valid account number."
# end
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
end

def doubled_card_number()

def find_number_over_9(card_number)
  doubled_card_number = double_every_other_digit(card_number)
#finds any numbers over 9 in the doubled_card_number and returns its index number
  doubled_card_number.each_with_index.select { |num, index| num > 9 }.map { |pair| pair[1] }
end

def sum_values_over_9(card_number)
  doubled_card_number = double_every_other_digit(card_number)
  #determines how many numbers are over 9 so we can iterate through and sum the digits of that many numbers
  number_of_times = find_number_over_9.length
  update_index = 0
#loops through each index number previously found in the doubled_card_number and sums its digits
  until update_index == number_of_times
  doubled_card_number[find_number_over_9[update_index]] = doubled_card_number[find_number_over_9[update_index]].to_s.chars.map(&:to_i).inject(0){|sum,x| sum + x }
  update_index += 1
  end
end

sum_values_over_9
# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
