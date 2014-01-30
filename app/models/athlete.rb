class Athlete < ActiveRecord::Base
  require 'digest/md5'
  
  belongs_to :trainer
  has_many :trainings, :through => :atrainings
  has_many :atrainings
  has_many :sections, :through => :atrainings
  
  PRIVACY_TYPES = ["Wszyscy", "Zarejestrowani", "Zawodnicy z grupy", "Tylko ja"]
  
  def sections_list (atid)
    Section.where(atraining_id: atid).order('sequence ASC')
  end
  
  def get_at (tid, aid)
    Atraining.where(training_id: tid).where(athlete_id: aid).first
  end
  
  def last_section_sequence (atid)
    sections_list(atid).size+1
  end
  
  def full_name
    name+ " "+surname
  end
  
  def get_trainings ()
    @trainings = trainings.order("date asc")
  end
  
  def authenticate (pass)
    self.password == Digest::MD5.hexdigest(pass)
  end
  
end
