require_dependency "base_de_donnees/application_controller"

module BaseDeDonnees
  class FirstcController < ApplicationController
        def index

          render :inline => "<%=BaseDeDonnees::Author.all %> <br>
                             <%=BaseDeDonnees::Lecon.all %>  <br>
                             <%=BaseDeDonnees::Post.all %>   <br>
                             <%=BaseDeDonnees::Cour.all %>   <br>

                             <p> let's Manipulate BDD in the back_end</p>        <br>
                             render rails g scaffold_controller Lecon   <br>
                             render rails g scaffold_controller Post    <br>
                             render rails g scaffold_controller Cour    <br>
                             and adapts the relations: see project instructions
                             "
        end
  end
end
