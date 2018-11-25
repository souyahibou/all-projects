module TheHackingProject
		module S2DecouverteRuby
				module J1InitRuby
						class SumOfMultiples
								def sum_of_multiples(*multiples, nbr_begin, nbr_end)
                    puts "Affichage de la somme de multiple de #{multiples[0..-2]} et de #{multiples[-1]} de #{nbr_begin} à #{nbr_end}";
                    somme=0;
                    ensemble=(nbr_begin..nbr_end).to_a;

                    for i in ensemble
                        catch :next_number do
                            multiples.each do |multiple|
                                if i%multiple==0
                                    somme+=i;
                                    throw :next_number
                                end
                            end
                        end #reach directly when :next_number is thrown
                    end
                    return "#{somme} is the result of multiples sum of #{multiples} in #{ensemble}"
								end

								def perform
                   #before transformation
                    puts "Affichage de la somme de multiple de 5 et de 3 de 0 à 1000";

                    somme=0;
                    ensemble=(0..1000).to_a;

                    puts "#{somme} #{ensemble}";

                    for i in ensemble
                      if i%3==0 || i%5==0++
                        somme+=i;
                      end
                    end

                    print "Le résultats de la somme des multiples est #{somme}";

								end
						end
				end
		end
end

# print(sum(i for i in range(1, 1000) if i%3 == 0 or i%5 == 0))

#SumOfMultiples.rb=>Sum_of_multiple.rb


#
# module TheHackingProject
# 		module S2DecouverteRuby
# 				module J1InitRuby
# 						class SumOfMultiples
# 								def sum_of_multiples(*nbrs, debut, fin)
#
# 								end
# 						end
# 				end
# 		end
# end
# TheHackingProject::S2DecouverteRuby::J1InitRuby::SumOfMultiples.new.sum_of_multiples("test", 27)
