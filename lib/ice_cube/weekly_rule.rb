module IceCube

  class WeeklyRule < DailyRule
    
    # Determine whether or not this rule occurs on a given date.
    # Weekly rules occurs if we're in one of the interval weeks,
    # and we're in a valid day of the week.
    def occurs_on?(date, start_date)
      #by default, the days will be the start_date's day of the week
      unless @days
        return false unless date.wday == start_date.wday
      end
      #make sure we're in the right interval
      week_of_year = Date.civil(date.year, date.month, date.day).cweek
      return false unless week_of_year % @interval == 0
      #validate 
      validate(date, start_date)
    end
    
    def to_ical 
      'FREQ=WEEKLY' << to_ical_base
    end
    
    def to_s
      to_ical
    end
    
  end

end
