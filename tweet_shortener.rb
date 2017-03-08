# Write your code here.
require 'pry'

def dictionary
  dictionary = {
  "hello" => "hi",
  "to" => "2",
  "two" => "2",
  "too" => "2",
  "for" => "4",
  "For" => "4", #adding capitalized "For"
  "four" => "4",
  "be" => "b",
  "you" => "u",
  "at" => "@",
  "and" => "&",
  # "what" => "what", #adding this
  # "best" => "best" #adding this
}
end #end method


##### got this from here::: http://stackoverflow.com/questions/41050733/how-to-iterate-through-a-hash-and-an-array-and-replace-words-in-strings

# arry= ["I love chicken!", "I love lamb!", "I love beef!"]
# substitutions = { "love" => "hate", "lamb" => "turkey" }
#
# arry.each_with_index do |str,ind|
#   substitutions.each_key do |word|
#     arry[ind].gsub!(word,substitutions[word]) if str.include?(word)
#   end
# end
# puts arry

##### for the word boundary spacing issue, got this from here: http://stackoverflow.com/questions/27352747/regex-to-match-exact-word-in-string
###  \b in the regex denotes a word boundary.

def word_substituter(string_of_a_tweet)
  tweet_array = string_of_a_tweet.split(" ").to_a #convert string of words in tweet into an array using split, splitting words by the spaces between them
  tweet_array.each_with_index do |element, index| #loop through tweet_array...
    dictionary.each_key do |word| #then loop through each_key in dictionary hash...
      #binding.pry
      tweet_array[index].gsub!(word, dictionary[word]) if element.match(/\b#{word}\b/) #include? and match both change "best" to "bst"... i added /\b#{word}\b/ to make sure only words seperated by spaces are being replaced
    end #end dictionary.each_key loop
  end #end tweet_array.each_with_index loop
    tweet_array.join(" ").to_s #return tweet as a string
end #end method


def bulk_tweet_shortener(array_of_tweets)
  array_of_tweets.each do |element| #loop through each element in array_of_tweets
    #binding.pry
    puts word_substituter(element) #pass each element into the #word_substituter method and output the result
  end #end result.each loop
end #end method


def selective_tweet_shortener(string_of_a_tweet)
  ### note: both lines below work, i went with 'string_of_a_tweet.chars' for the hell of it
  #tweet_array = string_of_a_tweet.split("") #convert string of words in tweet into an array using split, splitting words btwn characters, including spaces.
  tweet_array = string_of_a_tweet.chars #convert string of words in tweet into an array using .chars, which is shorthand for "str.each_char.to_a"

  tweet_array.each do |element| #loop through each character in tweet_array...
    #binding.pry
    if string_of_a_tweet.length > 140 #now tweet_array.length = 30 for first tweet, cuz it is counting the number of words in the tweet, not the number of characters, including spaces...
      return word_substituter(string_of_a_tweet) #need to explicitly say return here! not sure why. perhaps because it's a method???
    else #in other words, if the tweet is less than or equal to 140 characters...
      return string_of_a_tweet #can explicitly say 'return' or not here... again, not sure why
    end #end if statement
  end #end tweet_array.each_with_index loop
end #end method


def shortened_tweet_truncator(string_of_a_tweet)
  tweet_array = string_of_a_tweet.chars #convert string of words in tweet into an array using .chars, which is shorthand for "str.each_char.to_a"

  tweet_array.each do |element| #loop through each character in tweet_array...
    #binding.pry
    if string_of_a_tweet.length > 140 #now tweet_array.length = 30 for first tweet, cuz it is counting the number of words in the tweet, not the number of characters, including spaces...
      #return word_substituter(string_of_a_tweet)[0..139] #this passes the test, but below line is better because it adds ellipsis as last three characters...
      return word_substituter(string_of_a_tweet)[0..136] + "..."#need to explicitly say return here! not sure why. perhaps because it's a method???
    else #in other words, if the tweet is less than or equal to 140 characters...
      return string_of_a_tweet #can explicitly say 'return' or not here... again, not sure why
    end #end if statement
  end #end tweet_array.each_with_index loop
end #end method
