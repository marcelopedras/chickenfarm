require "statistics_eggs"
class Chicken < ActiveRecord::Base

  # Eggs contém métodos para calcular o número total de ovos criados bem como algumas estatísticas
  # Está localizado em lib/statistics_eggs.rb
  include Eggs

  attr_accessible :active, :chicken_type, :farm_id

  belongs_to :farm
  has_many :eggs, :dependent => :destroy

  validates_presence_of :active
  validates_length_of :chicken_type, :minimum=> 1, :maximum => 25
  validates_associated :eggs
  validates_presence_of :farm

  def active_days
    (Date.today - self.active.to_date).to_i
  end
end
