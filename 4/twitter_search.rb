#reading a timeline
require 'rubygems'
require 'oauth'
require 'json'
require './keys'

# Now you will fetch /1.1/statuses/user_timeline.json,
# returns a list of public Tweets from the specified
# account.
baseurl = "https://api.twitter.com"
path = "/1.1/search/tweets.json?q="
query = "micropig"

address = URI("#{baseurl}#{path}#{query}")
request = Net::HTTP::Get.new address.request_uri

# Print data about a list of Tweets
def print_timeline(response)
  
  tweets = response["statuses"]
  
  for tweet in tweets
      puts tweet["user"]["screen_name"]
      puts tweet["text"]
  end
  
end

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Set up OAuth
consumer_key = OAuth::Consumer.new($twitter_api_key, $twitter_api_secret)
access_token = OAuth::Token.new($twitter_access_token, $twitter_access_secret)

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
#puts tweets
  else
  puts response.code
  puts JSON.parse(response.body)
end

tweets
