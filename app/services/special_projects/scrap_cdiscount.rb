require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'nokogiri'
require 'open-uri'

module SpecialProjects
    class ScrapCdiscount
          private
              def get_all_number_of_iphone_webpages()
                  tab_of_ean   = []
                  tab_of_pages = []
                  tab_of_ean_all_pages = [[]]

                 for i in (1..5)
                   tab_of_pages << ("https://seller.cdiscount.com/Product/Search/verre%20trempe%20iphone%204/1"+i.to_s)
                   page = Nokogiri::HTML(open(tab_of_pages[i-1]))
                   tab_of_ean = page.css("html").text         #html tr td:contains("@")  ('.tablePdtTitle').text().match(/[0-9]{13}/g);
                   tab_of_ean_all_pages << tab_of_ean         #'.tablePdtTitle:contains("/[0-9]{13}/g")'
                 end

                  return tab_of_ean_all_pages
              end
          ############################################################################################################################################################
              def get_data_product(link_product)
                 #data_of_prod = {}
                 link = link_product
                 if link.ascii_only?
                     page = Nokogiri::HTML(open(link))
                     prod_url          =  link
                     prod_ean          =  page.text[(page.text.index( 'pr_ean', 0) + 10)..(page.text.index('pr_ean', 0) + 22 )]
                     prod_name         =  page.css('html div.fpDesCol h1').text
                     prod_description  =  page.css('html div.fpBlk.testSep.extCode').text.strip.tr(13.chr + 10.chr, " ")
                     prod_image1 = ""  ;  page.css('html div.fpImg div.fpMainImg a').map { |link| prod_image1 = link['href'] }
                     prod_sku          =  page.text[(page.text.index( 'pr_sku', 0) + 10)..(page.text.index('pr_sku', 0) + 25 )]
                     prod_prix         =  page.css('html div.fpColFloat.jsColFloat span.fpPrice.price').text
                 else
                   prod_url = link ; prod_ean  = "trouver les données manuellement"; prod_name =  ""; prod_description  =  ""; prod_image1 = ""; prod_sku  =  "" ;  prod_prix =  "le link n'est pas au format ascii"
                 end
                 return { url: prod_url, name: prod_name, ean: prod_ean, descrip: prod_description, img1: prod_image1, sku: prod_sku, prix: prod_prix }
              end


              def scrap_links_for_all_webpages(deb, fin)
                 tab_of_pages =[]
                 tab_of_links_page = []
                 tab_data_for_all_product =[]
                for i in (deb..fin)
                       puts i
                       tab_of_pages = ("https://www.cdiscount.com/mpv-135-zoomici.html?TechnicalForm.SiteMapNodeId=56396&TechnicalForm.DepartmentId=&TechnicalForm.ProductId=&hdnPageType=StoreSeller&TechnicalForm.ContentTypeId=14&TechnicalForm.SellerId=135&TechnicalForm.PageType=MARKETPLACE_SELLERSHOP&TechnicalForm.LazyLoading.ProductSheets=False&TechnicalForm.SessionId=837b4c13-96c0-47a7-9dcc-030e48d2859e&NavigationForm.CurrentSelectedNavigationPath=0&FacetForm.SelectedFacets.Index=0&FacetForm.SelectedFacets%5B0%5D=f%2F7%2F%5B_1200%5D&FacetForm.SelectedFacets.Index=1&FacetForm.SelectedFacets.Index=2&FacetForm.SelectedFacets.Index=3&FacetForm.SelectedFacets.Index=4&FacetForm.SelectedFacets.Index=5&FacetForm.SelectedFacets.Index=6&FacetForm.SellerId=135&SortForm.SelectedSort=BESTSALES&ProductListTechnicalForm.Keyword=&PaginationForm.CursorMarkNext=&PaginationForm.CurrentPage=434" + i.to_s + "&PaginationForm.TotalPage=435&page=" + i.to_s + "&_his_")
                       page = Nokogiri::HTML(open(tab_of_pages))
                       tab_of_links_page = page.css('html div.prdtBloc a[class="jsQs"]')
                       tab_of_links_page.each do |link_product|
                             tab_data_for_all_product << get_data_product(link_product['href'])
                       end
                end
                 return tab_data_for_all_product
              end

              def save_data_in_CSV_file(table_data)
                 CSV.open("the_scrap_2.csv", "a") do |csv|
                   for i in 1..table_data.length
                     csv << [ table_data[i-1][:url], table_data[i-1][:ean],"","","", table_data[i-1][:name],"", table_data[i-1][:descrip], table_data[i-1][:img1], table_data[i-1][:sku] , table_data[i-1][:prix] ]
                   end
                 end
              end
          #################################################################################################################################################################
          #################################################################################################################################################################
          public
              def program_scrap_cdiscount_vendor_3
                 tab = []
                 for i in 0.step( 43, 1 )
                     tab = scrap_links_for_all_webpages( i*10 + 9, i*10 + 10 )
                     tab.each {|pr| p pr}
                     save_data_in_CSV_file(tab)
                 end
              end


              def program_scrap_cdiscount_vendor_1
                  tab_eans = []
                  tab_eans = get_all_number_of_iphone_webpages
                  print tab_eans
              end


          #################################################################################################################################################################
          #################################################################################################################################################################

          def perform
              puts "there are two program of scrap"
              program_scrap_cdiscount_vendor_1
              program_scrap_cdiscount_vendor_3
          end
    end
end

#("https://www.cdiscount.com/mpv-7133-PHONILLICO.html?TechnicalForm.SiteMapNodeId=56396&TechnicalForm.DepartmentId=&TechnicalForm.ProductId=&hdnPageType=StoreSeller&TechnicalForm.ContentTypeId=14&TechnicalForm.SellerId=7133&TechnicalForm.PageType=MARKETPLACE_SELLERSHOP&TechnicalForm.LazyLoading.ProductSheets=False&TechnicalForm.SessionId=48c8b821-2f5f-4768-b6b2-4b45a4973b69&NavigationForm.CurrentSelectedNavigationPath=0&FacetForm.SelectedFacets.Index=0&FacetForm.SelectedFacets.Index=1&FacetForm.SelectedFacets.Index=2&FacetForm.SelectedFacets.Index=3&FacetForm.SellerId=7133&SortForm.SelectedSort=BESTSALES&ProductListTechnicalForm.Keyword=&PaginationForm.CursorMarkNext=&PaginationForm.CurrentPage=624" + i.to_s + "&PaginationForm.TotalPage=2632&page=" + i.to_s + "&_his_#_his_")
# tab=scrap_links_for_all_webpages(0,625)
# tab.each {|pr| p pr}
# save_data_in_CSV_file(tab)

# node.parent           #=> parent node
# node.children         #=> children nodes
# node.next_sibling     #=> next sibling node
# node.previous_sibling

# link_product.values
# link_product.keys
#return {name:, ean:, :email:, class:, descrip:, img1:, img2:, img3:, sku:, prix:,  };
#prod_special     =  page.css('html tr td:contains("@")')
