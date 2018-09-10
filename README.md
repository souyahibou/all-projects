# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

            * BE CAREFUL BY FILE ADDED IN GIT IGNORE

%----------------------------------------------------------------------------------------
%	HOW TO ADD NEW PROJECT
%----------------------------------------------------------------------------------------

make interface for each project
  1. with some initial configuration and données d'entrées if needed
  2. with description of project
  3. principal features gems configuration paths associées au project/fichier to ignore
  4. add features to more configure project ex: scrap only 2 page instead of 48(all page) or until stop activate
**************************************************************************************
Procédure pour chaque nouveau projet
  1. modify controller => add action or controller action
  2. add ruby code in service folder if needed
  3. add view with same name of the action
  4. define route associated with the view and the action controller
  5. add project on index of projects in home view
  6. complete readme.md for how to use app && what is the app && how app is build
**************************************************************************************


%----------------------------------------------------------------------------------------
%	DESCRIPTION OF EACH PROJECTS
%----------------------------------------------------------------------------------------

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

Rails-latex:
1. intaller une distribution latex dans l'OS
2. Gemfile: 	gem 'rails-latex'
3. Configuration:Add to config\initializers\mime_types.rb  this=> Mime::Type.register "application/pdf", :pdf, ['text/pdf'], ['pdf']  #added
4. Implémenter décor:	  app\views\layouts\application.pdf.erbtex ex:=> <% @latex_config={:parse_runs => 3} %> \n <%= yield %>
5. Implémenter action:	app\controllers\projects_controller.rb  ex:=> render action: 'cv', :layout => 'application'#, formats: [:pdf]
7. Definir route:       config\routes.rb ex:=>  get 'projects/cv' => 'projects#cv', as: :cv
8. Implémenter LaTeX code: app\views\projects\File.pdf.erb  ex:=> cv.pdf.erb    
                      \documentclass[12pt]{article}
                      \begin{document}
                      Hello world!
                      \end{document}
To build on Heroku:
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
