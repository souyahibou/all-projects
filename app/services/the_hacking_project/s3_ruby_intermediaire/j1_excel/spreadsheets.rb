require 'pry'
require "google_drive"
# require 'scrap_urls_pros'  #load 'filename.rb' #every call require/require_relative 'filename' #only once call

module TheHackingProject
   module S3RubyIntermediaire
       module J1Excel
           class Spreadsheets
               def initialize #added
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j1_excel/"
                   # TheHackingProject::S3RubyIntermediaire::J1Excel::Spreadsheets.new.perform
                   # the code was completed,can be uploaded to the source if neeeded
                   # S3_Ruby_intermédiaire => s3_ruby_intermediaire
                   # J1_Excel => j1_excel
               end

               def connexion  #are more spicifies authorizations than connexion_bis
                   # Creates a session. This will prompt the credential via command line for the
                   # first time and save it to config.json file for later usages.
                   # See this document to learn how to create config.json:
                   # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
                   session = GoogleDrive::Session.from_config(File.join(@path, "config.json"))
                   @session = session
               end

               def connexion_bis   #2nd part
                   # Authenticate a session with your Service Account
                   session = GoogleDrive::Session.from_service_account_key(File.join(@path, "client_secret.json"))
                   @session = session
               end

               def connexion_bis2  #special no externe file needed but must be correctly configured
                   # Authenticate a session with your Service Account
                   session = ScrapUrlsPros.new.set_google_drive_session
                   @session = session
               end

               def get_list_of_remote_files(session = @session)
                   # Gets list of remote files.
                   session.files.map do |file| #modify each => map
                     p file.title
                   end
               end

               def uploads_local_file(session = @session)
                   # Uploads a local file.
                   session.upload_from_file(File.join(@path, "hello.txt"), "hello.txt", convert: false)
               end

               def downloads_remote_file_to_local_file(session = @session)
                   # Downloads to a local file.
                   file = session.file_by_title("hello.txt")
                   file.download_to_file(File.join(@path, "hello.txt"))
               end

               def update_remote_file_from_local_file    #2nd part
                   # Updates content of the remote file.
                   file.update_from_file(File.join(@path, "hello.txt"))
               end

               def get_spreadsheet_by_title(session = @session)    #2nd part
                 # Get the spreadsheet by its title
                 spreadsheet = session.spreadsheet_by_title("Mairie_mail")
                 @spreadsheet = spreadsheet
               end

               def spreadsheet_fun()
                 connexion_bis

                 get_spreadsheet_by_title

                 # Get the first worksheet
                 worksheet = spreadsheet.worksheets.first

                 # Print out the first 6 columns of each row
                 worksheet.rows.each { |row| puts row.first(6).join(" | ") }

                 worksheet.insert_rows(2, [["Hello!", "This", "was", "inserted", "via", "Ruby"]])

                 worksheet.insert_rows(worksheet.num_rows + 1, [["Hello!", "This", "was", "inserted", "at", "the", "bottom"]])

                 worksheet[2, 1] = "Updated!"

                 worksheet["A2"] = "Updated again!"

                 worksheet.delete_rows(2, 1)

                 worksheet.save

               end

               def perform
                   spreadsheet_fun && (
                                       connexion
                                       get_list_of_remote_files
                                       uploads_local_file
                                       # downloads_remote_file_to_local_file
                                       # update_remote_file_from_local_file
                   )
               end
           end
       end
   end
end
