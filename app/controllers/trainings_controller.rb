class TrainingsController < ApplicationController
  before_action :set_training, only: [:show]
  def new_training
    @trainers = Trainer.all
  end
  
  def add_training
    @training = Training.new(training_params)
    @training.save
    redirect_to trainings_path(@training)
    #render json: @training.comment
  end
  
  def show
    @athletes = @training.athletes
    @trainer = @training.trainer
    @all_athletes = @trainer.athletes - @athletes
  end
  
  def remove_athlete
    @at = Atraining.where(training_id: params["t_id"]).where(athlete_id: params["a_id"]).first
    @at.destroy
    redirect_to :back
  end
  
  def add_athlete
    @at = Atraining.new
    @at.athlete_id = params["a_id"]
    @at.training_id = params[:id]
    @at.save
    if(user_type == 'T')
      redirect_to :back
    else
      redirect_to '/trainings/fill_training/'+(params[:id])
    end
  end
  
  def fill_training
    @training = Training.find(params[:id])
    @athlete = current_user
    @sections = @athlete.sections_list(@athlete.get_at(@training.id, @athlete.id))
  end
  
  def trainings_history
    #render json: params[:id]
    @athlete = Athlete.find(params[:id])
    @trainings = @athlete.trainings.order("date desc")
    @sec = @athlete.sections.order("length desc").map{|x| x.length}.uniq
    
  end
  
  def trainer_trainings
    @trainer = Trainer.find(params[:id])
    @trainings = @trainer.trainings.order("date desc")
  end
  
  private
    def set_training
      @training = Training.find(params[:id])
    end
    
    def training_params
      params.require(:training).permit(:date, :comment, :trainer_id)
    end
end
