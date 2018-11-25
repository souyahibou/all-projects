module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P00Hello
        						class Hello
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p00_hello/"
                        end

                        def hello
                            "Hello!"
                        end

                        def greet(receiver="Alice")
                            "Hello, #{receiver}!"
                        end

                        def run_spec
                            %x!rspec #{File.join(@path,"hello_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                            # %x!rspec #{File.join(Rails.root,@path,"temperature_spec.rb")} --format html --out #{Rails.root.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end




#write your code here

def hello
    "Hello!"
end

def greet(receiver="Alice")
    "Hello, #{receiver}!"
end

#end of original code


# TheHackingProject::S2DecouverteRuby::J2Rspec::P00Hello::Hello.new.run_spec
# rspec hello_spec.rb --format html --out rspec_results.html
