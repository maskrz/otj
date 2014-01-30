class ProfilesController < ApplicationController
  require 'enumerator'
  
  def athlete_page
    @athlete = current_user
    @trainer_trainings = Training.where(trainer_id: current_user.trainer.id).order('date DESC')
    @my_trainings = []
    @trainer_trainings.each do |t|
      if t.added(current_user)
        @my_trainings.append(t)
      end
    end
    @other_trainings = @trainer_trainings - @my_trainings
    @types = Athlete::PRIVACY_TYPES
  end
  
  def trainer_page
    @trainer = current_user
    @athletes = Athlete.where(trainer_id: current_user.id)
    @trainings = Training.where(trainer_id: current_user.id).order('date DESC').first(5)
    
    
  end
  
  def update_trainer
    #render json: params[:trainer]["birth(1i)"] + "-"+params[:trainer]["birth(2i)"]+"-"+params[:trainer]["birth(3i)"]
    @trainer = current_user
    @trainer.name = params[:trainer][:name]
    @trainer.surname = params[:trainer][:surname]
    @trainer.email = params[:trainer][:email]
    pass_changed = false
    @trainer.birth = params[:trainer]["birth(1i)"] + "-"+params[:trainer]["birth(2i)"]+"-"+params[:trainer]["birth(3i)"]
    
    if(params[:trainer][:password] == params[:trainer][:password_confirmation] && !params[:trainer][:password].blank?)
      @trainer.password = params[:trainer][:password]
      pass_changed = true
    end    
    
    if @trainer.changed?
      @trainer.save
      redirect_to root_path, notice: "Zmiany zostaly zapisane"
    else
      redirect_to root_path, notice: "Nie zapisano zadnych zmian"
    end
  end
  
  def update_athlete
    #render json: params
    @athlete = current_user
    @athlete.name = params[:athlete][:name]
    @athlete.surname = params[:athlete][:surname]
    @athlete.email = params[:athlete][:email]
    case params[:athlete][:privacy]
    when "Wszyscy"
      @athlete.privacy = 1
    when "Zarejestrowani"
      @athlete.privacy = 2
    when "Zawodnicy z grupy"
      @athlete.privacy = 3
    when "Tylko ja"
      @athlete.privacy = 4
    else
      @athlete.privacy = 4
    end
    
    pass_changed = false
    @athlete.birth = params[:athlete]["birth(1i)"] + "-"+params[:athlete]["birth(2i)"]+"-"+params[:athlete]["birth(3i)"]
    
    if(params[:athlete][:password] == params[:athlete][:password_confirmation] && !params[:athlete][:password].blank?)
      @athlete.password = params[:athlete][:password]
      pass_changed = true
    end    
    
    if @athlete.changed?
      @athlete.save
      redirect_to root_path, notice: "Zmiany zostaly zapisane"
    else
      redirect_to root_path, notice: "Nie zapisano zadnych zmian"
    end
  end
  
  
end
