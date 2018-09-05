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


make interface for each project
  with some initial configuration and données d'entrées if needed
  with description of project
  principal features gems configuration paths associées au project/fichier to ignore
  add features to more configure project ex: scrap only 2 page instead of 48(all page) or until stop activate
**************************************************************************************
Procédure pour chaque nouveau projet
  1 modify controller => add action or controller action
  2 add ruby code in service folder if needed
  3 add view with same name of the action
  4 define route associated with the view and the action controller
  5 add project on index of projects in home view
  6 complete readme.md for how to use app && what is the app && how app is build
**************************************************************************************



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
1 intaller une distribution latex dans l'OS
2 Gemfile: 	gem 'rails-latex'
3 Configuration:Add to config\initializers\mime_types.rb  this=> Mime::Type.register "application/pdf", :pdf, ['text/pdf'], ['pdf']  #added

4 Implémenter décor:	\app\views\layouts\application.pdf.erbtex ex:=> <% @latex_config={:parse_runs => 3} %>
<%= yield %>
5 Implémenter action:	\app\controllers\projects_controller.rb  ex:=> render action: 'cv', :layout => 'application'#, formats: [:pdf]



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
