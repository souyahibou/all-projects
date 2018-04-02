require "google_drive"
require 'pry'
require 'json'
require 'csv'
require 'gmail'
require 'nokogiri'
require 'open-uri'

def get_data_product(link_product)
    data_of_prod = {}
    link = link_product
    page = Nokogiri::HTML(open(link))


    #prod_class        =  page.css('html tr td:contains("@")')
    prod_ean          =  page.text[(page.text.index( 'pr_ean', 0) + 10)..(page.text.index('pr_ean', 0) + 22 )]
    prod_name         =  page.css('html div.fpDesCol h1').text
    prod_description  =  page.css('html div.fpBlk.testSep.extCode').text.strip #.tr(13.chr + 10.chr, " ")
    prod_image1 = ""  ;  page.css('html div.fpImg div.fpMainImg a').map { |link| prod_image1 = link['href'] }

    # prod_image2       =  page.css('html tr td:contains("@")')
    # prod_image3       =  page.css('html tr td:contains("@")')
    prod_sku          =  page.text[(page.text.index( 'pr_sku', 0) + 10)..(page.text.index('pr_sku', 0) + 25 )]
    prod_prix         =  page.css('html div.fpColFloat.jsColFloat span.fpPrice.price').text
    return {name: prod_name, ean: prod_ean, descrip: prod_description, img1: prod_image1, sku: prod_sku, prix: prod_prix }
end


def scrap_links_for_all_webpages(deb, fin)
    tab_of_pages =[]
    tab_of_links_page = []
    tab_data_for_all_product =[]        #tab_data_for_a_product + tab_of_url_all_pages = [[]]

   for i in (deb..fin)
          puts i
          tab_of_pages = ("https://www.cdiscount.com/mpv-7133-PHONILLICO.html?TechnicalForm.SiteMapNodeId=56396&TechnicalForm.DepartmentId=&TechnicalForm.ProductId=&hdnPageType=StoreSeller&TechnicalForm.ContentTypeId=14&TechnicalForm.SellerId=7133&TechnicalForm.PageType=MARKETPLACE_SELLERSHOP&TechnicalForm.LazyLoading.ProductSheets=False&TechnicalForm.SessionId=48c8b821-2f5f-4768-b6b2-4b45a4973b69&NavigationForm.CurrentSelectedNavigationPath=0&FacetForm.SelectedFacets.Index=0&FacetForm.SelectedFacets.Index=1&FacetForm.SelectedFacets.Index=2&FacetForm.SelectedFacets.Index=3&FacetForm.SellerId=7133&SortForm.SelectedSort=BESTSALES&ProductListTechnicalForm.Keyword=&PaginationForm.CursorMarkNext=&PaginationForm.CurrentPage=624" + i.to_s + "&PaginationForm.TotalPage=2632&page=" + i.to_s + "&_his_#_his_")
          page = Nokogiri::HTML(open(tab_of_pages))
          tab_of_links_page = page.css('html div.prdtBloc a[class="jsQs"]') #a[class="jsQs"]')        #html tr td:contains("@")  ('.tablePdtTitle').text().match(/[0-9]{13}/g);


           tab_of_links_page.each do |link_product|
                tab_data_for_all_product << get_data_product(link_product['href'])
           end
    end
    return tab_data_for_all_product
end



def save_data_in_CSV_file(table_data)
    CSV.open("the_scrap.csv", "a") do |csv|
      for i in 1..table_data.length
        csv << [ "", table_data[i-1][:ean],"","","", table_data[i-1][:name],"", table_data[i-1][:descrip], table_data[i-1][:img1], table_data[i-1][:sku] , table_data[i-1][:prix]]
      end
    end
end

tab = []
tab = scrap_links_for_all_webpages
tab.each {|pr| p pr}

save_data_in_CSV_file(tab)
# get_data_product('https://www.cdiscount.com/telephonie/accessoires-portable-gsm/lot-3-films-protection-samsung-galaxy-note-8-pla/f-144201315-pho2009649552114.html?idOffre=207843006')

# tab=scrap_links_for_all_webpages(51,100)
# tab.each {|pr| p pr}
# save_data_in_CSV_file(tab)
# tab=scrap_links_for_all_webpages(101,150)
# tab.each {|pr| p pr}
# save_data_in_CSV_file(tab)
# tab=scrap_links_for_all_webpages(151,200)
# tab.each {|pr| p pr}
# save_data_in_CSV_file(tab)
# tab=scrap_links_for_all_webpages(201,250)
# tab.each {|pr| p pr}
# save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(251,300)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(301,350)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(351,400)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(401,450)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(451,500)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(501,550)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(551,600)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)
tab=scrap_links_for_all_webpages(601,625)
tab.each {|pr| p pr}
save_data_in_CSV_file(tab)




# node.parent           #=> parent node
# node.children         #=> children nodes
# node.next_sibling     #=> next sibling node
# node.previous_sibling


# puts link_product.values
# puts link_product.keys




          # puts tab_of_links_page
          # puts tab_of_links_page.class
          # puts tab_of_links_page


#html.testBtn body div#page div#main.content div#sContener div#lpContent div#bvTdg.lpTopZtd.jsLpTop.jsTab div#lpTBk.lpTopBox.jsTab div.lpTopTDG div.lpCarTop.jsPrdCar ul.crUl.jsUl li.crItem div.prdtBloc a.jsQs



#getdataproduct

#prod_special     =  page.css('html tr td:contains("@")')
# puts 'ean :' + prod_ean.to_s
# puts 'name:' + prod_name.to_s
# puts 'desc:' + prod_description.to_s
# puts 'img1:' + prod_image1.to_s
# puts 'sku :' + prod_sku.to_s
# puts 'prix:' + prod_prix.to_s
# html.testBtn body div#page div#main.content div#sContener div#lpContent div#bvTdg.lpTopZtd.jsLpTop.jsTab div#lpTBk.lpTopBox.jsTab div.lpTopTDG div.lpCarTop.disabled.jsPrdCar.noFlex ul.crUl.jsUl li.crItem div.prdtBloc a.jsQs
# html.testBtn body div#page div#main.content div#sContener div#lpContent div#sContent.jsTab ul#lpBloc li div.prdtBloc a ul.prdtBPCar li img.prdtBImg
# html.testBtn body div#main.content div#fpContent.fpContent div#fpZnPrdMain.testSep.fpTopZone.testFpLightCropImage.jsTop div.fpTMain div.fpColFloat.jsColFloat div#fpBlocPrice.fTopPrice.jsContent form#addForm.jsMainForm span.fpPrice.price
#html.testBtn body div#main.content div#fpContent.fpContent div#fpZnPrdMain.testSep.fpTopZone.testFpLightCropImage.jsTop div.fpImg div.fpMainImg a picture img#picture0.jsSmallImg.fpLoopZoom
# /html.testBtn body div#main.content div#fpContent.fpContent div#fpZnPrdMain.testSep.fpTopZone.testFpLightCropImage.jsTop div.fpTMain div.fpDesCol h1
# html.testBtn.idz_mirroring_refresh_10000 body div#main.content div#fpContent.fpContent div.fpBlk.testSep.extCode
#return {name:, ean:, :email:, class:, descrip:, img1:, img2:, img3:, sku:, prix:,  };
