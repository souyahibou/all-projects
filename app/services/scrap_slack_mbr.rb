require  'csv'

class ScrapSlackMbr
      def scrap_members_from_board(n = 100)
          browser = ScrapUrlsPros.new.set_browser_session
          browser.goto("https://thehackingproject.slack.com/threads/team/");    sleep(5)

          browser.text_field(:name, "email").value="souaybou.k@live.fr";        sleep(1)
          browser.text_field(:name, "password").value="23069427195";	          sleep(1)
          browser.element(:id, "signin_btn").click;                             sleep(15)

          scroll = Proc.new do |opt|
              (browser.button(:id, "flex_menu_toggle").click  ; 3.times{browser.send_keys(:down)} ; browser.send_keys(:enter))  unless opt["menu"].nil?     #ouvre le menu des membres slack
              (3.times{browser.send_keys(:tab)} ;    15.times{browser.send_keys(:down)})                                        unless opt["down"].nil?     #permet le scroll vers le bas de la barre de défilement des membres
              sleep(0.5)                                                                                                        unless opt["time"].nil?     #very useless
          end

          Struct.new('Membre',:id, :photo, :pseudo ,:gentile , :persona)
          tab_membre =[]

          infos = Proc.new do
              browser.element(:id, "team_list_scroller").child.children.each do |item|
                  id = item.div.a.data_member_id
                  photo =  item.div.a.span.style.scan(/https.+72/).first    if item.div.a.span.present?
                  pseudo =  item.div.a.div.children[0].text        if item.div.a.div.children[0].present?
                  gentile =  item.div.a.div.children[1].text         if item.div.a.div.children[1].present?
                  persona =  item.div.a.div.children[2].text       if item.div.a.div.children[2].present?
                  p gentile
          	tab_membre << Struct::Membre.new(id, photo, pseudo, gentile , persona).to_h
             end
          end

          1.times{scroll.call("menu & time") ;infos.call}
          n.times{scroll.call("down") ; infos.call}
          return tab_membre
      end

      def save_on_database_and_csv_file(tab_membre)
          table_name       =  'slack_members'
          file_result_path =  File.join(Rails.root,'slack.csv')   #/!\rails root

          conn = PG.connect(dbname: 'postgres')
          list_cols = tab_membre.sample.keys
          col_for_create = "idu SERIAL PRIMARY KEY, " << list_cols.collect{|c|  "#{c} character varying"}.join(", ")
          cols_for_insert = list_cols.join(", ")
          lins_for_insert = tab_membre.map{ |mbr| "(" + mbr.values.map{|val| "'#{val.nil?? val:val.gsub("'","''")}'"}.join(", ") + ")"  }.compact.join(", ")

          %x!touch #{file_result_path}!
          %x!chmod 777 #{file_result_path}!

          conn.exec("DROP TABLE  IF EXISTS #{table_name}")
          conn.exec("CREATE TABLE #{table_name}(#{col_for_create})")
          conn.exec("INSERT INTO #{table_name} (#{cols_for_insert}) VALUES #{lins_for_insert}")
#         conn.exec("COPY #{table_name} TO '#{file_result_path}' DELIMITER ',' CSV HEADER;")
          conn.exec("COPY (SELECT DISTINCT #{cols_for_insert} FROM #{table_name}) TO '#{file_result_path}' DELIMITER ',' CSV HEADER;")
          conn.exec("SELECT DISTINCT #{table_name}.* FROM #{table_name}")
      end

      def downloading_images_members
          csv = CSV.parse(File.read('slack.csv'), :headers => true)
          @SITE_URL_COMMUM  = "https://ca.slack-edge.com/"
          @DOSSIER  = "images_slack"

          host_uri = URI(@SITE_URL_COMMUM)                          #modified ex URI(url)
          Dir.mkdir(@DOSSIER) unless Dir.exist?(@DOSSIER)          #modified
          Net::HTTP.start(host_uri.host, host_uri.port,
                            :use_ssl => host_uri.scheme == 'https') { |http|
            csv.each do |path|
              puts "Downloading: " + path["photo"] + "of" + path["pseudo"]
              begin
                resp = http.get(path["photo"])
                open(File.join(@DOSSIER,path["id"]+"_"+path["pseudo"]), "wb") do |file|
                  file.write(resp.body)
                end
              rescue
                ScrapImageHtmlTag.new.test_response(resp)
              end
              puts "--100%--"
            end
          }
      end
      def perform
          tab_membre = scrap_members_from_board(3)
          save_on_database_and_csv_file(tab_membre)
          downloading_images_members
          return tab_membre
      end

end
