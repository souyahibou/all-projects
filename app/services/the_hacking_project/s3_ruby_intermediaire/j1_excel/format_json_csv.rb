#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

module TheHackingProject
   module S3RubyIntermediaire
       module J1Excel
           class FormatJsonCsv
               def initialize #added
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j1_excel/"
                   # TheHackingProject::S3RubyIntermediaire::J1Excel::FormatJsonCsv.new.perform
                   # the code was completed,can be uploaded to the source if neeeded
                   # S3_Ruby_intermédiaire => s3_ruby_intermediaire
                   # J1_Excel => j1_excel
               end

               def json_write_to_file
                   #Enfin, cette réponse mentionne comment écrire un fichier JSON à partir d'un objet ruby.
                   tempHash = {
                     "key_a" => "val_a",
                     "key_b" => "val_b"
                   }
                   File.open(File.join(@path,"temp.json"),"w") do |f|
                     f.write(tempHash.to_json)
                     # f.write(JSON.pretty_generate(tempHash))
                   end


               end

               def json_read_from_file
                   #Découvre comment lire un fichier JSON avec ce tutoriel sympathique
                   json = File.read(File.join(@path,'input.json'))
                   obj = JSON.parse(json)
                   pp obj
               end

               def perform
                   json_write_to_file
                   json_read_from_file
               end
           end
       end
   end
end
