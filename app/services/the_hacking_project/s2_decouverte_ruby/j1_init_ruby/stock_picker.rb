module TheHackingProject
		module S2DecouverteRuby
				module J1InitRuby
						class StockPicker

                Jour_1 = { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 }
                Jour_2 = { :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 }
                Jour_3 = { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 }
                Jour_4 = { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 }
                Jour_5 = { :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 }
                Jour_6 = { :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 }
                Jour_7 = { :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }
								Jours  = [Jour_1,Jour_2,Jour_3,Jour_4,Jour_5,Jour_6,Jour_7]
								def initialize()
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.new.trader_du_dimanche([1,14,23,1,4,8,5,12])
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.trader_du_dimanche([1,14,23,1,4,8,5,12])
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.new.perform_2
										# TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.trader_du_lundi
								end

                def self.trader_du_dimanche(tableau_prix=[], gain=0, days=[])
                    tableau_prix.each_with_index{|achat,idx| tableau_prix[idx..-1].each_with_index{ |revente,idx_rvt| (res = revente - achat) and (gain = (res > gain)? (days=[idx,idx_rvt+idx] and res) : gain) }}

										p "Le meilleur jour d'achat fût le jour #{days[0]}, et le meilleur jour de revente fût le jour #{days[1]} car il permis de faire le plus haut bénéfice de #{gain}"
                    p "-----------------------------"
										p "tableau de prix: " + tableau_prix.to_s, "gain max: " + gain.to_s,  "jours[top_achat, top_vente]: " + days.to_s
										{days => gain}
                end
                def trader_du_dimanche(tableau_prix=[], gain=0, days=[])
                    tableau_prix.each_with_index{|achat,idx| tableau_prix[idx..-1].each_with_index{ |revente,idx_rvt| (res = revente - achat) and (gain = (res > gain)? (days=[idx,idx_rvt+idx] and res) : gain) }}
      							{days => gain}
                end


                def StockPicker.trader_du_lundi(array_of_hashes_prix=Jours, days=[], new_array=[])
                        array_of_hashes_prix.sample.keys.each do |key|
                            gain = 0
                            array_of_hashes_prix.each_with_index{|achat,idx| array_of_hashes_prix[idx..-1].each_with_index{ |revente,idx_rvt| (res = revente[key] - achat[key]) and (gain = (res > gain)? (days=[idx,idx_rvt+idx] and res) : gain) }}
                            new_array << {key => {days => gain}}
																								p "Le meilleur jour d'achat pour #{key} fût le jour #{days[0]}, et le meilleur jour de revente fût le jour #{days[1]} car il permis de faire le plus haut bénéfice de #{gain}"
																								p "tableau de prix: " + array_of_hashes_prix.map{|company| company[key]}.to_s, "gain max: " + gain.to_s,  "jours[top_achat, top_vente]: " + days.to_s
																								puts "\n-----------------------------\n\n"

                        end
                        new_array
                end
                def trader_du_lundi(array_of_hashes_prix=[], days=[], new_array=[])
                        array_of_hashes_prix.sample.keys.each do |key|
                            gain = 0
                            array_of_hashes_prix.each_with_index{|achat,idx| array_of_hashes_prix[idx..-1].each_with_index{ |revente,idx_rvt| (res = revente[key] - achat[key]) and (gain = (res > gain)? (days=[idx,idx_rvt+idx] and res) : gain) }}
                            new_array << {key => {days => gain}}
                        end
                        new_array
                end


								def perform
									  trader_du_dimanche([17,3,6,9,15,8,6,1,10])
								end

								def perform_2
									  trader_du_lundi([Jour_1,Jour_2,Jour_3,Jour_4,Jour_5,Jour_6,Jour_7])
								end
						end
				end
		end
end
