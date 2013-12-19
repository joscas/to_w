# Using metaprograming to add a new 'to_w' method to the Integer class
class Integer
  # Create a class variable with all base numbers in english
  @@english_numbers = {
    # Use symbols to for resource efficency
    :'0' => 'zero',
    :'1' => 'one',
    :'2' => 'two',
    :'3' => 'three',
    :'4' => 'four',
    :'5' => 'five',
    :'6' => 'six',
    :'7' => 'seven',
    :'8' => 'eight',
    :'9' => 'nine',
    :'10' => 'ten',
    :'11' => 'eleven',
    :'12' => 'twelve',
    :'13' => 'thirteen',
    :'14' => 'fourteen',
    :'15' => 'fifteen',
    :'16' => 'sixteen',
    :'17' => 'seventeen',
    :'19' => 'nineteen',
    :'20' => 'twenty',
    :'30' => 'thirty',
    :'40' => 'forty',
    :'50' => 'fifty',
    :'60' => 'sixty',
    :'70' => 'seventy',
    :'80' => 'eighty',
    :'90' => 'ninety',
    :'100' => 'hundred',
    :'1000' => 'thousand'
  }
  # Create a class variable with the names for 10^n
  @@structure = [
    [6,'million'],
    [3,'thousand'],
    [2,'hundred']
  ]

  # Add a new method to the Integer class to generate the written format of a number
  def to_w # to_w is for 'to words'
    # Numbers up to 20 are quite irregular. We need a specific block of code for tens
    tens = lambda do |x|
      if x < 20
        @@english_numbers[x.to_s.to_sym]
      else
        decs = x.to_s[0] + '0'
        units = x.to_s[-1]
        "#{@@english_numbers[decs.to_sym]} #{@@english_numbers[units.to_sym]}"
      end
    end
    # Use a recursive lambda to call itself as many times as needed until the whole number is written
    sentence = lambda do |num|
      num_length = num.to_s.length
      if num_length < 3 # If number is lower than 99 use tens block
        tens.call(num)
      else
        # Create a temporary hash to keep track of the magnitude of the piece of number we are working with
        new_structure = @@structure.select{|k,v| [k,v] if k<num_length}
        digits = new_structure[0][0]
        following_digits = (new_structure.length == 1) ? 2 : new_structure[1][0]
        word = new_structure[0][1]
        if num <= (10**digits - 1) # Get feeper into recursion if the number is smaller than the current order of magnitude
          sentence.call(num)
        else
          # Split the word into a part belonging to the current order of magnitude and a rest
          left = num.to_s[0..-(digits+1)].to_i
          rest = num.to_s[-digits..-1].to_i
          # Apply English grammar rules and exectute the same code recursively onto each side
          if rest == 0
            "#{sentence.call(left)} #{word}"
          elsif rest < 10**following_digits
            "#{sentence.call(left)} #{word} and #{sentence.call(rest)}"  
          else
            "#{sentence.call(left)} #{word} #{sentence.call(rest)}"
          end
        end
      end
    end
    # Execute the recursive lambda
    sentence.call(self)
  end
end