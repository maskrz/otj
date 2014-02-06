ActiveAdmin.register Training do

  permit_params :id, :date, :comment, :trainer_id, :training_type

  index do
    column :id
    column :date
    column :comment
    column :training_type
    column :trainer
    column :created_at
    
    default_actions
  end
  
  filter :athletes
  filter :sections
  filter :trainer
  filter :date
  filter :training_type
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
