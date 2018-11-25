module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P05BookTitles
        						class Book
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p05_book_titles/"
                            # TheHackingProject::S2DecouverteRuby::J2Rspec::P05BookTitles::Book.new.run_spec
                            # rspec book_titles_spec.rb --format html --out rspec_results.html
                        end

                        def run_spec
                            %x!rspec #{File.join(@path,"book_titles_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            %x!opera #{File.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end


class Book
# write your code here
# make after THP
    attr_accessor :title

    def title=(word)               # creates setter method for title
        @title = titleize(word)
    end

    def titleize(sentence)
          little_words ||= %w{ end over and the a an in of}
          sentence = sentence.capitalize
          words = sentence.split(" ")
          words.map do |word|
            if little_words.include?(word) then word else word.capitalize end
          end.join(" ")
    end
end
