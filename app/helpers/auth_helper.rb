module AuthHelper
  def user_sign_in(id, type)
    session[:user_id] = id
    session[:user_type] = type
  end

  def user_signed_in?
    !session[:user_id].nil?
  end

  def current_user 
    if(session[:user_type]== "T")
      Trainer.where(id: session[:user_id]).first
    else
      Athlete.where(id: session[:user_id]).first
    end
  end
  
  def user_type
    session[:user_type]
  end
  
  def user_sign_out
    session[:user_id] = nil
  end
  
end