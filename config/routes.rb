Rails.application.routes.draw do

  get 'projects/testo'  => 'projects#testo', as: :projects_testo

  get 'projects/projectsparsing_stage_CAJ_pdf'

  get 'projects/scraping_facebook'

  get 'projects/scraping_google_calendar'

  get 'projects/scraping_sites_pro'

  get 'projects/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
