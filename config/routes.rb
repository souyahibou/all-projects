Rails.application.routes.draw do
  # mount JeMePresente::Engine,     at: "/je_me_presente_engine"
  # mount MovieMaker::Engine,       at: "/movie_maker_engine"
  # mount ReFormer::Engine,         at: "/re_former_engine"
  #
  # mount TheGossipProject::Engine, at: "/the_gossip_project_engine"
  # mount ThpMoussaillons::Engine,  at: "/thp_moussaillons_engine"
  #
  # mount BaseDeDonnees::Engine,    at: "/base_de_donnees_engine"
  #
  # mount UniversResponse::Engine,  at: "/univers_response_engine"
  #
  # mount Reservation::Engine,      at: "/reservation_engine"
  # mount Usine::Engine,            at: "/usine_engine"
  # mount Generate::Engine,         at: "/generate_engine"
  # mount Courses::Engine,          at: "/courses_engine"
  # #
  # # mount Eventbrite::Engine,       at: "/eventbrite_engine"
  # #
  # mount ReservationVol::Engine,   at: "/reservation_vol_engine"
  #
  # mount DeviseDemo::Engine,       at: "/devise_demo_engine"
  # mount HomePage::Engine,         at: "/home_page_engine"
  #
  # mount TwitterBis::Engine,       at: "/twitter_bis_engine"
  #
  # mount FormulaireStylay::Engine, at: "/formulaire_stylay_engine"
  # #
  # mount EmailViewer::Engine,      at: "/email_viewer_engine"

  get 'projects/testo9'  => 'projects#testo9', as: :projects_testo9

  namespace :projects do
      # get 'thp/week/:w_nbr/day/:d_nbr/oeuvres', action: 'oeuvres', controller: 'thp', as:	:oeuvres#, module: 'admin'# path: '/projects/thps/:id'      #may be used with switch case in the controlleur
      (1..9).each do |w_nbr|
          (1..5).each do |d_nbr|
              nbr = w_nbr.to_s + "_" + d_nbr.to_s
              match "thp/week/#{w_nbr}/day/#{d_nbr}/oeuvres", action: "oeuvres#{nbr}", controller: 'thp', as:	:"oeuvres#{nbr}", via: [:get, :post]#, module: 'admin'# path: '/projects/thps/:id'
          end
      end
  end

  match 'projects/thp/execute', via: [:get, :post]

  get 'projects/html_forms' => :html_forms, controller: 'projects', as: :html_forms

  get 'projects/scraping_annuaire_startups' => 'projects#scraping_annuaire_startups', as: :scraping_annuaire_startups, defaults: { format: 'html' }

  get 'projects/scraping_annuaire_cabinets2' => 'projects#scraping_annuaire_cabinets2', as: :scraping_annuaire_cabinets2, defaults: { format: 'html' }

  get 'projects/scraping_membres_THP' => 'projects#scraping_membres_THP_by_slack', as: :membre_THP, defaults: { format: 'html' }

  get 'projects/scraping_image_tag' => 'projects#scraping_image_tag_to_download', as: :download_img, defaults: { format: 'html' }

  get 'projects/displaying_color_names' => 'projects#displaying_color_names', as: :color_names, defaults: { format: 'html' }

  get 'projects/cv' => 'projects#cv', as: :cv, defaults: { format: 'html' }, controller: 'projects'

  get 'projects/googleMapsAPI_THP_P43' => 'projects#googleMapsAPI_THP_P43', as: :googleMapsAPI_THP_P43, defaults: { format: 'html' }

  get 'projects/scraping_cabinets' => 'projects#scraping_annuaire_cabinets', as: :scraping_annuaire_cabinets, defaults: { format: 'html' }

  get 'projects/testo'  => 'projects#testo', as: :projects_testo, defaults: { format: 'html' }, controller: 'projects'

  get 'projects/scraping_cdiscount'  => 'projects#scrap1', as: :scraping_cdiscount, defaults: { format: 'html' }, controller: 'projects'

  get 'projects/reformatage_contact'  => 'projects#reformat2', as: :reformat_contact

  get 'projects/reformatage_keys_env',  action: 'reformat', controller: 'projects', as: :reformat_key_env

  get 'projects/federdo_calculatrice',  to: 'projects#federdo_calculatrice'

  get 'projects/projectsparsing_stage_CAJ_pdf'

  get 'projects/scraping_facebook'

  get 'projects/scraping_google_calendar'

  get 'projects/scraping_sites_pro'

  get 'projects/home'

  root to: 'projects#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
