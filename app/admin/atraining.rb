ActiveAdmin.register Atraining do

  permit_params :id, :comment, :athlete_id, :training_id
  
  index do
    column :id
    column :athlete
    column :training
    column :comment
    column :created_at
    
    default_actions
  end
  
  filter :trainings
  filter :athletes
  filter :sections
  filter :comment
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
