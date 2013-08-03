module Eggs

  #TODO Marcelo - Testar métodos
  def amount_of_eggs
    self.eggs.sum(:quantity)
  end

  def amount_of_eggs_of_the_day
    self.amount_of_eggs_between_dates(Date.today, Date.tomorrow)
  end

  def amount_of_eggs_of_the_week
    self.amount_of_eggs_between_dates(Date.today.beginning_of_week(:sunday), Date.today.end_of_week)
  end

  def amount_of_eggs_of_the_month
    self.amount_of_eggs_between_dates(Date.today.beginning_of_month, Date.today.end_of_month+1.day)
  end

  def calculates_average_eggs_per_day
    self.calculates_average_eggs_per(self.eggs.first.created_at.to_date, Date.today+1, 1.day) unless self.eggs.empty?
  end

  def calculates_average_eggs_per_week
    self.calculates_average_eggs_per(self.eggs.first.created_at.to_date, Date.today+1, 1.week) unless self.eggs.empty?
  end

  def calculates_average_eggs_per_month
    self.calculates_average_eggs_per(self.eggs.first.created_at.to_date, Date.today+1, 1.month) unless self.eggs.empty?
  end

  # Este método cálcula quantos ovos foram criados entre duas datas. Este intervalo inclui a data inicial mas não a final.
  # Dessa forma, é necessário utilizar um dia depois para conseguir um intervalo fechado.

  def amount_of_eggs_between_dates(start_date, end_date)
    self.eggs.sum(:quantity, conditions: {created_at: (start_date)..(end_date)})
  end

  # Este método cálcula a média de ovos criada entre duas datas considerando um intervalo de tempo (1.day, 2.days, 1.week, 1.month...).
  # Este intervalo inclui a data inicial mas não a final.
  # Dessa forma, é necessário utilizar um dia depois para conseguir um intervalo fechado.
  # Caso não existam ovos no período, nil é retornado

  def calculates_average_eggs_per(start_date, end_date, interval)
    data = Array.new

    while start_date <= end_date
      data << self.amount_of_eggs_between_dates(start_date, start_date + interval)
      start_date+=interval
    end
    data.sum/data.size.to_f unless data.empty?
  end
end