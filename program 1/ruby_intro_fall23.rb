# Part 1
def two_sum?(a, n)
  # ADD YOUR CODE HERE
  sums = a.permutation(2).to_a.map {|ele_sum| ele_sum.sum}
  return sums.find {|x| x==n} != nil
end

def max_sub_array(a)
  # ADD YOUR CODE HERE
  return (1..a.length).flat_map { |ele| a.each_cons(ele).to_a }.map {|ele_sum| ele_sum.sum}.sort[-1]
end

def group_anagrams(a)
  # ADD YOUR CODE HERE
  return a.group_by{|str| str.chars.sort}.values
end

# Part 2
def brackets_match?(s)
  # ADD YOUR CODE HERE
  stk = []
  for ele in s.chars
    stk.push(ele)
    if(ele == ')' and stk.include?('('))
      while (stk.pop != '(')
      end
    elsif(ele == ']' and stk.include?('['))
      while (stk.pop != '[')
      end
    elsif(ele == '}' and stk.include?('{'))
      while (stk.pop != '{')
      end
    end
  end
  return (stk.length == 0)
end

def remove_and_append_vowels(s)
  # ADD YOUR CODE HERE
  vowels = ['a','e','o','u','A','E','I','O','U']
  s = s.chars
  vows = s.select {|ele| vowels.include?(ele)}
  s.delete_if {|ele| vowels.include?(ele)}
  res = s.join
  res = res + vows.join
  return res
end

def highest_frequency_word(s)
  # ADD YOUR CODE HERE
  li = {}
  grp = s.downcase.split.group_by {|ele| ele}
  for key in grp.keys
    li[key] = grp[key].length
  end
  
  li = li.to_a
  larg = li[0]

  for ele in li
    if ele[1] > larg[1]
      larg = ele
    end
  end
  return larg[0]
end

# Part 3
class Book
  # ADD YOUR CODE HERE
  def initialize(title, price)
    raise(ArgumentError) if (title == nil || price == nil)
    @title = title
    @price = price
  end

  def title
    return @title
  end
  
  def title=(new_title)
    raise(ArgumentError) if (new_title == nil)
    @title=new_title
  end

  def price
    return @price
  end

  def price=(new_price)
    raise(ArgumentError) if (new_price == nil)
    @price=new_price
  end

  def formatted_price()
    dollars = Integer(@price)
    cents = Integer((@price*100)%100)
    str = ""

    if(dollars == 1)
      str += "1 dollar "
    elsif(dollars > 1)
      str += String(dollars) + " dollars "
    end

    if(dollars > 0 && cents > 0)
      str += " and "
    end

    if(cents == 1)
      str += "1 cent "
    elsif(cents > 1)
      str += String(cents) + " cents "
    end

    str += "only"
    return str
  end

end
