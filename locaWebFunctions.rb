class User

	
  def initialize( user_priority, user_name, user_id, tweet_content, tweet_id, tweet_date_time, profil_link, tweet_link, user_number_of_followers, 
  		tweet_number_of_retweets, tweet_number_of_likes ) 
	    @user_priority = user_priority  
		@user_name = user_name  
		@user_id = user_id  
		@tweet_content = tweet_content  
		@tweet_id = tweet_id  
		@tweet_date_time = tweet_date_time  
		@profil_link = profil_link  
		@tweet_link = tweet_link  
		@user_number_of_followers = user_number_of_followers  
		@tweet_number_of_retweets = tweet_number_of_retweets  
		@tweet_number_of_likes = tweet_number_of_likes  
		@number_of_mentions = 1
  end  

  def print_user  
    	puts "Prioridade do Usuario: \t #{@user_priority}"
		puts "Nome do Usuario: \t #{@user_name}"
		puts "ID do Usuario: \t\t #{@user_id}"
		puts "Conteudo do Tweet: \t #{@tweet_content}"
		puts "ID do Tweet: \t\t #{@tweet_id}"
		puts "Data e Hora do Tweet: \t #{@tweet_date_time}"
		puts "Link do Perfil: \t #{@profil_link}"
		puts "Link do Tweet: \t\t #{@tweet_link}"
		puts "Numero de Seguidores: \t #{@user_number_of_followers}"
		puts "Numero de Retweets: \t #{@tweet_number_of_retweets}"
		puts "Numero de Likes: \t #{@tweet_number_of_likes}" 
		puts "Numero de Mentions: \t #{@number_of_mentions} \n\n\n" 
  end 

  def get_userPriority
  		return @user_priority
  end
  def get_userID
  		return @user_id
  end


  def insert(user_priority, tweet_content, tweet_id, tweet_date_time,tweet_link) 
  		@user_priority += user_priority
  		@tweet_content.push(tweet_content)
  		@tweet_id.push(tweet_id)
  		@tweet_date_time.push(tweet_date_time)
  		@tweet_link.push(tweet_date_time)
  		@number_of_mentions += 1
  end

end  

def insert_tweet(tweet,list_tweets)
	


	user_name = tweet.user.screen_name
	user_id = tweet.user.id
	tweet_content = tweet.text
	tweet_id = tweet.id
	tweet_date_time = tweet.created_at
	profil_link = "https://twitter.com/#{user_name}"
	tweet_link = "https://twitter.com/#{user_name}/status/#{tweet_id}"
	user_number_of_followers = tweet.user.followers_count
	tweet_number_of_retweets = tweet.retweet_count
	tweet_number_of_likes = tweet.favorite_count

	user_priority  = user_number_of_followers + (tweet_number_of_retweets * 50 ) + (tweet_number_of_likes * 25)

	if(tweet.in_reply_to_status_id.to_s == '')

	 	if(list_tweets.any?{|a| a.get_userID == tweet.user.id})
	 		
		 	list_tweets.each do |t|
		 		if(t.get_userID == user_id)
		 			t.insert(user_priority, tweet_content, tweet_id, tweet_date_time,tweet_link)
		 		end
		 	end		
	 	else
	 		user = User.new(user_priority,
					user_name,
					user_id,
					[tweet_content],
					[tweet_id],
					[tweet_date_time],
					profil_link,
					[tweet_link],
					user_number_of_followers,
					tweet_number_of_retweets,
					tweet_number_of_likes
				)
	 		puts "HERE1"
			list_tweets.push(user)
	 	end
	 end


end

def insert_tweets(tweets)

	list_tweets = Array.new

	tweets.each do |tweet|

		user_name = tweet.user.screen_name
		user_id = tweet.user.id
		tweet_content = tweet.text
		tweet_id = tweet.id
		tweet_date_time = tweet.created_at
		profil_link = "https://twitter.com/#{user_name}"
		tweet_link = "https://twitter.com/#{user_name}/status/#{tweet_id}"
		user_number_of_followers = tweet.user.followers_count
		tweet_number_of_retweets = tweet.retweet_count
		tweet_number_of_likes = tweet.favorite_count

		user_priority  = user_number_of_followers + (tweet_number_of_retweets * 50 ) + (tweet_number_of_likes * 25)

		 if(tweet.in_reply_to_status_id.to_s == '')

		 	if(list_tweets.any?{|a| a.get_userID == tweet.user.id})
		 		
			 	list_tweets.each do |t|
			 		if(t.get_userID == user_id)
			 			t.insert(user_priority, tweet_content, tweet_id, tweet_date_time,tweet_link)
			 		end
			 	end	
		 	else
		 		user = User.new(user_priority,
						user_name,
						user_id,
						[tweet_content],
						[tweet_id],
						[tweet_date_time],
						profil_link,
						[tweet_link],
						user_number_of_followers,
						tweet_number_of_retweets,
						tweet_number_of_likes
					)
		 		puts "HERE"
				list_tweets.push(user)

		 	end


			
		 end

		
	end
	return list_tweets 
end


def print_list_of_tweets(list_tweets)

	list_tweets.each do |tweet|

		tweet.print_user
		
	end
end

def sorting_list(list_tweets)

	list_tweets = list_tweets.sort_by{|l|l.get_userPriority}.reverse


	print_list_of_tweets(list_tweets)
end



























