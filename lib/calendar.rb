require 'date'

class Calendar
  def initialize year, month, start_week_on = 0
    @date = Date.new year, month
    @start_week_on = start_week_on || 0
  end

  def to_s
    [ title,
      header,
      days ].join("\n") + "\n"
  end

  private
  SPACE = ' '
  DAYS_OF_WEEK = %w(Sun Mon Tue Wed Thu Fri Sat)

  def title
    SPACE * 9 + month + SPACE + year
  end

  def month
    date.strftime '%B'
  end

  def year
    "#{date.cwyear}"
  end

  def header
    days_days = DAYS_OF_WEEK + DAYS_OF_WEEK
    SPACE + days_days.slice(start_week_on, 7).join(SPACE)
  end

  def days
    d = days_this_month
    d.unshift *start_day_offset
    d.each_slice(7).map do |week|
      week.map do |day|
        '%4.d' % day
      end.join
    end
  end

  def start_day_offset
    [0] * offset
  end

  def offset
    (start_calendar_day - start_week_on) % 7
  end

  def start_calendar_day
    @date.cwday
  end

  def days_this_month
    [*1..end_of_month]
  end

  def end_of_month
    Date.new(date.year, date.month, -1).day
  end

  attr_reader :date, :start_week_on
end

