class GathletesController < ApplicationController
  def add_athlete
    @gathlete = Gathlete.new
    @gathlete.group_id = params["gathlete"]["group_id"]
    @gathlete.athlete_id = params["gathlete"]["athlete_id"]
    @gathlete.save
    redirect_to root_path, notice: "Dodano nowego zawodnika"
  end
end
