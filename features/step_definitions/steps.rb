require './to_w'

Given(/^an integer number "(.*?)" its expresion in words should be "(.*?)"$/) do |arg1, arg2|
  arg1.to_i.to_w.should eql arg2
end