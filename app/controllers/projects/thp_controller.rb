module Projects
  class ThpController < ApplicationController
      protect_from_forgery except: [:federdo_calculatrice, :googleMapsAPI_THP_P43]
      def oeuvres
          # render :html => "ok"
          filepath = Rails.root.join('app/services/The_Hacking_Project/S2_Decouverte_Ruby/J1_Init_Ruby/chiffre_de_cesar.rb')
          output = `ruby -r #{filepath} -e 'ChiffreDeCesar.new("nil",32)'`
          puts output
          @var = output
          render :html => @var
          # render :template => projects_oeuvres_path

          case day_nbr # /!\ day and week are inversed     use this method only if tou use the root :  get 'thp/week/:w_nbr/day/:d_nbr/oeuvres', action: 'oeuvres', controller: 'thp', as:	:oeuvres
              when 1
                  case week_nbr
                      when 1 then oeuvres1_1
                      when 2 then oeuvres2_1
                      when 3 then oeuvres3_1
                      when 4 then oeuvres4_1
                      when 5 then oeuvres5_1
                      when 6 then oeuvres6_1
                      when 7 then oeuvres7_1
                      when 8 then oeuvres8_1
                      when 9 then oeuvres9_1
                  end
              when 2
                  case week_nbr
                      when 1 then oeuvres1_2
                      when 2 then oeuvres2_2
                      when 3 then oeuvres3_2
                      when 4 then oeuvres4_2
                      when 5 then oeuvres5_2
                      when 6 then oeuvres6_2
                      when 7 then oeuvres7_2
                      when 8 then oeuvres8_2
                      when 9 then oeuvres9_2
                  end
              when 3
                  case week_nbr
                      when 1 then oeuvres1_3
                      when 2 then oeuvres2_3
                      when 3 then oeuvres3_3
                      when 4 then oeuvres4_3
                      when 5 then oeuvres5_3
                      when 6 then oeuvres6_3
                      when 7 then oeuvres7_3
                      when 8 then oeuvres8_3
                      when 9 then oeuvres9_3
                  end
              when 4
                  case week_nbr
                      when 1 then oeuvres1_4
                      when 2 then oeuvres2_4
                      when 3 then oeuvres3_4
                      when 4 then oeuvres4_4
                      when 5 then oeuvres5_4
                      when 6 then oeuvres6_4
                      when 7 then oeuvres7_4
                      when 8 then oeuvres8_4
                      when 9 then oeuvres9_4
                  end
              when 5
                  case week_nbr
                      when 1 then oeuvres1_5
                      when 2 then oeuvres2_5
                      when 3 then oeuvres3_5
                      when 4 then oeuvres4_5
                      when 5 then oeuvres5_5
                      when 6 then oeuvres6_5
                      when 7 then oeuvres7_5
                      when 8 then oeuvres8_5
                      when 9 then oeuvres9_5
                  end

              else
                "You gave me #{day_nbr} -- I have no idea what to do with that."
          end
      end




        def oeuvres1_1
            render :template => projects_oeuvres1_1_path
        end
        def oeuvres1_2
            
        end
        def oeuvres1_3
        end
        def oeuvres1_4
        end
        def oeuvres1_5
        end


        def oeuvres2_1
        end
        def oeuvres2_2
        end
        def oeuvres2_3
        end
        def oeuvres2_4
        end
        def oeuvres2_5
        end


        def oeuvres3_1
        end
        def oeuvres3_2
        end
        def oeuvres3_3
        end
        def oeuvres3_4
        end
        def oeuvres3_5
        end


        def oeuvres4_1
        end
        def oeuvres4_2
        end
        def oeuvres4_3
        end
        def oeuvres4_4
        end
        def oeuvres4_5
        end


        def oeuvres5_1
        end
        def oeuvres5_2
        end
        def oeuvres5_3
        end
        def oeuvres5_4
        end
        def oeuvres5_5
        end


        def oeuvres6_1
        end
        def oeuvres6_2
        end
        def oeuvres6_3
        end
        def oeuvres6_4
        end
        def oeuvres6_5
        end


        def oeuvres7_1
        end
        def oeuvres7_2
        end
        def oeuvres7_3
        end
        def oeuvres7_4
        end
        def oeuvres7_5
        end



        def oeuvres8_1
        end
        def oeuvres8_2
        end
        def oeuvres8_3
        end
        def oeuvres8_4
        end
        def oeuvres8_5
        end


        def oeuvres9_1
        end
        def oeuvres9_2
        end
        def oeuvres9_3
        end
        def oeuvres9_4
        end
        def oeuvres9_5
        end

  end
end
