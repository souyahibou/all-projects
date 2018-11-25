class FirstcController < ApplicationController
      def index

        render :inline => "<%=Author.all %> <br>
                           <%=Lecon.all %>  <br>
                           Post.all        <br>
                           <%=Cour.all %>   <br>

                           <p> let's Manipulate BDD in the back_end</p>        <br>
                           render rails g scaffold_controller Lecon   <br>
                           render rails g scaffold_controller Post    <br>
                           render rails g scaffold_controller Cour    <br>
                           and adapts the relations: see project instructions
                           "
      end
end
