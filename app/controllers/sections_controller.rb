class SectionsController < ApplicationController
  def add
    @section = Section.new(section_params)
    @section.save
    redirect_to :back
  end

  private

  def section_params
    params.require(:section).permit(:length, :time, :break, :sequence, :atraining_id)
  end

end
