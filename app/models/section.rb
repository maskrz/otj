class Section < ActiveRecord::Base
  belongs_to :atraining
  has_many :trainings, :through => :atraining
  has_one :athlete, :through => :atraining
  
  def display_name
    length.to_s + " "+time.to_s
  end
end
