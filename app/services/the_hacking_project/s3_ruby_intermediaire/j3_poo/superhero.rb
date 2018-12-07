module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
               class Person
                 attr_accessor :name, :age

                 def initialize(name, age)
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::Superhero.new
                   # the code was completed,can be uploaded to the source if neeeded
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::Superhero.new.run_spec
                   # rspec superhero_spec.rb --format html --out rspec_results.html

                   @name = name
                   @age  = age
                 end

                 def to_s
                   "the name of the person is #{@name} he are #{@age} years"
                 end
               end

               class Superhero < Person
                 attr_accessor :superpower

                 def initialize(name, age, superpower)
                   super(name, age) #or super
                   @superpower = superpower
                 end

                 def to_s
                   "the name of the person is #{@name} he are #{@age} years, #{@superpower} is his superpower"
                 end
               end

               def run_spec
                   %x!rspec #{File.join(@path,"superhero_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                   %x!opera #{File.join(@path,"rspec_results.html")}!
               end
       end
   end
end
