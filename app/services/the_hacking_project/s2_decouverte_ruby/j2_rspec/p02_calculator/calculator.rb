module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P02Calculator
        						class Calculator
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p02_calculator/"
                        end

                        # def add(a, b)
                        #   a+b
                        #
                        # end
                        #
                        # def subtract(a, b)
                        #   a-b
                        #
                        # end
                        #
                        # def sum(a)
                        #     res = 0
                        #     a.each { |i| res += i }
                        #     res
                        #
                        # end
                        #
                        # def multiply(a)
                        #     res = 1
                        #     a.each { |i| res *= i }
                        #     res
                        # end
                        #
                        # def product(array)
                        #   final = 0.0
                        #   array.each do |i|
                        #     final *= i
                        #   end
                        #   return final
                        # end
                        #
                        #
                        # def power(a, b)
                        #   a**b
                        # end
                        #
                        # def factorial(a)
                        #   res = 1
                        #   unless a == 0
                        #     for i in 1..a
                        #       res *= i
                        #     end
                        #   end
                        #   return res.abs
                        # end


                        def run_spec
                            %x!rspec #{File.join(@path,"calculator_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end

# TheHackingProject::S2DecouverteRuby::J2Rspec::P02Calculator::Calculator.new.run_spec
# rspec calculator_spec.rb --format html --out rspec_results.html

#write your code here
def add(a, b)
  a+b

end

def subtract(a, b)
  a-b

end

def sum(a)
    res = 0
    a.each { |i| res += i }
    res

end

def multiply(a)
    res = 1
    a.each { |i| res *= i }
    res
end

def product(array)
  final = 0.0
  array.each do |i|
    final *= i
  end
  return final
end


def power(a, b)
  a**b
end

def factorial(a)
  res = 1
  unless a == 0
    for i in 1..a
      res *= i
    end
  end
  return res.abs
end

puts sum([1,2,3,4]);
puts multiply([5,4,8]);
puts power(3,3);
puts factorial(10);
puts factorial(1);
puts factorial(0);

#end of original implementation
