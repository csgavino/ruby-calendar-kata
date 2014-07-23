require 'date'

class Calendar
  def initialize year, month, start_week_on = 0
    @date = Date.new year, month
    @start_week_on = start_week_on || 0
  end

  def to_s
    [ title, header, days, ].join("\n") + "\n"
  end

  private
  SPACE = ' '
  OFFSET = 9

  def title
    SPACE * OFFSET + month + SPACE + "#{date.cwyear}"
  end

  def month
    date.strftime '%B'
  end

  DAYS_OF_WEEK = %w(Sun Mon Tue Wed Thu Fri Sat)

  def header
    days_days = DAYS_OF_WEEK + DAYS_OF_WEEK
    SPACE + days_days.slice(start_week_on, 7).join(SPACE)
  end

  def days
    offset = (start_day - start_week_on) % 7
    d = days_this_month
    d.unshift *([0] * offset)
    d.each_slice(7).map do |week|
      week.map do |day|
        '%4.d' % day
      end.join
    end
  end

  def start_day
    @date.cwday
  end

  def days_this_month
    [*1..end_day]
  end

  def end_day
    Date.new(date.year, date.month, -1).day
  end

  attr_reader :date, :start_week_on
end

