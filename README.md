See Travis CI continuous integration => [![Build Status](https://travis-ci.org/joscas/to_w.png?branch=master)](https://travis-ci.org/joscas/to_w)

This project adds a new method to the Integer class that allows to represent a given Integer number in words. For example:

```Ruby
106.to_w
=> "one hundred and six"
```
___________________________
To run the tests do:

```
$ bundle install
$ rake
``

Should give the following result:
___________________________

Feature: Express integers in words
  Take a number as an input and print out the equivalent number in British English words
  without using a tokenizer, or any external libraries, clever regex’s or the like.

  Scenario Outline: Example numbers in words                                      # features/integers_to_words.feature:5
    Given an integer number "<number>" its expresion in words should be "<words>" # features/step_definitions/steps.rb:3

    Examples: 
      | number    | words                                                                                                   |
      | 0         | zero                                                                                                    |
      | 1         | one                                                                                                     |
      | 27        | twenty seven                                                                                            |
      | 106       | one hundred and six                                                                                     |
      | 115       | one hundred and fifteen                                                                                 |
      | 2006      | two thousand and six                                                                                    |
      | 3700      | three thousand seven hundred                                                                            |
      | 1000001   | one million and one                                                                                     |
      | 1000101   | one million and one hundred and one                                                                     |
      | 1945781   | one million nine hundred and forty five thousand seven hundred and eighty one                           |
      | 56945781  | fifty six million nine hundred and forty five thousand seven hundred and eighty one                     |
      | 10001001  | ten million one thousand and one                                                                        |
      | 126000010 | one hundred and twenty six million and ten                                                              |
      | 999999999 | nine hundred and ninety nine million nine hundred and ninety nine thousand nine hundred and ninety nine |

14 scenarios (14 passed)
14 steps (14 passed)
