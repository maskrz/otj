class AuthController < ApplicationController
  require 'digest/md5'
  
  def login    
    trainer = Trainer.where(email: params[:login][:email]).first
    if trainer
      if trainer.authenticate(params[:login][:password])
        user_sign_in(trainer.id, "T")
        redirect_to root_path, :flash => { :success => "Zalogowalem trenera" }
      else 
        redirect_to root_path, :flash => { :error => "Niepoprawne dane!" }
      end
    else
      athlete = Athlete.where(email: params[:login][:email]).first
      if  athlete
        if athlete.authenticate(params[:login][:password])
          user_sign_in(athlete.id, "A")
          redirect_to root_path, :flash => { :success => "Zalogowalem zawodnika" }
        else 
          redirect_to root_path, :flash => { :error => "Niepoprawne dane!" }
        end
      else
        redirect_to root_path, :flash => { :error => "Niepoprawne dane!" }
      end      
    end    
  end
  
  def sign_out 
    user_sign_out
    redirect_to root_path, :flash => { :notice => "Wylogowany" }
  end
  
end