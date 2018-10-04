module TheHackingProject
		module S2DecouverteRuby
				module J1InitRuby
						class ChiffreDeCesar

								def initialize(text="yo gringo", code=26)
										chiffre_de_cesar(text, code)
								end

								def chiffre_de_cesar(text, code)
								    new_text=[]
								    text.each_char do |chr|
												code = code % 26
												new_code = chr.ord + code
												new_chr = chr

												case chr.ord
												when 97..122 then new_chr=(((new_code - 97) % 26) + 97).chr;
												when 65..90 then  new_chr=(((new_code - 65) % 26) + 65).chr;
												when 32 then
												else
												end
												# puts chr + " = #{chr.ord}" + " #{new_code}  = #{new_chr}"   #test
												new_text << new_chr
								    end
										new_text.join("")
								end

								def perform
									chiffre_de_cesar("Salut Cousin", 123)
									# chiffre_de_cesar("azAZ '\" \t \b", 26)
								end
						end
				end
		end
end
# TheHackingProject::S2DecouverteRuby::J1InitRuby::ChiffreDeCesar.new.chiffre_de_cesar("test", 27)
