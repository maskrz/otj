class HomeController < ApplicationController
  def home
    if current_user
      if user_type == "T"
        redirect_to profile_trainer_page_path
      else
        redirect_to profile_athlete_page_path
      end
    end
    @groups = Group.all
  end
end
