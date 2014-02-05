class AthletesController < ApplicationController
  require 'digest/md5'
  
  
  def new_athlete
    @athlete = Athlete.new(athlete_params)
    @athlete.email = params[:athlete][:name][0, 2].downcase + params[:athlete][:surname][0, 3].downcase + "@gmail.com" if params[:athlete][:email].blank?
    #render json: athlete_params
    @athlete.privacy = 4
    pass = params[:athlete][:name][0, 2].downcase + params[:athlete][:surname][0, 3].downcase
    @athlete.password = Digest::MD5.hexdigest(pass)
    @athlete.state = 1
    @athlete.save
    redirect_to root_path, notice: "Dodano nowego zawodnika"
  end

  def add_athlete
    @athletes = Athlete.where("trainer_id is null")
  end
  
  def assign_athlete
    #render json: params
    @athlete = Athlete.find(params["athlete"]["athlete_id"])
    @athlete.trainer_id = current_user.id
    @athlete.save
    redirect_to root_path, notice: "Dodano nowego zawodnika"
  end
  
  def athletes_list
    @trainers = Trainer.all.order("surname asc")
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_athlete
      @athlete = Athlete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def athlete_params
      params.require(:athlete).permit(:name, :surname, :birth, :email, :password, :state, :privacy, :trainer_id)
    end
end
