module Projects
  class ThpController < ApplicationController
      protect_from_forgery except: :execute
      def execute

      end



      # #not use for now
      # def oeuvres
      #     # render :html => "ok"
      #     filepath = Rails.root.join('app/services/The_Hacking_Project/S2_Decouverte_Ruby/J1_Init_Ruby/chiffre_de_cesar.rb')
      #     output = `ruby -r #{filepath} -e 'ChiffreDeCesar.new("nil",32)'`
      #     puts output
      #     @var = output
      #     render :html => @var
      #     # render :template => projects_oeuvres_path
      #
      #     case day_nbr # /!\ day and week are inversed     use this method only if tou use the root :  get 'thp/week/:w_nbr/day/:d_nbr/oeuvres', action: 'oeuvres', controller: 'thp', as:	:oeuvres
      #         when 1
      #             case week_nbr
      #                 when 1 then oeuvres1_1
      #                 when 2 then oeuvres2_1
      #                 when 3 then oeuvres3_1
      #                 when 4 then oeuvres4_1
      #                 when 5 then oeuvres5_1
      #                 when 6 then oeuvres6_1
      #                 when 7 then oeuvres7_1
      #                 when 8 then oeuvres8_1
      #                 when 9 then oeuvres9_1
      #             end
      #         when 2
      #             case week_nbr
      #                 when 1 then oeuvres1_2
      #                 when 2 then oeuvres2_2
      #                 when 3 then oeuvres3_2
      #                 when 4 then oeuvres4_2
      #                 when 5 then oeuvres5_2
      #                 when 6 then oeuvres6_2
      #                 when 7 then oeuvres7_2
      #                 when 8 then oeuvres8_2
      #                 when 9 then oeuvres9_2
      #             end
      #         when 3
      #             case week_nbr
      #                 when 1 then oeuvres1_3
      #                 when 2 then oeuvres2_3
      #                 when 3 then oeuvres3_3
      #                 when 4 then oeuvres4_3
      #                 when 5 then oeuvres5_3
      #                 when 6 then oeuvres6_3
      #                 when 7 then oeuvres7_3
      #                 when 8 then oeuvres8_3
      #                 when 9 then oeuvres9_3
      #             end
      #         when 4
      #             case week_nbr
      #                 when 1 then oeuvres1_4
      #                 when 2 then oeuvres2_4
      #                 when 3 then oeuvres3_4
      #                 when 4 then oeuvres4_4
      #                 when 5 then oeuvres5_4
      #                 when 6 then oeuvres6_4
      #                 when 7 then oeuvres7_4
      #                 when 8 then oeuvres8_4
      #                 when 9 then oeuvres9_4
      #             end
      #         when 5
      #             case week_nbr
      #                 when 1 then oeuvres1_5
      #                 when 2 then oeuvres2_5
      #                 when 3 then oeuvres3_5
      #                 when 4 then oeuvres4_5
      #                 when 5 then oeuvres5_5
      #                 when 6 then oeuvres6_5
      #                 when 7 then oeuvres7_5
      #                 when 8 then oeuvres8_5
      #                 when 9 then oeuvres9_5
      #             end
      #
      #         else
      #           "You gave me #{day_nbr} -- I have no idea what to do with that."
      #     end
      # end
      #



        def oeuvres1_1
            render :html => "To check by Github account"
        end
        def oeuvres1_2
            render file: "#{Rails.root}/app/assets/the_hacking_project/W1D2/CodeWeb3.html.erb", layout: false

        end
        def oeuvres1_3
            render :file => "#{Rails.root}/app/assets/the_hacking_project/W1D3/GooglePage.html.erb", layout: false
        end
        def oeuvres1_4
            arguments = { "google"   =>  Proc.new {render :file =>"#{Rails.root}/app/assets/the_hacking_project/W1D4/Projet_Google_2/GooglePage", layout: false and return},
                          "mozilla"  =>  Proc.new {render file: "#{Rails.root}/app/assets/the_hacking_project/W1D4/Javasripts/beginner_html_site_styled_gh_pages/index", layout: false and return},
            }
            perform_search_choice_selection(arguments, projects_oeuvres1_4_path)
        end
        def oeuvres1_5
            render :html => "To check by Github account"
        end


        def oeuvres2_1
          arguments = { "cesar"        =>  Proc.new { @res = TheHackingProject::S2DecouverteRuby::J1InitRuby::ChiffreDeCesar.new.chiffre_de_cesar(@task_params[:search].to_s, @task_params[:number].to_i)},
                        "multiplesum"  =>  Proc.new { @res = TheHackingProject::S2DecouverteRuby::J1InitRuby::SumOfMultiples.new.sum_of_multiples(*@task_params[:search].split(",").map{|nbr| nbr.to_i}, 0, @task_params[:number].to_i)},
                        "trader"       =>  Proc.new { @res = TheHackingProject::S2DecouverteRuby::J1InitRuby::StockPicker.new.trader_du_dimanche(@task_params[:search].split(",").map{|nbr| nbr.to_i}).to_s},
                        "decomptemots" =>  Proc.new { @res = TheHackingProject::S2DecouverteRuby::J1InitRuby::CompterLesMots.new.jean_michel_data(@task_params[:text].to_s, @task_params[:search].to_s).to_s}
          }
          perform_search_choice_selection(arguments, projects_oeuvres2_1_path, display_layout: "application_base")
        end
        def oeuvres2_2
            arguments = {
                          "hello"       =>  Proc.new { |arg| render :template => "/projects/thp/week/2/day/2/rspec_results.html" and return},
                          "temperature" =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results0.html" and return},
                          "calculator"  =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results1.html" and return},
                          "simon_says"  =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results2.html" and return},
                          "pig_latin"   =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results3.html" and return},
                          "book_titles" =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results4.html" and return},
                          "timer"       =>  Proc.new {render :template => "/projects/thp/week/2/day/2/rspec_results5.html" and return}
                        }
            perform_search_choice_selection(arguments, projects_oeuvres2_2_path)
        end
        def oeuvres2_3
            render :html => "not done"
        end

        def oeuvres2_4
            arguments = { "incubateur" =>  Proc.new {render :json => TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::Incubateurs.new.incubateurs and return},
                          "obscur_trader" =>  Proc.new {render :json => TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::ObscurTrader.new.obscur_trader and return},
                          "route_mairie" =>  Proc.new {render :json => TheHackingProject::S2DecouverteRuby::J4Nokogiri::Projet::RouteMairie.new.perform and return}       }
            render_default =  projects_oeuvres2_4_path
            perform_search_choice_selection(arguments, render_default)
        end

        def oeuvres2_5
            render :html => TheHackingProject::S2DecouverteRuby::J5Watir::WatirGoogle.new.perform
        end


        def oeuvres3_1
            render :html => "connexion backend"
        end
        def oeuvres3_2
            render :html => "program mail back-end"
        end
        def oeuvres3_3
            arguments = { "hi" =>            Proc.new {redirect_to sinatra_path and return},
                          "monkey" =>        Proc.new {render file: TheHackingProject::S3RubyIntermediaire::J3Poo::Monkey.new.run_spec and return},
                          "orange_tree" =>   Proc.new {render file: TheHackingProject::S3RubyIntermediaire::J3Poo::OrangeTree.new.run_spec, layout: false and return},
                          "scrabble_word" => Proc.new {render file: TheHackingProject::S3RubyIntermediaire::J3Poo::ScrabbleWord.new.run_spec and return},
                          "superhero" =>     Proc.new {render :html => TheHackingProject::S3RubyIntermediaire::J3Poo::Superhero.new("name","age","superpower") and return}
                        }
            render_default =  projects_oeuvres3_3_path
            perform_search_choice_selection(arguments, render_default)
            # the main render path generated# render :html => "../services/the_hacking_project/s3_ruby_intermediaire/j3_poo/rspec_results.html" #SEE IF IS POSSIBLE :=> is not possible until add services path to view path in config/application.rb or change the file generated path in every program to view path
        end
        def oeuvres3_4
            TheHackingProject::S3RubyIntermediaire::J4TicTacToe::ProjetTicTacToe.new.run_spec
            render :file => "../services/the_hacking_project/s3_ruby_intermediaire/j4_tic_tac_toe/rspec_results.html"
        end
        def oeuvres3_5
            render :html => "not done"
        end


        def oeuvres4_1
            render :html => "not done"
        end
        def oeuvres4_2
            render :template => projects_oeuvres4_2_path, layout: false #custom template
        end
        def oeuvres4_3
            arguments = { "gossip" =>      Proc.new {redirect_to the_gossip_project_path and return},
                          "moussaillon" => Proc.new {redirect_to thp_moussaillons_path and return},
                        }
            render_default =  projects_oeuvres4_3_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres4_4
            redirect_to base_de_donnees_path
        end
        def oeuvres4_5
            render :html => "not done"
        end


        def oeuvres5_1
            redirect_to univers_response_path
        end
        def oeuvres5_2
            redirect_to univers_response_path
        end
        def oeuvres5_3
            render :html => "not done"
        end
        def oeuvres5_4
            arguments = { "reservation" =>  Proc.new {redirect_to reservation_path and return},
                          "usine" =>        Proc.new {redirect_to usine_path and return},
                          "generate" =>     Proc.new {redirect_to generate_path and return},
                          "courses" =>      Proc.new {redirect_to courses_path and return},
                        }
            render_default =  projects_oeuvres5_4_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres5_5
            redirect_to eventbrite_path
        end


        def oeuvres6_1
            redirect_to reservation_vol_path
        end
        def oeuvres6_2
            arguments = { "devise_demo" =>  Proc.new {redirect_to devise_demo_path and return},
                          "home_page" =>    Proc.new {redirect_to home_page_path and return},
                        }
            render_default =  projects_oeuvres6_2_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres6_3
            render :html => "not done"
        end
        def oeuvres6_4
            load("#{Rails.root}/engines/thp/week/6/day/4/rails_service/services/say_hello.rb")
            arguments = { "twitter_bis" =>   Proc.new {redirect_to twitter_bis_path and return},
                          "rails_service" => Proc.new {render html: SayHello.new.perform and return},
                        }
            render_default =  projects_oeuvres6_4_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres6_5
            render :html => "not done"
        end


        def oeuvres7_1 #to move file engine to views beacause convention already violated
            # render action: 'week/7/day/1/oeuvres7_1', :layout => 'application'
            # render template: projects_home_path || projects_oeuvres6_4_path
            render file: "#{Rails.root}/engines/thp/week/7/day/1/youtube/index"
        end
        def oeuvres7_2
            redirect_to formulaire_stylay_path
        end
        def oeuvres7_3
            # render action: 'week/7/day/3/article', :layout => 'application'
            render file: "#{Rails.root}/engines/thp/week/7/day/3/new_york_times/page/article.html.erb"
        end
        def oeuvres7_4  #to move file engine to views beacause convention already violated
            arguments = { "checkr" => Proc.new {render file: "#{Rails.root}/engines/thp/week/7/day/4/landing_pages/homes/checkr.html.erb", layout: "layouts/../projects/thp/week/7/day/4/homes" and return},
                          "flynn" => Proc.new {render file: "#{Rails.root}/engines/thp/week/7/day/4/landing_pages/homes/flynn.html.erb", layout: "layouts/../projects/thp/week/7/day/4/homes" and return},
                          "sparks" => Proc.new {render file: "#{Rails.root}/engines/thp/week/7/day/4/landing_pages/homes/sparks.html.erb", layout: "layouts/../projects/thp/week/7/day/4/homes" and return},
                        }
            render_default =  projects_oeuvres7_4_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres7_5
            render :html => "not done"
        end



        def oeuvres8_1
            render :html => "not done"
        end
        def oeuvres8_2
            render :html => "not done"
        end
        def oeuvres8_3 #to move file engine to views beacause convention already violated
            arguments = { "warmup" => Proc.new {      render file: "#{Rails.root}/engines/thp/week/8/day/3/a1_warnup/index" and return},
                          "calculatrice" => Proc.new {render file: "#{Rails.root}/engines/thp/week/8/day/3/a2_calculatrice/index" and return},
                          "simon" => Proc.new {       render file: "#{Rails.root}/engines/thp/week/8/day/3/a3_simon/index" and return},
                        }
            render_default =  projects_oeuvres8_3_path
            perform_search_choice_selection(arguments, render_default)
        end
        def oeuvres8_4 #to move file engine to views beacause convention already violated
            render projects_oeuvres8_4_path
        end
        def oeuvres8_5
            render :html => "not done"
        end


        def oeuvres9_1
            render :html => "not done"
        end
        def oeuvres9_2
            render file: "#{Rails.root}/engines/thp/week/9/day/2/google.html"
        end
        def oeuvres9_3
            redirect_to email_viewer_path
        end
        def oeuvres9_4
            render :html => "not done"
        end
        def oeuvres9_5
            render :html => "not done"
        end


        def perform_search_choice_selection(args={}, main_page, display_layout: "application_base")              # method for AJAX requests otherwise mainpage is displayed
            if params.permit(:commit).values.join.include?("Perform Task") then
               @task_params = args.map do |key,value|
                                    begin params.require(key.to_sym)  rescue  nil end  #getting the search performed
                              end.compact.sample.permit(:search, :number, :text)

               @name_task_params = params.to_unsafe_h.select{|key,value| value.class != String}.keys.first    # ActiveSupport::HashWithIndifferentAccess   recupere la clé du hash avec le tableau [des params of the search_task] en valeur
               args[@name_task_params].call     #value must be a proc (use return because can't use two(render/redirect) times)
            end
            render :template => main_page, layout: display_layout
        end
  end
end
