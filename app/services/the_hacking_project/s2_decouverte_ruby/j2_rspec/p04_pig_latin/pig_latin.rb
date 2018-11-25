module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P04PigLatin
        						class PigLatin
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p04_pig_latin/"
                        end

                        def run_spec
                            %x!rspec #{File.join(@path,"pig_latin_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(Rails.root,@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end

# TheHackingProject::S2DecouverteRuby::J2Rspec::P04PigLatin::PigLatin.new.run_spec
# rspec pig_latin_spec.rb --format html --out rspec_results.html
#the code was completed,can be uploaded on the source if neeeded

#write your code here

# teste de consonne ou voyelle
def voyelle?(l)
    list_of_vowels="aeiouyAEIOUY"
    list_of_vowels.each_char do |chr|
      if chr == l then
        return true
      end
    end
    return false
end

def translate_word(word_s)
  # pour chaque lettre
              l=word_s[0]
  #c'est une voyelle
              if voyelle?(l) then
                 word_s << "ay"
  #c'est un le lettre Q ou Qu
              elsif l == "Q" || l == "q"
                  unless word_s[1] == "u" then translate(word_s[1..-1] + l) else translate(word_s[2..-1] + word_s[0..1]) end
  #c'est une consonne
              else
                  translate(word_s[1..-1] + l)
              end
end


def translate(sentence)
    sentence_new   = []
    sentence_words = sentence.split(" ")

    sentence_words.each do |word_s|
        sentence_new << translate_word(word_s)
    end

    sentence_new.join(" ")
end

puts translate("MAis ou Qu'est donc qor ni car")
puts ("MAis ou Qu'est donc or ni car")


# shift
# push

#end of original code
