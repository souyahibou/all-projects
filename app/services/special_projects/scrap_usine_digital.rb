END {   puts "Terminating du Programme de scrap des toutes les starts-up"}
BEGIN { puts "Initialition du Programme de scrap des toutes les starts-ups répertoriés dans le site carrier info"}
#This programme use nokogiri, URI(encode), CSV, begin rescue end, str.force_encoding('ASCII-8BIT'),scan(/Regex/),hash,array,sub/gsub(/regex/,"new text"), BEGIN END
require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'nokogiri'
require 'open-uri'
require 'uri'

module SpecialProjects
    class ScrapUsineDigital  #project made with Christian Monkam
          private
              def scrap_links_for_all_webpages(deb, fin)
                  tab_data_for_all_product =[]
                  esns=[]
                  http_head = "https://www.usine-digitale.fr"
                  for i in (deb..fin)
                         puts i
                         link = open("https://www.usine-digitale.fr/annuaire-start-up/" + i.to_s + "/")
                         page = Nokogiri::HTML(link)
                         esns=[]
                         # nbr_tabs = page.css("[itemprop='itemListElement']").count  # or page.css('[itemscope]').css('.blocType1').count
                         esns = page.css("[itemprop='itemListElement']").css('a[class="contenu"]').map{|tab|  http_head + tab.attr("href")}

                         # can be merge
                         esns.each do |esn|
                              esn.force_encoding('ASCII-8BIT')
                              esn = URI::encode(esn)
                              if esn.ascii_only? || esn.eql?("none")
                                  link_esn = open(esn)
                                  page = Nokogiri::HTML(link_esn)
                                  page_cntct  = link_esn.base_uri.to_s
                                  name_cntct  = begin page.css('[itemprop="name"]').text                                                          rescue "error" end
                                  img_cntct   = begin http_head + page.css('[itemprop="logo"]').attr("src").value                                 rescue "error" end
                                  save_cntct  = begin page.css('[itemprop="name"] + time').text                                                   rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  prod_cntct  = begin page.css('[itemprop="makesOffer"]').text.gsub(/[\n\t\r]{2,}/,'|')                           rescue "error" end
                                  markt_cntct = begin page.css('[itemprop="makesOffer"] ~ h2:contains("Marché") + div').text                      rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  busi_cntct  = begin page.css('[itemprop="makesOffer"] ~ h2:contains("Business") + div').text                    rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  envi_cntct  = begin page.css('[itemprop="makesOffer"] ~ h2:contains("Environnement") + div').text                    rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  chefs_cntct = begin page.css('[itemprop="founders"]').text                                                      rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  local_cntct = begin page.css('[itemprop="address"]').css('[itemscope]').text                                    rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                    # Environnement concurrentiel :

                                  date_cntct = begin page.css('[itemprop="foundingDate"]+p').text                                                 rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  web_cntct  = begin page.css('a[itemprop="sameAs"]').attr('href').value                                          rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  mail_cntct = begin cfDecodeEmail(page.css('[itemprop="email"]')[0].children.attr("data-cfemail").value)         rescue "error" end

                                  tel_cntct  = begin page.css('p[itemprop="telephone"]').text                                                     rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  tail_cntct = begin page.css('[itemprop="numberOfEmployees"]').text                                              rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  ca_cntct   = begin page.css('#infoPratiq > div > ul > li').select{|title| title.text =~ /Chiffre/}[0].text      rescue "error" end

                                       cntct = begin page.css('p[itemprop="address"]' ).text                                                      rescue "error" end.gsub(/[\n\t\r]{2,}/,'|')
                                  rue_cntct  = begin cntct.scan(/(?:\||)(.+)(?:[0-9]{5}\D+?)/)[0].join("")                                        rescue "error" end
                                  cp_cntct   = begin cntct.scan(/([0-9]{5})(.+)/)[0][0].split.join                                                rescue "error" end
                                  city_cntct = begin cntct.scan(/([0-9]{5})(.+)/)[0][1].split.join                                                rescue "error" end

                                  warning = "none"
                              else
                                   name_cntct = nil; img_cntct  = nil; web_cntct  = nil; rue_cntct  = nil; cp_cntct = nil; city_cntct = nil; mail_cntct = nil; tel_cntct  = nil; tail_cntct = nil;  save_cntct = nil ;  prod_cntct = nil ;  markt_cntct = nil ; busi_cntct =nil; envi_cntct = nil; chefs_cntct = nil ; local_cntct = nil ; date_cntct = nil ;  ca_cntct = nil

                                   warning = esn + "hasn't bee scraped: url not only in ascii or doesn't exist"
                              end
                                   tab_data_for_all_product << { url: page_cntct.to_s, name: name_cntct.to_s, rue: rue_cntct.to_s, cp: cp_cntct.to_s, ville: city_cntct.to_s, mail: mail_cntct.to_s, tel: tel_cntct.to_s, tail: tail_cntct.to_s,  ca: ca_cntct.to_s, site: web_cntct.to_s,
                                                                 img: img_cntct.to_s,  save: save_cntct.to_s, prod: prod_cntct.to_s, actvt: markt_cntct.to_s, busi: busi_cntct, concu: envi_cntct, boss: chefs_cntct.to_s, local: local_cntct.to_s, old: date_cntct.to_s, warning: warning.to_s}
                          end
                  end #tab_data_for_all_product.each{ |a| p a ;p ""}

                  return tab_data_for_all_product
              end

              def save_data_in_CSV_file(table_data)
                 CSV.open("the_scrap_usine_digital.csv", "a") do |csv|
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

              def cfDecodeEmail(encodedString)
                  email = ""
                  r = encodedString[0...2].to_i(16)
                  i = 2
                  while i < encodedString.length
                        key = encodedString[i...i+2].to_i(16)^r
                        email = email + key.chr
                        i += 2
                  end
                  email
              end
          #################################################################################################################################################################
          #################################################################################################################################################################
          public
              def program_scrap_usine_digital(deb = 1, fin = 224)
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
                  # tab << program_scrap_usine_digital(1,50)
                  # tab << program_scrap_usine_digital(51,100)
                  tab << program_scrap_usine_digital(101,150)
                  tab << program_scrap_usine_digital(150,200)
                  tab << program_scrap_usine_digital(201,224)
                  tab.flatten
                  program_text_replacement('the_scrap_usine_digital.csv', /&AMP;/, '&')
                  program_text_replacement('the_scrap_usine_digital.csv', /(save)/,  'Publication')
                  program_text_replacement('the_scrap_usine_digital.csv', /(actvt)/, 'Marché')
                  program_text_replacement('the_scrap_usine_digital.csv', /(concu)/, 'Environnment concurentiel')
                  program_text_replacement('the_scrap_usine_digital.csv', /(tail)/,  'Nombre d\'employés')
                  program_text_replacement('the_scrap_usine_digital.csv', /(local)/, 'Implantation')
                  program_text_replacement('the_scrap_usine_digital.csv', /(boss)/,  'Créateur')
                  program_text_replacement('the_scrap_usine_digital.csv', /(old)/,   'Âge')
                  program_text_replacement('the_scrap_usine_digital.csv', /(prod)/,  'produit')
                  program_text_replacement('the_scrap_usine_digital.csv', /(busi)/,  'Business Model')
                  tab #^(.*?)\b(busi)
              end
    end
end
# pages utilisées www.usine-digitale.fr/annuaire-start-up/georges-tech,724889                                     www.usine-digitale.fr/annuaire-start-up/empire-avenue,197783                         www.usine-digitale.fr/annuaire-start-up/lor-actu-fr,197773       www.usine-digitale.fr/annuaire-start-up/click-boat,556763
# https://www.usine-digitale.fr/annuaire-start-up/224/
# https://www.usine-digitale.fr/annuaire-start-up/talentview,691909
