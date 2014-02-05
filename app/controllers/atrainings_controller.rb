class AtrainingsController < ApplicationController
  
  def add_comment
    @atraining = Atraining.find(params[:atraining][:id])
    @atraining.comment = params[:atraining][:comment]
    @atraining.save
    redirect_to :back
  end
  
end
