class GroupsController < ApplicationController
  before_action :set_group, only:[:add_athlete]
  
  def add_athlete
    @athletes = Athlete.all - @group.athletes
  end

  def set_group
    @group = Group.find(params["g_id"])
  end
  
end
