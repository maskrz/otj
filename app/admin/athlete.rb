ActiveAdmin.register Athlete do

  permit_params :id, :name, :surname, :birth, :email, :state, :privacy, :password, :trainer_id

  controller do
    def update
      if params[:athlete][:password].blank?
        params[:athlete].delete(:password)
      end
      super
    end
  end

  index do
    column :id
    column :name
    column :surname
    column :birth
    column :email
    column :state
    column :privacy
    column :trainer
    column :created_at
    
    default_actions
  end
  
  filter :name
  filter :surname
  filter :birth
  filter :email
  filter :state
  filter :privacy
  filter :trainer
  filter :created_at
# See permitted parameters documentation:
# https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#  permitted = [:permitted, :attributes]
#  permitted << :other if resource.something?
#  permitted
# end

end
