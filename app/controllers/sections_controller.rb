class SectionsController < ApplicationController
  def add
    @section = Section.new(section_params)
    @section.save
    redirect_to :back
  end
  
  def remove_section
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to :back
  end
  
  def move_up
    @section = Section.find(params[:id])
    @seq = @section.sequence
    @sections = @section.atraining.sections
    @section2 = @sections.where(sequence: @seq-1).first()
    @section2.sequence = @seq
    @section2.save
    @section.sequence = @seq-1
    @section.save
    redirect_to :back
  end

  private

  def section_params
    params.require(:section).permit(:length, :time, :break, :sequence, :atraining_id)
  end

end
