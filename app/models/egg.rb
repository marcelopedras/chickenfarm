class Egg < ActiveRecord::Base
  attr_accessible :quantity, :chicken_id

  belongs_to :chicken

  validates_numericality_of :quantity, :greater_than_or_equal_to => 1
  validates_presence_of :chicken
end
