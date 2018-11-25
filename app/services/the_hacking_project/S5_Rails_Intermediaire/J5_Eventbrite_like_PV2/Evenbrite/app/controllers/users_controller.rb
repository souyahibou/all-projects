class UsersController < ApplicationController
  before_action{ @events = Event.all, @users = User.all }
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
      create_bis
  end

  def update
      update_bis
  end

  def edit
  end

  def destroy
      destroy_bis
  end

  def index
  end

  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.fetch(:user, {})
        params.require(:user).permit(:name)

      end

      def event_params
        params.require(:event).permit(:description, :date,:place,:creator_id)
      end

      def create_bis
        @user = User.new(user_params)

        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      def update_bis
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to @user, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end


      def destroy_bis
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
