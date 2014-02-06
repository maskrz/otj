class Training < ActiveRecord::Base
  has_many :athletes, :through => :atrainings
  has_many :atrainings
  has_many :sections, :through => :atrainings
  belongs_to :trainer
  
  TRAINING_TYPES = ["Tempo", "Szybkosc", "Zawody"]
  
  def added(athlete)
    !Atraining.where(training_id: id, athlete_id: athlete.id).empty?
  end
  
  def participate(athlete)
    if added(athlete)
      !Atraining.where(training_id: id, athlete_id: athlete.id).take.sections.empty?
    else
      false
    end
  end
  
  def training_exists(date, trainer)
    @trainings = Training.where(date: date, trainer_id: trainer.id)
    !@trainings.empty?
  end
  
  def display_name
    date.to_s  + " "+ trainer.display_name if trainer
  end
  
  def athlete_training_sections(athlete)
    @athlete = Athlete.find(athlete)
    @atraining = Atraining.where(training_id: id, athlete_id: @athlete.id).first
    @sections = @athlete.sections.where(atraining_id: @atraining.id).order('sequence ASC')
  end
  
  def athlete_training_sections_values(athlete, section)
    @athlete = Athlete.find(athlete)
    @atraining = Atraining.where(training_id: id, athlete_id: @athlete.id).first
    @sections = @athlete.sections.where(atraining_id: @atraining.id, length: section).order('sequence ASC')
  end
  
  def training_full_name
    date.to_s + " "+training_type
  end
  
  def participants_quantity
    athletes.size
  end
  
end
