class TrainingsController < ApplicationController
  before_action :set_training, only: [:show]
  def new_training
    @trainers = Trainer.all
    @types = Training::TRAINING_TYPES
  end
  
  def add_training
    @training = Training.new(training_params)
    
    @date = params[:training]["date(1i)"] + "-"+params[:training]["date(2i)"]+"-"+params[:training]["date(3i)"]
    @trainer = current_user if user_type == "T"
    @trainer = current_user.trainer if user_type == "A"
    if @training.training_exists(@date, @trainer)
      redirect_to :back, :flash => { :error => "Trening w tym dniu zostal juz utworzony. Wypelnij go, lub wybierz inna date."}
    else
      @training.save
      redirect_to trainings_path(@training)
    end
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
    @atraining = Atraining.where(training_id: @training.id, athlete_id: @athlete.id).first
  end
  
  def trainings_history
    #render json: params[:id]
    @athlete = Athlete.find(params[:id])
    @trainings = @athlete.trainings.order("date desc")
    @sec = @athlete.sections.order("length desc").map{|x| x.length}.uniq
    @states = Athlete::STATE_TYPES
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
      params.require(:training).permit(:date, :comment, :type, :trainer_id)
    end
end
