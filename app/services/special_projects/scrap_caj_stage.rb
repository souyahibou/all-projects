module SpecialProjects
    class ScrapCajStage
          def initialize( stage_file: nil, table_name: nil, result_file: nil )
             @file_stage_path  =  stage_file ||  File.join(Rails.root,'app/assets/zizani/CAJ.pdf')
             @table_name       =  table_name || 'nom_de_la_table'
             @file_result_path =  result_file || File.join(Rails.root,'app/assets/zizani/results1.csv')
             Struct.new('Lieu',:employeur, :localisation, :etablissement ,:adresse , :adresse_militaire)
             #Create one table 'Stage' or create BDD dynamicly
          end

          def perform
              #reader = PDF::Reader.new("CAJ.pdf");
              reader = PDF::Reader.new("#{@file_stage_path}");
              texte_of_all_pages = []
              table_stage =[]
              table_erreur=[]
              table_erreur2=[]
              blocs = blocs


              #extraction du text pertinent du text brut
              reader.pages.each do |page_num|
                  texte_utile               = page_num.raw_content.scan(/Td.*Tj/).join
                  texte_utile.force_encoding('ISO-8859-1')
                  texte_reformated          = texte_utile.encode('UTF-8').gsub(/\\\(/,'(').gsub(/\\\)/,')').gsub("'","''")
                  texte_reformated_filtered = texte_reformated.remove("Tj", "Td")
                  texte_of_all_pages       << texte_reformated_filtered
              end

              texte_of_all_pages_united = texte_of_all_pages.join
              #File.open('CAJparse', "w") {|file| file.puts stop}

              #découpage du fichier par pages
              stages = texte_of_all_pages_united.scan(/(\(POURVU\)\s+?)*(\(Le Stage \))(.+?)(\(Fax.{1,20}\(Page .{1,3}\))|(\((?:[a-zA-Z_][^(0-9)]|\s){5,38}\))(?:\s{1,5})(\(Page .{1,3}\))/)

              # scrap de tous les stages
              stages.each do |stage|
                  begin
                      bloc = stage.join
                      2.times{  left = bloc.partition(/(\(Page \d+?\))(?!$)/)[0];   right = bloc.partition(/(\(Page \d+?\))(?!$)/)[2];    bloc = left + right  }  #retire le texte "page (...)" pour les stage s'étalant sur deux ou trois pages
                      blocs = (bloc).scan(/\(Personne à contacter \).+?\(Fax.{1,20}\(Page .{1,3}\)|\((?:\w\D|\s){5,35}\)\s{1,5}\(Page .{1,3}\)|\(Employeur : \).+?\(Adresse militaire : \)  \( .*? \)|(?:\(POURVU\)\s+?)*\(Le Stage \).+?\(Lieu \)|\((?:[a-zA-Z_][^(0-9)]|\s){5,38}\)/) # retire (Page .{1,3} sauf si dernier) et groupe les blocs et page catégories
                      (blocs.length == 1)? (table_stage << {:domaine => blocs[0]}) : true
                      next if (blocs.length == 1)
                  #bloc stage
                      bloc_stage = blocs[0]
                      bloc_lieu = blocs[1]
                      bloc_contact = blocs[2]

                      extraction = Proc.new do |bloc_text,debut,fin,offset|              #procedure utilisé pour simplifier/optimiser le code
                          long_deb = (offset==nil)? debut.length : 0
                          content  =(fin.class == Integer)? bloc_text[bloc_text.index(debut)+long_deb..fin] : bloc_text[bloc_text.index(debut)+long_deb..bloc_text.index(fin)-1]
                          debut.scan( /\((.+?)\)/)[0] << content
                      end

                      tab_bloc_stage = []
                      tab_bloc_stage << ["Pourvu", bloc_stage.include?("POURVU")]
                      tab_bloc_stage << extraction.call(bloc_stage, '(Le Stage )'           ,'(Intitulé du stage : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Intitulé du stage : )','(Domaine : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Domaine : )'          ,'(Niveau demandé : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Niveau demandé : )'   ,'(Nombre de places : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Nombre de places : )' ,'(Descriptif : )',true)
                      tab_bloc_stage << extraction.call(bloc_stage, '(Descriptif : )'       ,'(Logement : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Logement : )'         ,'(Restauration : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Restauration : )'     ,'(Période : )')
                      tab_bloc_stage << période = extraction.call(bloc_stage, '(Période : )','(Précision durée: )',true)
                      tab_bloc_stage << extraction.call(bloc_stage, '(Précision durée: )'   ,'(Autres commentaires : )')
                      tab_bloc_stage << extraction.call(bloc_stage, '(Autres commentaires : )',-8)

                      stage_keys_into_str = période[1].scan( /\((.+?)\)/).map{|a| wrd = a[0].to_s; wrd == "Durée (en jours" ? "Durée": wrd}[-2..-1]         #pour les style mais peuvent être intégre comme les autre
                      hash_stage = Hash[*stage_keys_into_str].merge(Hash[*tab_bloc_stage.flatten])
                  #bloc lieu
                  ##---------------------------------------------------------------------------------------------------------------------------------------------------
                      employeur         =  extraction.call(bloc_lieu, '(Employeur : )'      ,'(Localisation : )')[1].scan( /\((.+)\)/).join
                      localisation      =  extraction.call(bloc_lieu, '(Localisation : )'   ,'(Etablissement : )')[1].scan( /\((.+)\)/).join
                      etablissement     =  extraction.call(bloc_lieu, '(Etablissement : )'  ,'(Adresse : )')
                      adresse           =  extraction.call(bloc_lieu, '(Adresse : )'        ,'(Adresse militaire : )')
                      adresse_militaire =  extraction.call(bloc_lieu, '(Adresse militaire : )',-1)

                      # Lieu ||= Struct.new(:employeur, :localisation, :etablissement ,:adresse , :adresse_militaire)
                      hash_lieu = Struct::Lieu.new(employeur, localisation, etablissement, adresse , adresse_militaire).to_h
                  #bloc contact
                  ##--------------------------------------------------------------------------------------------------------------------------------------------------
                      row_fonction = bloc_contact.slice!(extraction.call(bloc_contact, '(Fonction : )', '(Adresse mèl : )', true)[1])   #certaines fonction sont sur 2 lignes
                      hash_contact = Hash[*bloc_contact[(bloc_contact.index('(Identité : )')-1)..(bloc_contact.index(/\(Page .+\)/)-1)].scan( /\((.+?)\)/).map{|a| a[0].to_s}]
                  ##------------------------------------------------------------------------------------------------------------------------------------------

                      table_stage << hash_stage.merge(hash_lieu).merge(hash_contact.merge({"Fonction :"=>row_fonction}))
                  rescue => monerreur
                      p monerreur
                      table_erreur << stage.join.match(/\(Page .+?\)/)[0]     #les page qui pose problemes
                      table_erreur2 << stage.join                             #infos complet des stages non intégrés
                      p table_erreur
                  end
              end

              #transformation de toutes clés de hash en symbole
              table_Stage = []
              table_stage.each{|stage| table_Stage << stage.map{|a,b| (a.class==Symbol)? [a, b]:[a.sub(":","").strip.tr_s(" ","_").to_sym, b]}.to_h}

              #connection creation enrengitrement en BDD de manière dynamique
              conn = PG.connect(dbname: 'postgres')
              list_cols = table_Stage.fifth.keys  # =>                                or table_Stage.sample.keys   table_Stage.last.keys
              (col_for_create = "id SERIAL PRIMARY KEY, " << list_cols.collect{|c|  "#{c} character varying"}.join(", ") ) if list_cols.length > 2    # to change , use because the sample method was used in the previous statement
              cols_for_insert = list_cols.join(", ")
              lins_for_insert = table_Stage.map{ |stg| "(" + stg.values.map{|val| "'#{val}'"}.join(", ") + ")" if stg.values.length > 2 }.compact.join(", ")           # encadre chaque valeurs de quote simple et ecncadre chaque stage de parenthèse (en convertissant tout cela au format texte) et exclus les hast stage ayant 1 seule clé (correponding to domaine only)

              %x!touch #{@file_result_path}!
              %x!chmod 777 #{@file_result_path}!

              conn.exec("DROP TABLE  IF EXISTS #{@table_name}")
              conn.exec("CREATE TABLE #{@table_name}(#{col_for_create})")
              conn.exec("INSERT INTO #{@table_name} (#{cols_for_insert}) VALUES #{lins_for_insert}")
              conn.exec("COPY #{@table_name} TO '#{@file_result_path}' DELIMITER ',' CSV HEADER;")
              conn.exec("SELECT #{@table_name}.* FROM #{@table_name}")

              # Enregistrement des données en base
              # table_Stage.each do |stage|
              #     row_stage = Stage.new
              #     row_stage.Nombre_de_places        =stage[:Nombre_de_places]
              #     row_stage.Période                 =stage[:Période]
              #     row_stage.Duree                   =stage[:"Durée"]
              #     row_stage.Niveau_demandé          =stage[:Niveau_demandé]
              #     row_stage.Descriptif              =stage[:Descriptif]
              #     row_stage.Autres_commentaires     =stage[:Autres_commentaires]
              #     row_stage.Logement                =stage[:Logement]
              #     row_stage.Restauration            =stage[:Restauration]
              #     row_stage.précision_durée         =stage[:précision_durée]
              #     row_stage.employeur               =stage[:employeur]
              #     row_stage.localisation            =stage[:localisation]
              #     row_stage.etablissement           =stage[:etablissement]
              #     row_stage.adresse                 =stage[:adresse]
              #     row_stage.adresse_militaire       =stage[:adresse_militaire]
              #     row_stage.Identité                =stage[:Identité]
              #     row_stage.Adresse_mèl             =stage[:Adresse_mèl]
              #     row_stage.Téléphone               =stage[:Téléphone]
              #     row_stage.Fax                     =stage[:Fax]
              #     row_stage.Fonction                =stage[:Fonction]
              #     row_stage.save
              # end
          end
    end
end
# ScrapCajStage.new.perform
# rails g model Stage Nombre_de_places Période Duree Niveau_demandé Descriptif:text Autres_commentaires:text Logement Restauration précision_durée employeur localisation etablissement adresse  adresse_militaire Identité Adresse_mèl Téléphone Fax Fonction
# list_cols = %w[Numéro_de_stage Intitulé_du_stage Nombre_de_places Période Duree Niveau_demandé Descriptif Autres_commentaires Logement Restauration précision_durée employeur localisation etablissement adresse  adresse_militaire Identité Adresse_mèl Téléphone Fax Fonction]
# rails db:migrate
# resultat: '/home/syb8/Documents/Projet/All_Projects/zizani/resultat2.csv'
# source: 'zizani/CAJ.pdf'
# table: nom_de_la_base
