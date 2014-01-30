class Trainer < ActiveRecord::Base
  require 'digest/md5'
  
  has_many :athletes
  has_many :trainings
  
  
  def display_name 
    name + " " + surname
  end
  
  def authenticate (pass)
    self.password == Digest::MD5.hexdigest(pass)
  end
  
  def athletes_list
    athletes.order("surname asc")
  end
end
