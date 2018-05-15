Rails.application.routes.draw do

  get 'projects/googleMapsAPI_THP_P43' => 'projects#googleMapsAPI_THP_P43', as: :googleMapsAPI_THP_P43

  get 'projects/scraping_cabinets' => 'projects#scraping_annuaire_cabinets', as: :scraping_annuaire_cabinets

  get 'projects/testos'  => 'projects#testo', as: :projects_testo

  get 'projects/scraping_cdiscount'  => 'projects#scrap1', as: :scraping_cdiscount

  get 'projects/reformatage_contact'  => 'projects#reformat2', as: :reformat_contact

  get 'projects/reformatage_keys_env'  => 'projects#reformat', as: :reformat_key_env

  get 'projects/federdo_calculatrice'  => 'projects#federdo_calculatrice'

  get 'projects/projectsparsing_stage_CAJ_pdf'

  get 'projects/scraping_facebook'

  get 'projects/scraping_google_calendar'

  get 'projects/scraping_sites_pro'

  get 'projects/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
