require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

module TheHackingProject
		module S2DecouverteRuby
				module J4Nokogiri
						module Projet
        		    class Incubateurs
										def initialize
												puts ";)"
												@path = "app/services/the_hacking_project/s2_decouverte_ruby/j4_nokogiri/projet/"
												# TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::Incubateurs.new.incubateurs
												# the code was completed,can be uploaded on the source if neeeded
										end

                    def incubateurs
                        page = Nokogiri::HTML(open("http://blog.neocamino.com/liste-des-incubateurs-a-paris/"))

                        list_incu= page.css('h2')#.css('img[title="Liste des incubateurs à Paris"]')
                        puts "filtre 1: " + list_incu.count.to_s
                        list_incu2 = list_incu.css('h2+p a')#[title="Liste des incubateurs à Paris]')
                        puts "filtre 2: " + list_incu2.count.to_s

                        list_incu2.each do |incubateur|
                            puts "href " + incubateur['href'].to_s #alt title
														# puts list_incu2[i]

                    # puts name_incu
                    # puts code_incu
                    # puts link_incu
                    # /html/body/section/article/div/div[1]/p[21]/strong
                    # div p
                          # puts incubateur['title'='Liste des incubateurs à Paris']
                        end
                          # div p img.size-full.wp-image-2123.alignleft
                          # div p a img.wp-image-2122.alignleft
                          # div p a img.wp-image-2120.alignleft
                          # div h2
												save_data_in_CSV_file(list_incu2.map{ |incu| incu['href']})
                    end

                    def save_data_in_CSV_file(table_data)  #added
                       CSV.open(File.join(@path, "incubateurs.csv") , "a") do |csv|
                         table_data.each do |elem|
                           csv << [elem]
                         end
                       end
                    end
        		    end
						end
				end
		end
end
