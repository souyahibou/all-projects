module TheHackingProject
   module S3RubyIntermediaire
       module J3Poo
           class ScrabbleWord
               attr_accessor :word, :score

               Code_letters = {a: 1, b: 3, c: 3, d: 2, e: 1,
                 f: 4, g: 2, h: 4, i: 1, j: 8,
                 k: 5, l: 1, m: 3, n: 1, o: 1,
                 p: 3, q: 10, r: 1, s: 1, t: 1,
                 u: 1, v: 4, w: 4, x: 8, y: 4,
                 z: 10}

               def initialize(word="A")
                   puts " ;)"
                   @path = "app/services/the_hacking_project/s3_ruby_intermediaire/j3_poo/"
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::ScrabbleWord.new.perform
                   # TheHackingProject::S3RubyIntermediaire::J3Poo::ScrabbleWord.new.run_spec
                   # rspec scrabble_word_spec.rb --format html --out rspec_results.html
                   @word = word
               end

               def word
                   @word.downcase
               end
               def score
                   word.chars.map{|chr| Code_letters[chr.to_sym]}.sum
               end

               def multiplier_score(factor = 2)
                   score * factor
               end

               def run_spec
                   %x!rspec #{File.join(@path,"scrabble_word_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                   # %x!opera #{File.join(@path,"rspec_results.html")}!
                   return File.join(@path,"rspec_results.html")
               end
           end
       end
   end
end
