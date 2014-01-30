class RemoteController < ActionController::Base
  
  def get_trainings
    @g_id = params[:groups]

    # we get the data for selectbox 2
    @trainings = Training.where(group_id: @g_id).order('date DESC').first(5)

    # render an array in JSON containing arrays like:
    # [[:id1, :name1], [:id2, :name2]]
    render :json => @trainings.map{|c| [c.id, c.date]} 
  end
  
end
