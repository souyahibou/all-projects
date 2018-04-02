require 'roo'


file_names = ['../Documents/Projet_Final/fonctionalite_scrap/Scrap_pro4/config/application.yml','file.txt']

file_name = file_names[0]
text = File.read(file_name)

# new_contents = text.gsub(/search_regexp/, "replacement string")
new_contents = text.gsub(/:/, "=") ; new_c = new_contents;
new_contents = new_c.gsub(/ /, "")
new_contents.gsub!(/.*#.*$/, "")
new_contents.gsub!(/\n\n\n/, "")
new_contents.gsub!(/\n/, " ")

# To merely print the contents of the file, use:
puts new_contents

# To write changes to the file, use:
File.open(file_names[1], "w") {|file| file.puts new_contents }


#this program allow to get all keys and value of environment variables from application.yml then to convert on a good format. these steps is useful to push the all keys once only. 
