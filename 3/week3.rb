#One tweet to rule them all

tweet = ["This is my very first tweet"]
words = ["quick", "brown", "fox"]

for word in words
	if tweet[word]
		puts "found #{word}"
	else
	puts "didn't find #{word}"
	end
end

words.each { |word| 
	if tweet[word]
		puts "found #{word}"
	else
	puts "didn't find #{word}"
	end
}
