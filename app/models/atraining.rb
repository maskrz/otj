class Atraining < ActiveRecord::Base
  belongs_to :training
  belongs_to :athlete
  has_many :sections, :dependent => :delete_all
  
  def display_name
    athlete.full_name + " <=> " + training.display_name
  end
end
