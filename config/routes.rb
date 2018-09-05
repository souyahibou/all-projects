Rails.application.routes.draw do
  get 'projects/scraping_annuaire_startups' => 'projects#scraping_annuaire_startups', as: :scraping_annuaire_startups

  get 'projects/scraping_annuaire_cabinets2' => 'projects#scraping_annuaire_cabinets2', as: :scraping_annuaire_cabinets2

  get 'projects/scraping_membres_THP' => 'projects#scraping_membres_THP_by_slack', as: :membre_THP

  get 'projects/scraping_image_tag' => 'projects#scraping_image_tag_to_download', as: :download_img

  get 'projects/displaying_color_names' => 'projects#displaying_color_names', as: :color_names

  get 'projects/cv' => 'projects#cv', as: :cv

  get 'projects/googleMapsAPI_THP_P43' => 'projects#googleMapsAPI_THP_P43', as: :googleMapsAPI_THP_P43

  get 'projects/scraping_cabinets' => 'projects#scraping_annuaire_cabinets', as: :scraping_annuaire_cabinets

  get 'projects/testo'  => 'projects#testo', as: :projects_testo

  get 'projects/scraping_cdiscount'  => 'projects#scrap1', as: :scraping_cdiscount

  get 'projects/reformatage_contact'  => 'projects#reformat2', as: :reformat_contact

  get 'projects/reformatage_keys_env'  => 'projects#reformat', as: :reformat_key_env

  get 'projects/federdo_calculatrice'  => 'projects#federdo_calculatrice'

  get 'projects/projectsparsing_stage_CAJ_pdf'

  get 'projects/scraping_facebook'

  get 'projects/scraping_google_calendar'

  get 'projects/scraping_sites_pro'

  get 'projects/home'

  root to: 'projects#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
