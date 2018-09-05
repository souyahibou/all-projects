END {   puts "Terminating du Programme de scrap des ESN"}
BEGIN { puts "Initialition du programme de scrap des toutes les ESNs répertoriés dans le site carrier info"}
#This programme use nokogiri, URI(encode), CSV, begin rescue end, str = "\x12\x34\x56\x78\x9a\xbc\xde\xf1\x23\x45\x67\x89\xab\xcd\xef\x12\x34\x56\x78\x9a".force_encoding('ASCII-8BIT'),scan(/Regex/),hash,array,gsub(/regex/,"new text"), BEGIN END
require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'nokogiri'
require 'open-uri'
require 'uri'

class ScrapCarrierInfo  #project made with Christian Monkam
      private
          def scrap_links_for_all_webpages(deb, fin)
              tab_data_for_all_product =[]
              esns=[]
              for i in (deb..fin)
                     puts i
                     #societe_0
                     link = open("https://www.carriere-info.fr/annuaire/Ile-de-France-Recherche+SSII-ESN?p=" + i.to_s)
                     page = Nokogiri::HTML(link)
                     esns=[]
                     for i in(0..9)
                          begin esns << page.css('#societe_' + i.to_s + ' > div > div.rleft > a.o10b.u').attr('href').value rescue "none" end
                     end
                     # can be merge
                     esns.each do |esn|
                          esn.force_encoding('ASCII-8BIT')
                          esn = URI::encode(esn)
                          if esn.ascii_only? || esn.eql?("none")
                              link_esn = open(esn)
                              page = Nokogiri::HTML(link_esn)
                              page_cntct =  link_esn.base_uri.to_s
                              name_cntct =  page.css('body > div.encadre_page > div.corp_l1c > div.cf > div.col-two-thirds.right > div > h1').text
                              img_cntct  =  begin page.css('body > div.encadre_page > div.corp_l1c > div.cf > div.col-third.left > div:nth-child(1) > div > div > img').attr('src').value rescue "error" end
                              web_cntct  =  begin page.css('body > div.encadre_page > div.corp_l1c > div.cf > div.col-third.left > div:nth-child(1) > div > a.b9b').attr('href').value rescue "error" end

                              cntct = page.css('body > div.encadre_page > div.corp_l1c > div.cf > div.col-third.left > div:nth-child(1) > div').children.text.gsub(/[\n\t\r]{2,}/,'|')

                              # rue_cntct =  begin cntct.scan(/(:?[\|\^\D])([0-9]{1,3}(?:(?:[,. ]){1}[-a-zA-Zàâäéèêëïîôöùûüç]+){3,})/)[0][1]rescue "error" end #not finish
                              rue_cntct  = begin cntct.scan(/(?:\||)(\d)(.+)(?:[\|][0-9]{5}\D+?)/)[0].join("")         rescue "error" end
                                cp_cntct = begin cntct.scan(/([0-9]{5})(\D+?)(France)/)[0][0]                          rescue "error" end
                              city_cntct = begin cntct.scan(/([0-9]{5})(\D+?)(France)/)[0][1]                          rescue "error" end
                              pays_cntct = begin cntct.scan(/[\|\^]([0-9]{5}\D+?)(\||France)/)[0][1]                   rescue "error" end
                              tel_cntct  = begin cntct.scan(/Tel : ((?:0|\+33|0033)(?:(?:\W){0,2}[0-9]){8,24})/)[0][0] rescue "error" end
                              tail_cntct = begin cntct.scan(/Taille :(([\w\W]+?)employés)/)[0][0][1..-1]               rescue "error" end

                               warning = "none"
                          else
                               name_cntct = nil; img_cntct  = nil; web_cntct  = nil; rue_cntct  = nil; cp_cntct = nil; city_cntct = nil; pays_cntct = nil; tel_cntct  = nil; tail_cntct = nil
                               warning = esn + "hasn't bee scraped: url not only in ascii or doesn't exist"
                          end
                               tab_data_for_all_product << { url: page_cntct.to_s, name: name_cntct.to_s, rue: rue_cntct.to_s, cp: cp_cntct.to_s, ville: city_cntct.to_s, pays: pays_cntct.to_s , tel: tel_cntct.to_s, tail: tail_cntct.to_s, site: web_cntct.to_s, img: img_cntct.to_s, warning: warning.to_s}
                      end
              end #tab_data_for_all_product.each{ |a| p a ;p ""}
              return tab_data_for_all_product
          end

          def save_data_in_CSV_file(table_data)
             CSV.open("the_scrap_carrier_info.csv", "a") do |csv|
               csv << table_data.sample.keys
               for i in 1..table_data.length
                 csv << [ table_data[i-1][:url], table_data[i-1][:name], table_data[i-1][:rue], table_data[i-1][:cp], table_data[i-1][:ville], table_data[i-1][:pays], table_data[i-1][:tel], table_data[i-1][:tail], table_data[i-1][:site], table_data[i-1][:img], table_data[i-1][:warning]]
               end
             end
          end

          def program_text_replacement(file_name, search_regexp, replacement_string)
              text = File.read(file_name)
              new_contents = text.gsub(search_regexp, replacement_string)#/search_regexp/
              File.open(file_name, "w") {|file| file.puts new_contents }
          end
      #################################################################################################################################################################
      #################################################################################################################################################################
      public
          def program_scrap_carrierinfo()
              tab = []
              tab = scrap_links_for_all_webpages( 1,42 )
              save_data_in_CSV_file(tab)
              tab
          end
      #################################################################################################################################################################
      #################################################################################################################################################################

          def perform
              puts "there is one program of scrap, dont forget to delete the CSV file already generated"
              tab = []
              tab = program_scrap_carrierinfo()
              program_text_replacement("the_scrap_carrier_info.csv", /&AMP;/, "&")
              tab
          end
end
