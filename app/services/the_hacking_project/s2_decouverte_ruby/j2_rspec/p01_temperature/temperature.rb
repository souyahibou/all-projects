module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P01Temperature
        						class Temperature
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p01_temperature/"
                        end

                        def ftoc(fahrenheit_degree)
                          (fahrenheit_degree-32)*5/9
                        end

                        def ctof(celcius_degree)
                        (celcius_degree*1.8+32).abs
                        end

                        def run_temperature_spec
                            %x!rspec #{File.join(@path,"temperature_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(Rails.root,@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end


#write your code here

def ftoc(fahrenheit_degree)
  (fahrenheit_degree-32)*5/9
end

def ctof(celcius_degree)
  (celcius_degree*1.8+32).abs
end


#





# name of dir : 01_temperature => p01_temperature
# name of dir : J2_RSpec => j2_sspec
# name of dir : Projet_Faits_Mardi => projet_faits_mardi

# TheHackingProject::S2DecouverteRuby::J2Rspec::P01Temperature::Temperature.new.ftoc(27)
# TheHackingProject::S2DecouverteRuby::J2Rspec::P01Temperature::Temperature.new.run_temperature_spec
# rspec temperature_spec.rb --format html --out rspec_results.html
#  i don't know why the execution of a bash command from a ruby script don't work     =>      ruby -r "/home/syb8/Documents/Projet/All_Projects_WSL/all-projects/app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p01_temperature/temperature.rb" -e "TheHackingProject::S2DecouverteRuby::J2Rspec::P01Temperature::Temperature.new.run_temperature_spec" :=> use  with rails c (it works well)


# https://www.tutorialspoint.com/rspec/rspec_quick_guide.htm
# add rspec in gemfile
# implement the code
# implement the test code rspec (avoid the absolute references and Rails objects don't work: use require_relative)
# implement trigger command to execute the test. (the only kind find is with : rspec temperature_spec.rb --format html --out rspec_results.html => and display the output)
