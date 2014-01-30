class Trainer < ActiveRecord::Base
  has_many :athletes
  has_many :trainings
  
  
  def display_name 
    name + " " + surname
  end
  
  def athletes_list
    athletes.order("surname asc")
  end
end
