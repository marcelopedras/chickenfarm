require "statistics_eggs"
class Farm < ActiveRecord::Base

  # Eggs contém métodos para calcular o número total de ovos criados bem como algumas estatísticas
  # Está localizado em lib/statistics_eggs.rb

  include Eggs

  attr_accessible :active, :name

  has_many :chickens, :dependent => :destroy
  has_many :eggs, :through => :chickens

  validates_presence_of :name
  validates_presence_of :active
  validates_uniqueness_of :name
  validates_length_of :name, :minimum => 1, :maximum => 30
  validates_associated :chickens

  #TODO Marcelo - Testar métodos

  def amount_of_chickens
    self.chickens.count
  end

  def active_days
    (Date.today - self.active.to_date).to_i
  end
end
