#reading a timeline
require 'rubygems'
require 'oauth'
require 'json'

# Now you will fetch /1.1/statuses/user_timeline.json,
# returns a list of public Tweets from the specified
# account.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/user_timeline.json"
query   = URI.encode_www_form(
    "screen_name" => "buildsucceeded",
    "count" => 5,
)
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri
twitter_api_key = "F3IDCTfrPYR8aupves2KUU1sj"
twitter_api_secret = "qaqRVc9eeCfESFSesDkrlEDmpYtOQZDXd7jGbwjdIH1e2OiJO5"
twitter_access_token = "141585159-dQHdNsPq4fgYPsuH2mJ0xezKN9rCQQHdpGUN3hYx"
twitter_access_secret = "1FNtCn7AxkcsFPd2KeaETPKpoZQYd3WeINuOpJbqPvdPM"

# Print data about a list of Tweets
def print_timeline(tweets)
  
    puts tweets [0]["user"]["screen_name"]
    puts tweets [0]["text"]

  

end

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Set up OAuth
consumer_key = OAuth::Consumer.new(twitter_api_key, twitter_api_secret)
access_token = OAuth::Token.new(twitter_access_token, twitter_access_secret)

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweets = nil
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
  else
  puts response.code
  puts JSON.parse(response.body)
end
nil
