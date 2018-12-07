module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
           class OrangeTree
               attr_accessor :height, :years_old, :oranges
               @@all = []
               @@cpt = 0
               def initialize(height=0)
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.new.perform
                   # the code was completed,can be uploaded to the source if neeeded
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.new.run_spec
                   # rspec orange_tree_spec.rb --format html --out rspec_results.html
                   @height    = height
                   @years_old = 0
                   @oranges   = 0
                   @@all.push(self)
                   @@cpt      +=1
               end


###########################################
###########################################BONUS#######################
               def self.all #here refers to class User and not to the instance
                   return @@all
               end

               def OrangeTree.ages_one_year_every_trees     # Age all the trees by one year
                   @@all.select{|tree| tree.one_year_passes}
               end

               def OrangeTree.all_oranges     # Pick and count all the fruit
                   @@all.select{|tree| tree.years_old < 51}.map{|tree| tree.oranges}.sum
               end

               def OrangeTree.average_heaight     # Calculate average height and fruit of all orange trees
                   @@all.map{|tree| tree.height}.sum.to_f / @@all.size
               end

               def OrangeTree.average_oranges
                   OrangeTree.all_oranges.to_f            / OrangeTree.all.size
               end
############################################BONUS#######################
############################################

               def one_year_passes
                   @years_old  += 1
                   @height      = 0  if years_old > 50
                   @oranges    += 20 if years_old > 4
               end

               def pick
                   @oranges    -=1   if @oranges > 0
               end

               def oranges
                   @oranges = [(20 + @years_old), @oranges].min
               end

               def run_spec
                   %x!rspec #{File.join(@path,"orange_tree_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                   %x!opera #{File.join(@path,"rspec_results.html")}!
               end
           end
       end
   end
end
