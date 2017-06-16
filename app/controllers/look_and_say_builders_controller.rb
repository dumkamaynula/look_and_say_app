class LookAndSayBuildersController < ApplicationController

	def result
	end

	def calculation
	  @string = params[:string]

	#Analize the string if it has one or few words.
		@queries = @string.split() if @string.present? #/\W+/
	#If the string is composite, 
		if @queries.present? and @queries.size > 1
	#create a hash with a key-counter and an array for every word.	
			@words = {}
			@key = (-1) 
	#Create the array for each word  
			@queries.each do |word|
	#which starts from the word and will contain look-and-say sequence.
				array = [word]
	#Check the length of the word
			if word.size == 1	
	# if it consists from 1 character, 
	#build the longer sequence by using an iteration with a reqular expression of the last value in the array.
			  4.times do
			    array << array.last.gsub(/(.)\1*/) { |x| x.size.to_s + x.first} 
	# Explanation: The regular expression of gsub method means that it gets the string (//)
	# and matches any single character of it(/(.)/).
	# Second part of the regular expression (\1) indicates and compares each previous character for duplicate,
	# in case when duplicate is not match, reqular expression ignores it by (*).
	# So \1* means zero or more duplicates of previous character.	
	# The regular expression for any digits only and their zero or more duplicates will be /(\d)\1*/ or /([0-9]\1*)/, 
	# The regular expression for word characters (letters, numbers, underscores) will be /(\w)\1*/ or /([a-z]\1)
	# Like an option \1* part can be replaced by \1{0,}
				end
			else
	#If the word consists of few characters,
	#build the short sequence
				2.times do	
					array << array.last.gsub(/(.)\1*/) { |x| x.size.to_s + x.first} 
				end
			end
	#Add the look and say sequence for the word in hash	
				@key += 1 
				@words[@key] = array
			end

	#And store all data to result variable
			@formated_text = @words.values.map{ |v| v.join(', ') }.join(" || ")
			@result = @formated_text
	#If the string consists only from one word,
	#Implement for it the logic described before without using a hash
		elsif @string.present?
			@array = [@string]
			if @string.size == 1

				
			  4.times do
			    @array << @array.last.gsub(/(.)\1*/) { |x| x.size.to_s + x.first} 
				end
				@result = @array.join(', ')
			else
				
			  2.times do
			    @array << @array.last.gsub(/(.)\1*/) { |x| x.size.to_s + x.first} 
				end
				@result = @array.join(', ')
			end
		end

	end


end
