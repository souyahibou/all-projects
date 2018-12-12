# README

  This README would normally document whatever steps are necessary to get the
  application up and running.

  * Deployment instructions



## CONFIG MODIFIED
  - production.rb:
  ```ruby
  config.public_file_server.enabled[2lines]
  config.assets.compile
  config.serve_static_assets
  config.force_ssl
  ```

  - application.rb:
  ```ruby
  config.assets.enabled = true
  config.assets.initialize_on_precompile = false
  config.assets.paths << Rails.root.join("app", "assets", "fonts")
  ```

  - /initializers/assets.rb
  ```ruby
  Rails.application.config.assets.precompile = [ Proc.new{ |path| !File.extname(path).in?(%w(.js .css .html .erb .md)) }, /application.(css|js)$/ ]
  Rails.application.config.assets.precompile << Dir.glob(Rails.root.join('app', 'assets', 'thp_projects', '**/*')).grep(/[\W\w]*\.(js|css|png|jpg)$/)
  ```

## COMMANDS TO RUN
  * rails
  ```bash
  bundle [install|update]
  rails assets:precompile           
  RAILS_ENV=production bundle exec rails assets:precompile
  yes | rm -rf db/migrate/*
  rails db:version (20181206170175 version 1)
  rails db:drop
  rails db:schema:dump
  rails railties:install:migrations
  rails db:schema:load
  rails db:create
  rails db:migrate
  rails db:seeds
  rails db:rollback STEP=3
  ```
  * assets
  ```bash
  rake assets:clobber
  rake assets:clean
  rake tmp:clear
  rake assets:precompile
  ```

  * heroku
  ```bash
  heroku run rake db:version  
  run heroku pg:reset #=> to drop
  run heroku run rails --trace db:schema:load DISABLE_DATABASE_ENVIRONMENT_CHECK=1
  # rake db:schema:load || rake db:structure:load
  run heroku run rails db:migrate
  run heroku run rails db:seed
  ```

  * figaro
  ```bash
  bundle exec figaro help heroku:set
  bundle exec figaro heroku:set -e production
  bundle exec figaro heroku:set -p config/application_fb.yml
  ```

## GEMS USED
  ```ruby
  gem 'font-awesome-sass'           
  gem "bulma-rails"                 
  gem 'bootstrap-sass'    		      

  gem 'sinatra'                     

  gem 'pry'                         
  gem 'json'                        
  gem 'csv'                         
  gem 'gmail'                       

  gem 'rspec'                       

  gem 'sprockets'                   

  gem 'rails-latex'                 

  gem 'geocoder'                     #or gem 'google-maps'
  gem 'paper-pdf-parser'

  gem 'activerecord-diff'           
  gem 'differ'                      

  gem "figaro"			                
  gem "koala"			                   #gem facebook

  gem "google_drive"                
  gem 'watir'                       
  gem 'pry'                	        
  gem 'nokogiri'

  gem 'roo'                         #ajout

  gem 'jquery-rails', '4.3.1'       #uselfull(assets) can't be delete

  gem 'rails', '~> 5.1.4'           # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'pg', '~> 0.18'               # Use postgresql as the database for Active Record
  gem 'puma', '~> 3.7'              # Use Puma as the app server

  gem 'sass-rails', '~> 5.0'        # Use SCSS for stylesheets
  gem 'uglifier', '>= 1.3.0'        # Use Uglifier as compressor for JavaScript assets
  gem 'coffee-rails', '~> 4.2'      # Use CoffeeScript for .coffee assets and views

  gem 'turbolinks', '~> 5'          # Turbolinks makes navigating your web application faster.
  gem 'jbuilder', '~> 2.5'          # Build JSON APIs with ease.
  ```


## ENGINE USED

- 42 je_me_presente   #engine
- 42 movie_maker
- 42 re_former

- 43 the_gossip_project
- 43 thp_moussaillons (bootstrap)

- 44 base_de_donnees

- 52 univers_response (bootstrap-sass)

- 54 reservation
- 54 usine
- 54 generate
- 54 courses

- 55 eventbrite

- 61 reservation_vol (faker)

- 62 devise_demo ()
    - gem 'devise', 'devise_zxcvbn', 'devise-i18n', 'delayed_job_active_record'
    - gem 'jquery-turbolinks', 'bootstrap-sass', 'coffee-rails'  	                 #pipeline
- 62 home_page
    - gem 'devise', 'devise-i18n', 'delayed_job_active_record'
    - gem 'jquery-turbolinks', 'bootstrap-sass'
    - gem 'faker'
    - gem 'bcrypt'
- 64 twitter_bis (twitter, bootstrap-sass)

- 72 formulaire_stylay('devise', 'devise-i18n', pipeline('sass-rails', 'uglifier', 'coffee-rails'), 'turbolinks')
- 93 email_viewer (sass-rails', 'turbolinks')


## SERVICES
```ruby
TheHackingProject::S2DecouverteRuby::J1InitRuby::ChiffreDeCesar.new.chiffre_de_cesar("test", 27)
TheHackingProject::S2DecouverteRuby::J1InitRuby::CompterLesMots.new.jean_michel_data(corpus, dictionary)
TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.new.trader_du_dimanche([1,14,23,1,4,8,5,12])
TheHackingProject::S2DecouverteRuby::J1InitRuby::SumOfMultiples.new.sum_of_multiples(\*multiples, nbr_begin, nbr_end)

TheHackingProject::S2DecouverteRuby::J2Rspec::P00Hello::Hello.new.run_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P01Temperature::Temperature.new.run_temperature_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P02Calculator::Calculator.new.run_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P03SimonSays::SimonSays.new.run_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P04PigLatin::PigLatin.new.run_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P05BookTitles::Book.new.run_spec
TheHackingProject::S2DecouverteRuby::J2Rspec::P06Timer::Timer.new.run_spec

TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::Incubateurs.new.incubateurs
TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::ObscurTrader.new.obscur_trader
TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::RouteMairie.new.perform

TheHackingProject::S2DecouverteRuby::J5Watir::WatirGoogle.new.perform

TheHackingProject::S3RubyIntermediaire::J1Excel::Spreadsheets.new.perform
TheHackingProject::S3RubyIntermediaire::J1Excel::FormatJsonCsv.new.perform

TheHackingProject::S3RubyIntermediaire::J2EnvoiEmails::ProjetTotal.new.perform

TheHackingProject::S3RubyIntermediaire::J3Poo::Hi.run!
TheHackingProject::S3RubyIntermediaire::J3Poo::Monkey.new.perform
TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.new.perform
TheHackingProject::S3RubyIntermediaire::J3Poo::ScrabbleWord.new.perform
TheHackingProject::S3RubyIntermediaire::J3Poo::Superhero.new

TheHackingProject::S3RubyIntermediaire::J4TicTacToe::ProjetTicTacToe.new.perform


SpecialProjects::ColorNames.new.color_by_names
SpecialProjects::FormatContact.new.perform
SpecialProjects::FormatKeysEnv.new.perform
SpecialProjects::ScrapCadremploi.new.perform
SpecialProjects::ScrapCajStage.new.perform
SpecialProjects::ScrapCarrierInfo.new.perform
SpecialProjects::ScrapCdiscount.new.perform
SpecialProjects::ScrapImageHtmlTag.new.perform
SpecialProjects::ScrapJournalDuNet.new.perform
SpecialProjects::ScrapSlackMbr.new.perform
SpecialProjects::ScrapUsineDigital.new.perform


ScrapFbPros.new.perform
ScrapGoogleCal.new.perform
ScrapUrlsPros.new.perform
```
## SYSTEM DEPENDENCIES
1. Rails 5.0.1
2. LaTeX
3. PostgreSQL
4. Watir webdriver
5. buildpacks on heroku prod
6. heroku config

## HOW TO RUN APP
1. bundle install && bundle update
2. rails assets:preccompile
3. rails db:create
4. rails db:migrate
5. rails db:seed
6. rails s
7. Enjoy

## JOBS

## BE CAREFUL BY FILE ADDED IN GIT IGNORE


# HOW TO ADD NEW PROJECT


  ### make interface for each project
    1. with some initial configuration and données d'entrées if needed
    2. with description of project
    3. principal features gems configuration paths associées au project/fichier to ignore
    4. add features to more configure project ex: scrap only 2 page instead of 48(all page) or until stop activate
  **************************************************************************************
  ### Procédure pour chaque nouveau projet
    1. modify controller => add action or controller action
    2. add ruby code in service folder if needed
    3. add view with same name of the action
    4. define route associated with the view and the action controller
    5. add project on index of projects in home view
    6. complete readme.md for how to use app && what is the app && how app is build && how long taking && ext. config
**************************************************************************************




## DESCRIPTION OF EACH PROJECTS

    --------------------------------------------------------------------------------------
    Le Projet ScrapImageHtmlTag:   Le 15/07/2018
    Ce script permet à partir d'une Url d'un site donnée:
    1. de récupérer les Url des valise HTML img
    2. de les télécharger dans un dossier images crée si non-éxistant

      def initialize              contient les entrées/reglages à paramétrer
      def get_html(url)           récupère le code source HTML de l'URL
      def parse_html(html)        récupère les information HTML spécifié
      def downloader(url, paths)  télécharge les images à partir des URL got
      def test_response(resp)     non utilisé
      def perform                 éxécution du script

    3. ajouter le dossier des images au git ignore
    4. Gems/Objects used:  ['net/http' , 'nokogiri']/[Dir, File]

    -------------------------------------------------------------------------------------
    Le projet ScrapSlackMbr: Le 19/07/2018
    Ce script permet de récupérer les informations et images de tous les membres du slack THP:
    1. récupère le pseudo/nom-prénom/statut/identifiant/url_images depuis le jobboard slack THP
    2. sauvegarde le résultat en base de données et export dans un fichier de format csv avec une éxécution de Commande bash %x!cmd!

    3. ajouter le dossier images_slack au git ignore
    4. Gems/Object useed: [Watir PG CSV Net::HTTP]/[Proc Struct File Rails URI Dir]

      def Scrap_members_from_board
      def save_on_database_and_csv_file(tab_membre)
      def downloading_images_members
                            ScrapUrlsPros.set_browser_session
                            ScrapImageHtmlTag.downloader
    5. files generated: dossier contenant images_slack et fichier csb mbrs slack.csv
    6. a faire gerer les quelque bug de scrap()/faire method initialize avec IOput/parametre app/view/controller pour récupérer des arguments de fct°

    "Completed 500 Internal Server Error in 59168ms
    Selenium::WebDriver::Error::StaleElementReferenceError (The element reference of <a class="c-unified_member c-unified_member--large c-unified_member--linked member_preview_link focus-ring" href="/team/U76U5TEVB"> is stale; either the element is no longer attached to the DOM, it is not in the current frame context, or the document has been refreshed):"
    to solve with on error resume next

    -------------------------------------------------------------------------------------
    Le Projet CV:   Le ../../2018
    Cette configuration permet de generer un pdf à partir d'un fichier latex et de l'afficher:

    ### Rails-latex:
    1. intaller une distribution latex dans l'OS
    2. Gemfile: 	gem 'rails-latex'
    3. Configuration:Add to `config\initializers\mime_types.rb`  this=> Mime::Type.register "application/pdf", :pdf, ['text/pdf'], ['pdf']  #added
    4. Implémenter décor:	  `app\views\layouts\application.pdf.erbtex` ex:=> <% @latex_config={:parse_runs => 3} %> \n <%= yield %>
    5. Implémenter action:	`app\controllers\projects_controller.rb`  ex:=> render action: 'cv', :layout => 'application'#, formats: [:pdf]
    7. Definir route:       `config\routes.rb` ex:=>  get 'projects/cv' => 'projects#cv', as: :cv
    8. Implémenter LaTeX code: `app\views\projects\File.pdf.erb`  ex:=> cv.pdf.erb    
                          ```latex
                          \documentclass[12pt]{article}
                          \begin{document}
                          Hello world!
                          \end{document}
                          ```
    ### To build on Heroku:
    9.  Fork or not buildpack: https://github.com/Thermondo/heroku-buildpack-tex
    10. add bldpck herokuapp:  heroku buildpacks:add git://github.com/Thermondo/heroku-buildpack-tex.git  or https://github.com/souyahibou/heroku-buildpack-tex
    11. create texlive.profile    download original config from repo [unecessary because already exist]
    12. create texlive.packages   add from(echo or vim) bash all app latex code packages depedencies ex:=> moderncv babel textcase
    13. create texlive.repository add tex repo ex:=> ftp://tug.org/historic/systems/texlive/2017/tlnet-final [unecessary if! last year is set]
    14. be careful to the extern links.
    15. Implement to heroku:    git add .     git commit     git push heroku master
    16. Enjoy
    00. to test if package are available: run after one build of buildpacks in heroku: heroku run bash then tlmgr install pckgeslist
    00. packages used in my project: moderncv babel textcase textpos multirow xargs psnfss tools graphics enumitem etoolbox unicode-math microtype fontspec xcolor pgf lipsum xkeyval greek-fontenc greek-inputenc
    environ latexmk collection-bibtexextra collection-langgerman collection-xetex collection-fontsrecommended fontawesome ifsym tocloft

    -------------------------------------------------------------------------------------
    Le Projet program_scrap_carrierinfo:   Le 30/08/2018
    Ce script permet de scrapper toutes les ESN/SSII de francecdu site carrier-info:


    -------------------------------------------------------------------------------------
    Le Projet program_scrap_usine_digital:   Le 03/09/2018
    Ce script permet de scrapper toutes les starups de france du site usine digitale:


    -------------------------------------------------------------------------------------
    Le Projet program_scrap_journal_du_net:   Le 03/09/2018
    Ce script permet de scrapper toutes les VCs de france du site journal du net:


















-------------------------------------------------------------------------------------
    Le Projet program scrap urls pro:   redigé Le 10/09/2018
    Ce script permet de copier le contenu des sites d'un site, de l'enregistrer(spreadsheet), et comparer(entre 2 copie):

    * PARAMÈTRE
      Gem : "googleauth", "watir", "google_drive", 'nokogiri', "koala", "differ"
      Buildpacks: "google chrome", "Selenium chromedriver","Ruby(Bundler)oR"
      Class: "ScrapUrlsPros", "attr_accessor", "Hash", "scan(Regx)", "gsub"
      Notes:
      données in/out: données dans spreadsheets  
      ```ruby
      ENV["SPREADSHEET_SCRAPPING_FB_EVENTS"]
      ENV["SPEADSHEET_SCRAPPING_URLS"]
      ENV["SPEADSHEET_LIENS_ET_IDS"]
      ENV["LOCAL_OR_HEROKU"]
      ENV["GOOGLE_CHROME_BIN"]
      ENV["GOOGLE_client_id"]
      ENV["GOOGLE_client_secret"]
      ENV["GOOGLE_refresh_token"]
      ENV["GOOGLE_redirect_uri"]
    ```
    * DURÉE

    * DESCRIPTION
        #   perform
                   # tab = [];
                   # list_urls = get_all_professors_urls
                   # tab = scrap_links_for_all_webpages(list_urls);
                   # comp_data_in_SpreadSheet(tab);
                   # save_from_on_GoogleDrive(tab);
                   # return tab;
        1. récupération des urls de site à scrapper
        2. récupérations des copies de pages de chaque sites
        3. compare si les copies sont identique au précédent  enregistrement en base
        4. sauvegarde toute les copies des pages en base


    * METHODES
      # config
      ```ruby
      set_google_drive_session  #connexion_to_GoogleDrive
      set_browser_session       #exe  new_browser
      set_first_connexion       #activate_first_connexion_GoogleDrive(GgDrv): connexion_to_GoogleDrive("first")
      set_refresh_connexion     #Pour reactiver la connection GgDrv ifnot first time: connexion_to_GoogleDrive("refresh")
      initialize                #set all configurations externes(keys(GoogleDrive)), des nom&&nombre des colonnes

      public
       scrap_links_for_all_webpages    #exe scrap_soft_link or scrap_hard_links and return one tab of hash
        scrap_soft_link(link)           #use nokogiri
        scrap_hard_links()              #use watir
        scrap_justdancewithlife_link(link) #use watir specificly for extact data in googleagenda

        get_all_professors_urls               #recupere les urls a scraper dans un spreadsheets
        comp_data_in_SpreadSheet(table_data)  #test if one scrap has change(new event) and return table_data modified or not if has some change
        save_from_on_GoogleDrive(table_data)  #save tab of hash in spreadsheets(only the new hash(lines(event)) if not first time)

      private
        new_browser                             #configuration de watir en local ou heroku return un navigateur            
        connexion_to_GoogleDrive(type_connex)   #configuration de la connexion à google drive
        column_code_of_hash_keys                #attribution des code colonne pour spreadsheet pour each key
    ```


-------------------------------------------------------------------------------------
    Le Projet program scrap fb pro:   redigé Le 10/09/2018
    Ce script permet de recupérer les datas d'events de groupe fb via FB API, de l'enregistrer(spreadsheet), et comparer(entre 2 requete):

      * PARAMÈTRE
        Gem : "Koala", "ActiveRecord", "FBGraph"
        Buildpacks: 0
        Class: "ScrapUrlsPros", "ScrapFbPros", "attr_accessor", "Hash", Time
        Notes:
        données in/out:
        fields_of_events:   data expected on the fb request
        database_of_events: un model Evenement
        access_token:   ENV["token"]
        ENV["SPEADSHEET_LIENS_ET_IDS"]
        [ ENV["FIRST_APP_ID"], ENV["FACEBOOK_redirect_uri"], ENV["FACEBOOK_scopes_auths2"]
          ENV["FACEBOOK_EMAIL"], ENV["FACEBOOK_MDP"], ENV["FACEBOOK_redirect_uri"]       ]

      * DURÉE

      * DESCRIPTION
          #perform
              #groups = get_all_facebook_groups                                        #get all group ids
              #scrap_events_facebook_groups(groups, @database_of_events)               #extraction data request & save
              #compare_datas_in_database(@database_of_events)                          #edit/update the events status
              #@tab                                                                    #allow to print the database

      * METHODES
        - config
        rails generate model Evenement  event_id    event_name      event_start_time      event_end_time      event_description      event_place_id      event_place_name      event_place_location_data      change      event_place_city      event_place_country      event_place_latitude      event_place_longitude      event_place_street      event_place_zip      event_event_times_data      event_owner_name      event_photos_images      last_date      groupe_id    origin_base  event_owner_id    changements origin_base:string:index

        add into model:
              require 'active_record/diff'
              class Evenement < ApplicationRecord
                  include ActiveRecord::Diff
                  validates_uniqueness_of :event_id, scope: [:origin_base]
              end
        - initialize                #set all config externes(keys(Fbgraphtoken),database), des nom&&nombre champs,msgs

        - public
            ```ruby
            get_all_facebook_groups
            compare_datas_in_database
            scrap_events_facebook_groups
            perform               #modified or not if has some change
            ```
        - private
            #`get_access_token    #connec fb from browser to get token by uri generated, temp save in ENV var`      


    -------------------------------------------------------------------------------------
    Le Projet program scrap google pro:   redigé Le 10/09/2018
    Ce script permet de recupérer les datas d'events de calendrier google, make clean, de l'enregistrer(en base)

      * PARAMÈTRE
        Gem : "Koala", "ActiveRecord", "FBGraph", "Geocoder"
        Buildpacks: 0
        Class: "ScrapUrlsPros", "Proc", "Sleep", "Hash", Date, Struct, Time
        Notes:
        données in/out:
        database_model: un model EvenementGoogle

      * DURÉE

      * DESCRIPTION
          #perform
              #groups = get_all_facebook_groups                                        #get all group ids
              #scrap_events_facebook_groups(groups, @database_of_events)               #extraction data request & save
              #compare_datas_in_database(@database_of_events)                          #edit/update the events status
              #@tab                                                                    #allow to print the database

      * METHODES
        #config
          # rails generate model EvenementGoogle site heure titre date lieu map description

        # public
            get_google_links
            scrap_google_calendar links
            scrap_events_facebook_groups
            save_in_database(@database_model)
            @all_events
            data_enrichment









%----------------------------------------------------------------------------------------
%	HARD CONFIRUGATION USES FOR THIS THIS BIG PROJECT "ALL-PROJECTS"
%----------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
To complete push on heroku:			
1. install Yarn
2. set/add in config\application.rb => config.assets.initialize_on_precompile = false
3. run command : RAILS_ENV=production bundle exec rake assets:precompile
4. git commit -a -m "msg"
5. git push heroku master
6. heroku open

..............................................................................
configuration of heroku Tex buildpacks (see ressources, packages and dependencies)

1. ftp://tug.org/historic/systems/texlive/2017/tlnet-final/archive/
2. https://www.ctan.org/pkg/
3. https://www.tug.org/pipermail/tex-live/2012-August.txt
4. http://distrib-coffee.ipsl.jussieu.fr/pub/mirrors/ctan/systems/texlive/tlnet/tlpkg/texlive.tlpdb   list of pckges collections
5. https://devcenter.heroku.com/articles/dynos

..............................................................................
configuration of heroku: Procfile
the file is only needed if your run heroku localy otherwise heroku generate this file automatically if not exit with a maj and sans ext.
Delete or implement this file, do not leave this file empty
1. Procfile in root directory: ex:=> web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}


1. Rails s -e production

..............................................................................
configuration of heroku watir buildpacks (need of google chrome, selenium driver [and ruby(bundler)])

1. https://github.com/souyahibou/heroku-buildpack-google-chrome
2. https://github.com/souyahibou/heroku-buildpack-chromedriver
3. https://github.com/souyahibou/heroku-buildpack-ruby



..............................................................................
configuration of facebook program
## Démarche pour récupérer les événements sur facebook:
* étape n°0 :avoir les variable d'environnement définies
* étape n°1 :récupérer/Avoir un token valide:                     ScrapFbPros.new.get_token(ou par un autre moyen possible)
* étape n°2 :créer une table de BDD suivant le modèle Evenement   rails db:create
* étape n°3 :Lancer le programme principal:                       ScrapFbPros.new.perform


## pour récupérer un token via ScrapFbPros.new.get_token:

```ruby
1 mettre ses identifiant Facebook
            ENV["FACEBOOK_EMAIL"]
            ENV["FACEBOOK_MDP"]
2 copié le nouveau token et remplacer l'ancien token de la variable environnement ENV["token"] par le nouveau token récupéré. Ce token est valide pendant 6mois.
            2 bis possibilité d'utiliser le token disponible via l'interface API graph facebook, celui-ci est valide pendant 1 heure.'
```





%----------------------------------------------------------------------------------------
%	MEMO FOR SOME TOOLS AND APPLICATIONS
%----------------------------------------------------------------------------------------

..................................................
to complete

HEROKU

    Basics:
    heroku create
    git push heroku master
    heroku open

    See the logs:
    heroku logs
    heroku logs -n 200                              display nbr lines
    heroku logs --tail                              logs in real time
    heroku logs --dyno (router|web|worker)          to filter
    heroku logs --source app                        to filter

    heroku ps[:scale web=1]                         to see/set procfile

    Run the app locally:
    which psql                                      check if postgresql is installed
    bundle install
    bundle exec rake db:create db:migrate
    [npm install]                                   seems useless
    touch Procfile
    echo "web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}" >> Profile
    heroku local web
    Open http://localhost:5000
      then other times
        bundle install
        heroku local
        Open http://localhost:5000

    heroku addons:create
    heroku addons
    heroku addons:open

    Consoles
    heroku run rails console
    heroku run bash

    heroku config
    heroku config:set VAR=val

    heroku run rake db:migrate          to connect to the database
    heroku pg
    heroku pg:psql





AJAX
    https://launchschool.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails
    https://medium.com/backticks-tildes/unobtrusive-javascript-in-rails-c37fc757d8b1






%----------------------------------------------------------------------------------------
%	SOME CONFIGURATIONS AND NOTES USEFUL FOR WINDOWS SUBSYSTEM LINUX
%----------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
Linux subsystem Configuation:			https://www.mirrorcommunications.com/blog/how-to-install-ruby-on-rails-on-windows-10-with-postgresql
					https://medium.com/@colinrubbert/installing-ruby-on-rails-in-windows-10-w-bash-postgresql-e48e55954fbf

	Setting Up Ruby
		Installing the Ruby Dependencies:
			sudo apt-get update
			sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

		Install Ruby using rbenv:
			cd
			git clone https://github.com/rbenv/rbenv.git ~/.rbenv
			echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
			echo 'eval "$(rbenv init -)"' >> ~/.bashrc
			exec $SHELL

			git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
			echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
			exec $SHELL

			rbenv install 2.5.1
			rbenv global 2.5.1
			ruby -v

		Installing Bundler:
			gem install bundler

		Configuring Git:

		Setting up and installing Rails
			First install NodeJS:
			Now install Rails(rbenv):
				gem install rails -v 5.2.0
				rbenv rehash

		Setting Up PostgreSQL:			sudo apt-get install libpq-dev

		Note..:
			ou can run chmod +t -R ~/.bundle and that should fix the permissions errors and let you finish the bundle install for your Rails app.
			config database.yml pg for each new app

Heroku
	to install
		curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
		heroku --version
		heroku login

	to unistall
		rm /usr/local/bin/heroku
		rm -rf /usr/local/lib/heroku /usr/local/heroku
		rm -rf ~/.local/share/heroku ~/.cache/heroku

Other config
  to set automatic opening of a link from linux bash
    [export BROWSER='/mnt/c/Program Files (x86)/Opera/launcher.exe']    in linux subsytem
    [echo "export BROWSER='/mnt/c/Program Files (x86)/Opera/launcher.exe'" >> ~/.bashrc] semems useless




%----------------------------------------------------------------------------------------------------------
% Tuto: How to load an html svg css or any other file
%----------------------------------------------------------------------------------------------------------

    1 a). rename the file: logo.svg to => _logo.html.erb         ==then=>>            b). use under main html view: <%= render :partial => 'path/logo' %>
    2 a). def svg(name)						                                                    b). use under main html view: <%= svg 'logo' %>
          	file_path = "#{Rails.root}/app/assets/images/#{name}.svg"   #or another path
          	return File.read(file_path).html_safe if File.exists?(file_path)
          	'(not found)'
          end_





%------------------------------------------------------------------------------------------------------------
%Congigution Nom de domaine OVH HEROKU
%----------------------------------------------------------------------------------------------------------
Configuration Redirection de nom de domaine

https://jibai31.wordpress.com/2015/01/29/host-your-ovh-domain-on-heroku-dns-config/

1. Set your A record to one of Heroku’s IPs
nslookup yourappname.herokuapp.com
Now in OVH, add an A record for your root domain (example.com) pointing to this IP:	example.com | A | 54.243.167.174
On Heroku, don’t forget to declare your root domain:	$ heroku domains:add example.com

2. Declare an app subdomain
Now add a CNAME record for app subdomain, pointing to your Heroku app (mind the final dot):	app.example.com | CNAME | yourappname.herokuapp.com.
And don’t forget to declare the subdomain on Heroku:	 $ heroku domains:add app.example.com

3. Change your www subdomain to be an alias of app subdomain
Now make sure your www CNAME points to the app subdomain:	www.example.com | CNAME | app.example.com.
And don’t forget to declare the subdomain on Heroku:	 $ heroku domains:add www.example.com

4. config allproject: force an application to use SSL/TLS
uncomment  config.force_ssl = true  in config/environments/production.rb   to have SSL in ovh

5. infos
un CNAME sur un root est "interdit"
OVH n'assure pas de SSL sur les redirections
Empoisonnement du cache DNS => dnssec(solve)




































%----------------------------------------------------------------------------------------
% USELESS CAN BE DELETED IN THE FUTURE
%----------------------------------------------------------------------------------------


    #Comments of each projects

    ##Various Projects

    1: used for some rendering tests
    2: useless script getting data from some website
    using: googleauth, watir, nokogiri, differ, Regex, ruby(hash, array, ENV, ... )+++
    must:(watir webdriver setled, browser, model)		
    partiel
    3: useless script getting data from some google calendar well-structured
    using:  ActiveRecord, Geocoder, ruby(Proc, Sleep, Hash, Date, Struct, Time)
    must:(model created)
    partiel
    4:useless script getting data from Facebook API  
    using: Koala, ActiveRecord, Hash, Time
    must:(API connection, model created)
    partiel
    5:useless script parsing data from pdf catalog
    using: gem (pdf-reader, PG(dynamicly)), ruby(File, struct)
    must:(PG connection)
    partiel
    6: 1srt script: useless 2 scripts getting data from Cdiscount website
    using: Nokogiri, CSV, ruby(Array of Hashs)
    must: (CSV file for save)
    partiel (script works well)
    7:conversion tableau csv/excel into contact VCF
    using: Roo, Ruby(File)
    must:(fichier source, Fichier final)
    partiel
    8:conversion variable ENV inner application.yml into in inline format for heroku
    using: ruby(Regex, File)
    must:(fichier source, Fichier final)
    partiel
    9:Complete App: Litle Calculator
    using: template(css/js/html) /without layout
    must:
    complete:
    10: script getting data form multipage website
    using: Nokogiri, CSV
    must:(final file)
    partiel(works locally, not display in prod)
    11: Page displaying a Map of the World
    using: Google Map API, html, js
    must: API_key, JQuery
    complete
    12: Page display pdf CV by direct live complitaion in latex
    using: gem 'rails-latex'
    must: (buildpack-tex(heroku)/latex installed, config textlive.profile)
    complete
    13: Page displaying color classed(by names/groups)
    using: ruby(hasches, regex)
    complete
    14: useless script getting all images from a website
    using: Nokogiri, net/http, ruby(Dir, File, URI)
    must: config initialize(xpath, filtre, dossier, url_com, url)
    partial
    15: useless script for getting data from slack
    using watir, PG, CSV, Net:HTTP, ruby(Proc, Struct, File, Rails, URI, Dir)
    must: database, file final, directory destination
    partial
    16: script getting data from pages of website
    using: Nokogiri, URI, CSV, File, ruby(Regex)
    must:(final save file)
    partial: works locally(build a view)

    17: script getting data from pages of website
    using: Nokogiri, URI, CSV, ruby(Regex, File, Exception Handling)
    spécial: fonction decode encrypted email
    must:(final save file)
    partial: works locally(build a view)

    18:list of all main html compenents and properties
    using: html

    ##Thp Projects
    01:
    02:
    03:
    04:
    05:

    06:4 Ruby Script Programs
    07:7 Ruby Script Programs && theirs tests
    08: non ok
    09:3 Ruby Scrapping Scripts
    10:1 Ruby Automation Script  TODO: set for running from heroku			 partial

    11:2 Back-end Programs    1 -program read/write json format from/to file   2-Connexion/utilisation API Google_drive(gem)/Spreadsheets		partial(used in back-end)
    12:1 -A custom back-end program to send an email    Using: gem(gmail Google_drive Nokogiri), ruby(Dir, File, CSV, Exception) ScrapUrlsPros	partial(back-end)
    13:5 ruby Script programs			    Using: RSpec, Sinatra, %x!!(bash command), File, Opera					partial(works localy)
    14:1 complete custom ruby POO program(back-end)     Using RSpec,rubyPOO(File)++ 								partial(works locally)
    15:none

    16:none
    17:3 Basic Rails Apps 		Using: Engine, Database, MVC
    18:2 Basic Rails Apps		Using: Engine, Database, boostraps, partial view, scaffold, model validation,
    19:1 Basic Rails Apps 		Using: Engine, Database, Scaffold
    20:none

    21:Basic authentification Rails App Using: Engine, Database, boostraps		partial(works /univers_response_engine/sessions/new)
    22:same as S5J1		
    23:none
    24:4 Basic Rails Apps 		Using:Engine, Activerecord DB				works(to check when migration)
    25:1 Rails Apps 		Using:Engine, Activerecord DB relations			works(to check when migration)

    26:1 Rails Apps			Using:Engine, Activerecord DB,
    27:2 Rails Apps			Using:Engine, Devise ,Activerecord DB,bootstrap, pipeline assets(gems) works(to check when migration)
    28:none
    29:1 Ruby Script & 1 Rails App	Using:Engine, gem(twitter, bootstraps) 		must:API_keys	partial(back-end) 95%		
    30:none

    31:Remaking one Youtube Page	Using:template(HTML/CSS)			Works:50%
    32:1 rails app			Using:Activerecords DB,gem(pipeline tubolinks)	works(to check when migration)
    33:Remaking an Webpage		Using:template(HTML) 			Works:25%
    34:Remaking 3 Webpages		Using:template(HTML/CSS/JS)		Works:13%
    35:none

    36:
    37:
    38:3 basic interactive page	Using: Template(HTML/CSS/JS), JS 	   Works:35%
    39:A basic interactive webpage 	Using: Template(HTML/CSS/SVG), JS(Jquery)  Works:90%
    40:

    41:none
    42:A map of the world		Using: Template(HTML), google_map API, Jquery
    43:A mail manager 				Using: Engine, database, gem(sass-rails,turbolinks),AJAX		  works(to check when migration)
    44:none
    45:none
