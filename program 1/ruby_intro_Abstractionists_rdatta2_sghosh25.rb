# Part 1
def two_sum?(a, n)
  element_count = Hash.new(0)

  a.each do |num|
    complement = n - num

    # If complement exists in the element_count hash and either:
    # 1. It's a different element, or
    # 2. It's the same element but there are more than one of them,
    # then we have a valid pair.
    if element_count.key?(complement) && (complement != num || element_count[complement] > 1)
      return true
    end

    # Increment the count for the current element.
    element_count[num] += 1
  end

  false
end

def max_sub_array(a)
  return 0 if a.empty?

  max_sum = current_sum = a[0]

  a[1..].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

def group_anagrams(a)
  grouped_anagrams = Hash.new { |hash, key| hash[key] = [] }

  a.each do |word|
    sorted_word = word.chars.sort.join
    grouped_anagrams[sorted_word] << word
  end

  grouped_anagrams.values
end

# Part 2
def brackets_match?(s)
  stack = []

  s.each_char do |char|
    case char
    when '(', '[', '{'
      stack.push(char)
    when ')'
      return false if stack.empty? || stack.pop != '('
    when ']'
      return false if stack.empty? || stack.pop != '['
    when '}'
      return false if stack.empty? || stack.pop != '{'
    end
  end

  stack.empty?
end

def remove_and_append_vowels(s)
  vowels = "AEIOUaeiou" # Define a string containing all vowels

  # Initialize variables to store characters with and without vowels
  without_vowels = ""
  with_vowels = ""

  s.each_char do |char|
    if vowels.include?(char)
      with_vowels += char
    else
      without_vowels += char
    end
  end

  # Append the characters with vowels to the characters without vowels
  result = without_vowels + with_vowels

  result
end

def highest_frequency_word(s)
  words = s.downcase.scan(/\w+/) # Split the sentence into words and convert to lowercase
  word_count = Hash.new(0)

  words.each do |word|
    word_count[word] += 1
  end

  max_frequency = word_count.values.max
  most_frequent_words = word_count.select { |_word, count| count == max_frequency }

  most_frequent_words.keys.first
end

# Part 3
class Book
  attr_reader :title
  attr_accessor :price

  def initialize(title, price)
    validate_inputs(title, price)
    @title = title
    @price = price
  end

  def price=(new_price)
    validate_price(new_price)
    @price = new_price
  end

  def formatted_price
    dollars = price.to_i
    cents = ((price - dollars) * 100).to_i

    if dollars > 0
      if cents > 0
        "#{dollars} #{dollars == 1 ? 'dollar' : 'dollars'} and #{cents} #{cents == 1 ? 'cent' : 'cents'} only"
      else
        "#{dollars} #{dollars == 1 ? 'dollar' : 'dollars'} only"
      end
    else
      "#{cents} #{cents == 1 ? 'cent' : 'cents'} only"
    end
  end

  private

  def validate_inputs(title, price)
    raise ArgumentError, 'Title cannot be nil or empty' if title.nil? || title.empty?
    validate_price(price)
  end

  def validate_price(price)
    raise ArgumentError, 'Price cannot be nil or less than or equal to zero' if price.nil? || price <= 0
  end
end

