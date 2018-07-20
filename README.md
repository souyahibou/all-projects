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

**************************************************************************************
Procédure pour chaque nouveau projet
  1 modify controller => add action or controller action
  2 add ruby code in service folder if needed
  3 add view with same name of the action
  4 define route associated with the view and the action controller
  5 add project on index of projects in home view
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
