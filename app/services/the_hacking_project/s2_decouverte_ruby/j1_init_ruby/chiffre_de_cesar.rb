module TheHackingProject
		module S2DecouverteRuby
				module J1InitRuby
						class ChiffreDeCesar

								def initialize(text, code)
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

									    puts new_text.join("")
											new_text.join("")
								end

								def perform
									chiffre_de_cesar("Salut Cousin", 123)
									chiffre_de_cesar("azAZ '\" \t \b", 26)
								end
						end
						ChiffreDeCesar.new("test", 27)
				end
		end
end
