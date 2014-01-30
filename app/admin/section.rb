ActiveAdmin.register Section do

  permit_params :id, :length, :time, :break, :sequence
  
  index do
    column :id
    column :length
    column :time
    column :break
    column :sequence
    column :athlete
    column :created_at
    
    default_actions
  end 
  
  filter :trainings
  filter :athlete
  filter :length
  filter :time
  filter :break
  filter :sequence
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
