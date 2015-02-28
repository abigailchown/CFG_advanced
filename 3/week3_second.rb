#All the tweets all the time

tweets = ["This is my very first tweet", 
	"The quick brown fox jumped over the angry bird", 
	"#{} #ftw #omg #lolz"
]
words = ["quick", "brown", "fox"]

for tweet in tweets
	for word in words
		if tweet[word]
			puts "found #{word} in #{tweet}"
		else
			puts "didn't find #{word} in #{tweet}"
		end
	end
end
