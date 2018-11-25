module TheHackingProject
		module S2DecouverteRuby
				module J2Rspec
        		    module P06Timer
        						class Timer
                        def initialize
                            puts " ;)"
                            @path = "app/services/the_hacking_project/s2_decouverte_ruby/j2_rspec/p06_timer/"
                            # TheHackingProject::S2DecouverteRuby::J2Rspec::P06Timer::Timer.new.run_spec
                            # rspec timer_spec.rb --format html --out rspec_results.html
                        end

                        def run_spec
                            %x!rspec #{File.join(@path,"timer_spec.rb")} --format html --out #{File.join(@path,"rspec_results.html")}!
                            %x!opera #{File.join(@path,"rspec_results.html")}!
                        end
        						end
        		    end
				end
		end
end

class Timer
  #write your code here
  # make after THP

  attr_accessor :time

  def initialize
      @time = 0
  end

  def seconds
      @time
  end

  def seconds=(time)
      @time = time
  end

  def time_string
      Time.at(@time).utc.strftime("%H:%M:%S")
  end

end
