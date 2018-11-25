require 'watir'
require 'pry'

module TheHackingProject
   module S2DecouverteRuby
       module J5Watir
           class WatirGoogle
               def initialize #added
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s2_decouverte_ruby/j5_watir/"
                   # TheHackingProject::S2DecouverteRuby::J5Watir::WatirGoogle.new.perform
                   # the code was completed,can be uploaded to the source if neeeded
                   # watir.rb => watir_google.rb
               end


               def perform
                   browser = Watir::Browser.new(:firefox)
                   browser.goto 'google.com'

                   search_bar = browser.text_field(class: 'gsfi')     #selectionne la barre de recherche  ou utiliser l'inspecteru d'élément pour sélectionner d'autre éléments search_bar = browser.text_field(name: 'p') search_bar = browser.text_field(id: 'lst-ib')
                   search_bar.set("Hello World!")

                   search_bar.send_keys(:enter)
=begin
              submit_button = browser.button(type:"submit")   #or
              submit_button.click
=end
                  browser.driver.manage.timeouts.implicit_wait = 3
                  search_result_divs = browser.divs(class:"rc")

                  search_result_divs.each { |div| p div.h3.text }

                  p "Méfait accompli, fermeture du browser"
                  browser.close
               end
           end
       end
   end
end
