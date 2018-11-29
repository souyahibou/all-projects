module TheHackingProject
		module S2DecouverteRuby
				module J1InitRuby
						class CompterLesMots
                def initialize()
									   @path = "app/services/the_hacking_project/s2_decouverte_ruby/j1_init_ruby"
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::CompterLesMots.new.jean_michel_data
                    # TheHackingProject::S2DecouverteRuby::J1InitRuby::CompterLesMots.new.perform_shakespeare
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::CompterLesMots.new.perform_test
                end

                def jean_michel_data(corpus, dictionary)
									  corpus     = exist_file(corpus)? read_file(corpus) : corpus   #added can be deleted
									  dictionary = check_format(dictionary)												  #added can be removed
										dictionary.map do |word|
											 [word ,corpus.gsub(word).count]
										end.select{|word,occurence| occurence>0}.to_h
                end
#########################################################################################"""
								def read_file(file_name)
									file = File.open(Dir[File.join(@path, file_name)].first, "r")
									data = file.read
									file.close
									return data
								end

								def exist_file(file_name)
										begin File.exist?(Dir[File.join(@path, file_name)].first)	rescue false end
								end


								def check_format(str)
									p str
									  return str 											 if str.class == Array
										return read_file(str).split(" ") if exist_file(str)
										return str.split(" ")						 if str.class == String
										return str
								end
###########################################################################################"""

								def perform_test
                    dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

										puts "\njean_michel_data(\"below\", dictionary)"
                    p jean_michel_data("below", dictionary)

										puts "\n----------------------\n\n"

										p 'jean_michel_data("Howdy partner, sit down! How\'s it going?", dictionary)'
                    p jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)
                    puts "\n\n"
								end

								def perform_shakespeare
									  puts "usualWords"
									  dictionary = ["the", "of", "and", "to", "a", "in", "for", "is", "on", "that", "by", "this", "with", "i", "you", "it", "not", "or", "be", "are"]

										p jean_michel_data(("ressources/shakespeare*txt"), dictionary)
										puts "\n----------------------\n\n swearWords"

										p jean_michel_data(("ressources/shakespeare*txt"),"ressources/swearWords*txt")
										return nil
								end
						end
				end
		end
end
