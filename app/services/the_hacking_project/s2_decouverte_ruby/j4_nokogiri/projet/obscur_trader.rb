require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

module TheHackingProject
		module S2DecouverteRuby
				module J4Nokogiri
						module Projet
        		    class ObscurTrader
                    def initialize
                        puts " ;)"
                        @path = "app/services/the_hacking_project/s2_decouverte_ruby/j4_nokogiri/projet/"
                        # TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::ObscurTrader.new.obscur_trader
                        # the code was completed,can be uploaded to the source if neeeded
                    end

                    def obscur_trader
                        loop{
                              page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

                              currency_name  = page.css('td.no-wrap.currency-name a[class*=currency-name-container]')
                              currency_price = page.css('a.price')


                              virtual_currency = Hash.new { |hash, key| hash[key] =  "not defined" }
                              currency_name.each_with_index { |c_name, idx|  virtual_currency[c_name.content] = currency_price[idx].text} if currency_name.count == currency_price.count
                              virtual_currency.each_with_index {|(key, value),index| puts "n°#{index} \t #{key} \t is \t #{value}" }; nil

															@virtual_currency=virtual_currency
                              cpt ||= save_data_in_CSV_file(virtual_currency) && 0
                              cpt  += 1
                              break if cpt > 0 # instead of 5
                              sleep(3600)
                              puts "\n\nMAJ"
                            }
														@virtual_currency
                    end

                    def save_data_in_CSV_file(table_data)
                       CSV.open(File.join(@path, "obscur_trader.csv") , "a") do |csv|
                         table_data.to_a.each do |elem|
                           csv << elem
                         end
                       end
                    end
        		    end
						end
				end
		end
end
