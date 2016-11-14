load 'locaWebFunctions.rb'
require 'tweetstream'
require 'twitter'
require 'yaml'

list_of_users = Array.new
list_of_tweets_sorted = Hash.new


client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "HQjKNz6Pe7I9Q9QpJLfFVkKmR"
  	config.consumer_secret     = "0hRspkB2AotkVxQdWy7QDG8MdJTC6E3cRwpNJKbpb1kOOJBzSk"
  	config.access_token        = "797426073566937088-VPK9jKthBvQXIgniIWPS8cn28MGRVoe"
  	config.access_token_secret = "p5jdLtbGrkFrwHcG8WugUPNSTO3cOJ5EsSDpQLU9mr0TC"
end

client = Twitter::Streaming::Client.new do |config|
	config.consumer_key        = "HQjKNz6Pe7I9Q9QpJLfFVkKmR"
  	config.consumer_secret     = "0hRspkB2AotkVxQdWy7QDG8MdJTC6E3cRwpNJKbpb1kOOJBzSk"
  	config.access_token        = "797426073566937088-VPK9jKthBvQXIgniIWPS8cn28MGRVoe"
  	config.access_token_secret = "p5jdLtbGrkFrwHcG8WugUPNSTO3cOJ5EsSDpQLU9mr0TC"
end


# tweets = client.search('@locaweb').take(10)
# list_of_users = insert_tweets(tweets)

# sorting_list (list_of_users)

topics = ["lucasink", ""]
client.filter(track: topics.join(",")) do |object|
	if object.is_a?(Twitter::Tweet)
		
		insert_tweet(object,list_of_users)
		print_list_of_users(list_of_users)
	
	end
end



# # tweets = client.user_timeline('locaweb', count: 5)



# print_list_of_users(list_of_users)

# File.write('tweets_j.yml', YAML.dump(tweets))






# tweets = YAML.load_file('tweets_j.yml')


# tweets.each do |tweet|

# 	if(tweet.in_reply_to_user_id == 15020362) 

# 		# print "TWEET: "
# 		# puts tweet.full_text
# 	end

# end


