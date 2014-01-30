class Gathlete < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :group
end
