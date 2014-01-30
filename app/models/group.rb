class Group < ActiveRecord::Base
  has_many :athletes, :through => :gathletes
  has_many :gathletes
  
  def training_list (tid)
    Training.where(trainer_id: tid).order('date DESC').first(5)
  end
  
  def athletes_list(gid)
    @group = Group.find(gid)
    @group.athletes.order('surname ASC')
  end
end
