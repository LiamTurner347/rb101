# Write a method that takes a sentence string as input, and returns the same string 
# with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Input: A string
# Output: The same string but mutated and with any words which represent a number transformed to their integer equivalent

# Algorithm: 
  # We need to return the same string here so we need to ensure that the methods we use are mutating and do not return a new string. 
  # We can use the #gsub! method to mutate the input string. 
  # As we have multiple values that we are replacing, we can use a hash as a translation dictionary and save this into a CONSTANT so that it is available within the method. 

NUMBERS = {
  "zero" => "0",  
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

def word_to_digit(string)
  NUMBERS.each { |k, v| string.gsub!(k, v) }
  string
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') # == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end



#Further Explorations: remove spaces between numbers and format as a phone number

ALPHABET_DIGIT = {
  "zero" => "0",
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9"
}

def word_to_digit(words)
  ALPHABET_DIGIT.each do |k, v|
    words.gsub!(/#{k}\s+/, v)
    words.gsub!(/#{k}/, v)
  end
  # find the sequence of consecutive string of digits
  ten_digit = words.gsub(/[^0-9]/, "")
  phone_num = format_phone_number(ten_digit)
  words.gsub!(ten_digit, phone_num)
end

def format_phone_number(string_num)
  area_code, phone1, phone2 = string_num[0, 3], string_num[3, 3], string_num[6, 4]
  "(#{area_code})#{phone1}-#{phone2}"
end

p word_to_digit('Please call me at four zero three five five five one two three four. Thanks.'
#=>"Please call me at (403)555-1234. Thanks."