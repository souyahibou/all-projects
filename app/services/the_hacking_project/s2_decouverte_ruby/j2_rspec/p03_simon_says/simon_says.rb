#write your code here
# make after THP

module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P03SimonSays
        						class SimonSays
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p03_simon_says/"
                            # TheHackingProject::S2DecouverteRuby::J2Rspec::P03SimonSays::SimonSays.new.run_spec
                            # rspec simon_says_spec.rb --format html --out rspec_results.html
                        end

                        def run_spec
                            %x!rspec #{File.join(@path,"simon_says_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            %x!opera #{File.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end




def echo(word)
    return word
end

def shout(word)
    word.upcase
end

def repeat(word, nbr=2)
    return ([word] * nbr) * " "
end

def start_of_word(word, nbr)
    word[0...nbr]
end

def first_word(word)
    word.split(" ")[0]
end

def titleize(sentence)
      little_words ||= %w{ end over and the }
      sentence = sentence.capitalize
      words = sentence.split(" ")
      words.map do |word|
        if little_words.include?(word) then word else word.capitalize end
      end.join(" ")
end
