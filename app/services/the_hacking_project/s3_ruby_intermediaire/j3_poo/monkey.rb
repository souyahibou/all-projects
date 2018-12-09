module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
           class Monkey
               attr_accessor :name, :species, :foods_eaten

               def initialize(name="no_name", species="no_species")
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::Monkey.new.perform
                   # the code was completed,can be uploaded to the source if neeeded
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::Monkey.new.run_spec
                   # rspec monkey_spec.rb --format html --out rspec_results.html
                   @name = name.capitalize
                   @species = species
                   @foods_eaten = []
               end

               def eat(food)
                   @foods_eaten << food unless "aeiouy".include?(food[0].downcase)
               end

               def introduce
                   "hello, my name is #{self.name}, I am #{self.species}, I have eaten #{self.foods_eaten.join(', ')}"
               end

               def run_spec
                   %x!rspec #{File.join(@path,"monkey_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                   %x!opera #{File.join(@path,"rspec_results.html")}!
                   return File.join(@path,"rspec_results.html")
               end
           end
       end
   end
end
