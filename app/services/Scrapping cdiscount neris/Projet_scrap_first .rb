require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'gmail'
require 'nokogiri'
require 'open-uri'

def get_all_number_of_iphone_webpages()
    tab_of_ean   = []
    tab_of_pages = []
    tab_of_ean_all_pages = [[]]

   for i in (1..5)
          tab_of_pages << ("https://seller.cdiscount.com/Product/Search/verre%20trempe%20iphone%204/1"+i.to_s)
          page = Nokogiri::HTML(open(tab_of_pages[i-1]))
          tab_of_ean = page.css("html").text         #html tr td:contains("@")  ('.tablePdtTitle').text().match(/[0-9]{13}/g);
          tab_of_ean_all_pages << tab_of_ean      #'.tablePdtTitle:contains("/[0-9]{13}/g")'
    end
    return tab_of_ean_all_pages
end
#//*[@id="CurrentFormId"]/section/div/div[1]/div/table/tbody/tr[14]/td[2]/div


#Réalisation du code à éxécuter(appel de toute les fonctions construites)
def perform

tab_eans = []
tab_eans = get_all_number_of_iphone_webpages
print tab_eans

end


# appel de la procédure principale d'éxécution du code
perform

