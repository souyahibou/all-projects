END {   puts "Terminating du Programme de scrap des toutes les VC"}
BEGIN { puts "Initialition du Programme de scrap des toutes les Ventures Capitals(VC) répertoriés dans le site journal du net"}
#This programme use nokogiri, URI(encode), CSV, begin rescue end, str.force_encoding('ASCII-8BIT'),scan(/Regex/),hash,array,sub/gsub(/regex/,"new text"), BEGIN END
require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'nokogiri'
require 'open-uri'
require 'uri'

class ScrapJournalDuNet  #project made with Christian Monkam
      private
          def initialize
              @nom_CSV_file = 'the_scrap_journal_du_net.csv'

          end
          def scrap_links_for_all_webpages(deb, fin)
              tab_data_for_all_product =[]
              http_head = "http://www.journaldunet.com"
              listOfLinks =[]

              link = open("http://www.journaldunet.com/web-tech/fonds/index/investisseurs")
              page = Nokogiri::HTML(link)
              listOfLinks = page.css('[class="bloc size1of2 odSquareList"]').css('li').map{|tab|  http_head + tab.children.attr("href")}

               listOfLinks.each do |link|
                    link.force_encoding('ASCII-8BIT')
                    link = URI::encode(link)
                    if link.ascii_only? || link.eql?("none")
                        link_startup = open(link)
                        page = Nokogiri::HTML(link_startup)
                        page_cntct  = link_startup.base_uri.to_s

                        name_cntct  = begin page.css("h1").children.text                                                                rescue "error" end
                        blocs       = begin page.css('[class="hidden marB20"]')                                                         rescue "error" end
                        actvt_cntct = begin blocs.css(':contains("A propos de")').css("p").text                                         rescue "error" end
                        ca_cntct    = begin blocs.css(':contains("Montant total")').css("p").children[1].text                           rescue "error" end
                        busi_cntct  = begin blocs.css(':contains("Ticket moyen")').css("p").children[1].text                            rescue "error" end
                        markt_cntct = begin blocs.css(':contains("Secteurs d\'investissement :")').css("p").children[1].text            rescue "error" end
                        prod_cntct  = begin blocs.css(':contains("Portefeuille de start-up")').css("p").children[1].text                rescue "error" end
                        chefs_cntct = begin blocs.css(':contains("Dirigeant(s)")').css("p").children[1].text                            rescue "error" end

                        cntct      = begin page.css('[class="hidden marB20"]').css('h2:contains("Contacter") + p').text                 rescue "error" end.gsub(/[\n\t\r]{2,}/,'|').sub("Adresse :","")
                        rue_cntct  = begin cntct.scan(/(?:\||)(.+)(?:[0-9]{5}\D+?)/)[0].join("")                                        rescue "error" end
                        cp_cntct   = begin cntct.scan(/([0-9]{5})(.+)/)[0][0].split.join                                                rescue "error" end
                        city_cntct = begin cntct.scan(/([0-9]{5})(.+)/)[0][1].split.join                                                rescue "error" end

                        tel_cntct  = begin page.css('[class="hidden marB20"]').css('h2:contains("Contacter") + p + p').children.text    rescue "error" end.gsub(/[\n\t\r]{2,}/,'|').sub("Téléphone :","")
                        web_cntct  = begin page.css('[class="grid_row marB20"]').css('a.odBtn').attr('href').value                      rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        mail_cntct = begin page.css('[class="grid_row marB20"]').css('a.odBtn')[1].attr('href').sub("mailto:","")       rescue "error" end

                          #error
                        save_cntct  = begin page.css('[itemprop="name"] + time').text                                                   rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        envi_cntct  = begin page.css('[itemprop="makesOffer"] ~ h2:contains("Environnement") + div').text               rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        chefs_cntct = begin page.css('[itemprop="founders"]').text                                                      rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        local_cntct = begin page.css('[itemprop="address"]').css('[itemscope]').text                                    rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        date_cntct = begin page.css('[itemprop="foundingDate"]+p').text                                                 rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                        tail_cntct = begin page.css('[itemprop="numberOfEmployees"]').text                                              rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')

                        warning = "none"
                    else
                         name_cntct = nil; img_cntct  = nil; web_cntct  = nil; rue_cntct  = nil; cp_cntct = nil; city_cntct = nil; mail_cntct = nil; tel_cntct  = nil; tail_cntct = nil;  save_cntct = nil ;  prod_cntct = nil ;  markt_cntct = nil ; busi_cntct =nil; envi_cntct = nil; chefs_cntct = nil ; local_cntct = nil ; date_cntct = nil ;  ca_cntct = nil

                         warning = esn + "hasn't bee scraped: url not only in ascii or doesn't exist"
                    end
                         tab_data_for_all_product << { url: page_cntct.to_s, name: name_cntct.to_s, rue: rue_cntct.to_s, cp: cp_cntct.to_s, ville: city_cntct.to_s, mail: mail_cntct.to_s, tel: tel_cntct.to_s, tail: tail_cntct.to_s,  ca: ca_cntct.to_s, site: web_cntct.to_s,
                                                       img: img_cntct.to_s,  save: save_cntct.to_s, prod: prod_cntct.to_s, actvt: markt_cntct.to_s, busi: busi_cntct, concu: envi_cntct, boss: chefs_cntct.to_s, local: local_cntct.to_s, old: date_cntct.to_s, warning: warning.to_s}
                end

              return tab_data_for_all_product
          end

          def save_data_in_CSV_file(table_data)
             CSV.open(@nom_CSV_file, "a") do |csv|
               csv << table_data.sample.keys
               for i in 1..table_data.length
                 csv << [ table_data[i-1][:url], table_data[i-1][:name], table_data[i-1][:rue], table_data[i-1][:cp], table_data[i-1][:ville], table_data[i-1][:mail], table_data[i-1][:tel], table_data[i-1][:tail], table_data[i-1][:ca], table_data[i-1][:site],
                          table_data[i-1][:img], table_data[i-1][:save], table_data[i-1][:prod], table_data[i-1][:actvt], table_data[i-1][:busi], table_data[i-1][:concu], table_data[i-1][:boss], table_data[i-1][:local], table_data[i-1][:old], table_data[i-1][:warning]]
               end
             end
          end

          def program_text_replacement(file_name, search_regexp, replacement_string)
              text = File.read(file_name)
              new_contents = text.sub(search_regexp, replacement_string)#/search_regexp/
              File.open(file_name, "w") {|file| file.puts new_contents }
          end

      #################################################################################################################################################################
      #################################################################################################################################################################
      public
          def program_scrap_journal_du_net(deb = 1, fin = 224)
              tab = []
              tab = scrap_links_for_all_webpages( deb, fin )
              save_data_in_CSV_file(tab)
              tab
          end
      #################################################################################################################################################################
      #################################################################################################################################################################

          def perform
              puts "there is one program of scrap, dont forget to delete the CSV file already generated and it's may be more or less  than  224 pages"
              tab = []
              tab << program_scrap_journal_du_net()
              tab.flatten
              #
              # program_text_replacement('the_scrap_usine_digital.csv', /&AMP;/, '&')
              program_text_replacement(@nom_CSV_file, /(prod)/,  'StartUp Financier')
              # program_text_replacement('the_scrap_usine_digital.csv', /(actvt)/, 'Marché')
              # program_text_replacement('the_scrap_usine_digital.csv', /(concu)/, 'Environnment concurentiel')
              # program_text_replacement('the_scrap_usine_digital.csv', /(tail)/,  'Nombre d\'employés')
              # program_text_replacement('the_scrap_usine_digital.csv', /(local)/, 'Implantation')
              # program_text_replacement('the_scrap_usine_digital.csv', /(boss)/,  'Créateur')
              # program_text_replacement('the_scrap_usine_digital.csv', /(old)/,   'Âge')
              # program_text_replacement('the_scrap_usine_digital.csv', /(prod)/,  'produit')
              # program_text_replacement('the_scrap_usine_digital.csv', /(busi)/,  'Business Model')
              tab #^(.*?)\b(busi)
          end
end
