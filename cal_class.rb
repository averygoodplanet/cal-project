# example of a file defining a class which
# then can have unit testing ran on it

class Cal
  # def initialize
  # end
  def self.zeller(month, year, result_format=:full)
    # uses Zeller Congruence for Gregorian (modern) Calendar formula to return
    # the day-of-week a month-year starts on
    # see http://en.wikipedia.org/wiki/Zeller's_congruence
    # see formulas under "Implementation in software"

    #assign variables other than h, which is the result of the Zeller equation
    if month <= 2
      zeller_month = month + 12
      year = year - 1
    else
      zeller_month = month
    end

    first_day_of_month = 1
    day_of_month = first_day_of_month

    zeller_day_of_week_index = (day_of_month + (((zeller_month + 1) * 26)/ 10) + year + (year/4).floor + (6 * ((year/100).floor)) + (year/400).floor) % 7
    zeller_days_hash = { 0 => "Saturday", 1 => "Sunday", 2 => "Monday", 3 => "Tuesday", 4 => "Wednesday", 5 => "Thursday", 6 => "Friday"}

    # return results in format designated by result_format
    if result_format == :full
      zeller_days_hash[zeller_day_of_week_index]
    elsif result_format == :zeller_index
      zeller_day_of_week_index
    else
      raise Error, "Specify result_format in call to Cal.zeller"
    end
  end
end