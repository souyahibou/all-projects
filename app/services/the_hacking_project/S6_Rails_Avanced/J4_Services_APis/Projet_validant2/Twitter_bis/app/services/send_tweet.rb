class SendTweet
	def initialize param1
			log_in_to_twitter
			@message = param1
			puts "Message succesfull init : #{param1}"
	end

	def log_in_to_twitter
			@client = Twitter::REST::Client.new do |config|
			  config.consumer_key        = "mssyox4dMvQ1kXd6gZmmceYWn"
			  config.consumer_secret     = "MXGoQ4xnqgvemd2hShQQCu2o5RJOCOqo1c8qAl5uJHFMm7Zbdf"
			  config.access_token        = "918099113186611200-YI6XQpz7l1HiScYcAXmQ8tVnARIxi6P"
			  config.access_token_secret = "9UBkLsGEXlIEBrTgsY7wR3fO0vwtwUt81zPOhnicKQeGT"
			end

			#client.search("#ruby").take(50).each do |tweet|
			#  puts tweet.text
			#end

			puts "congratulation you are log in on the twitter APi (sur but not certain) "
	end

	def send_tweet param2
			@client.update("I'm tweeting with twitter_gem : #{param2}")
	end

	def perform
			send_tweet @message
			puts "run is good"
	end
end
