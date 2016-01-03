class Product < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :catalog
  attr_accessible :description, :name
end
