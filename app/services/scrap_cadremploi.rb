require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'nokogiri'
require 'open-uri'

class ScrapCadremploi  #project made with Christian Monkam
      private
          def scrap_links_for_all_webpages(deb, fin)
              tab_data_for_all_product =[]
              for i in (deb..fin)
                     puts i
                     link = open("https://www.cadremploi.fr/emploi/liste_cabinets?page=" + i.to_s)
                     page = Nokogiri::HTML(link)
                     page.css('div.tabListCab.block-form div.col-md-4').each do |bloc|
                          page_cntct =  link.base_uri.to_s
                          name_cntct  =  page.css('strong.cabinet-raison-sociale').text
                          lieu_cntct  =  page.css('span:has(span.icon-geolocalisation)').text
                          tel_cntct   =  page.css('span:has(span.icon-tel)').text
                          email_cntct =  page.css('a.email-cabinet').text
                          tab_data_for_all_product << { url: page_cntct, name: name_cntct, lieu: lieu_cntct, tel: tel_cntct, email: email_cntct }
                     end
              end
              return tab_data_for_all_product
          end

          def save_data_in_CSV_file(table_data)
             CSV.open("the_scrap_cadremploi.csv", "a") do |csv|
               for i in 1..table_data.length
                 csv << [ table_data[i-1][:url], table_data[i-1][:name], table_data[i-1][:lieu], table_data[i-1][:tel], table_data[i-1][:email]]
               end
             end
          end
      #################################################################################################################################################################
      #################################################################################################################################################################
      public
          def program_scrap_cadremploi
              tab = []
              tab = scrap_links_for_all_webpages( 0,244 )
              save_data_in_CSV_file(tab)
              tab
          end
      #################################################################################################################################################################
      #################################################################################################################################################################

          def perform
              puts "there is one program of scrap"
              program_scrap_cadremploi
          end
end
