ActiveAdmin.register Trainer do

  permit_params :id, :name, :surname, :birth, :email, :state, :password

  controller do
    def update
      if params[:trainer][:password].blank?
        params[:trainer].delete(:password)
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
    column :created_at
    
    default_actions
  end
  
  filter :name
  filter :surname
  filter :birth
  filter :email
  filter :state
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
