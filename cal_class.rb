# example of a file defining a class which
# then can have unit testing ran on it

class Cal
  # def initialize
  # end
  def self.zeller(month, year, result_format=:full)
    # uses Zeller Congruence for Gregorian (modern) Calendar formula to return
    # the day-of-week a month-year starts on
    # see http://en.wikipedia.org/wiki/Zeller's_congruence

    #assign variables other than h, which is the result of the Zeller equation
    if month <= 2
      zeller_month = month + 12
      puts "in month <= 2, zeller_month= " + zeller_month.to_s
    else
      zeller_month = month
    end

    first_day_of_month = 1
    day_of_month = first_day_of_month
    puts "day_of_month= " + day_of_month.to_s
    year_of_century = year % 100
    puts "year_of_century = " + year_of_century.to_s
    century = year / 100
    puts "century= " + century.to_s


    zeller_day_of_week_index = (day_of_month + ((13*(zeller_month + 1))/5).floor + year_of_century + (year_of_century/4).floor + (century/4).floor - (2 * century) ) % 7
    zeller_day_of_week_index - 2

    # try_regular_month = (day_of_month + ((13*(month + 1))/5).floor + year_of_century + (year_of_century/4).floor + (century/4).floor - (2 * century) ) % 7
    # zmonth_plus_one = zeller_month + 1
    # try_parens = (day_of_month + ((13*zmonth_plus_one) / 5 ) + year_of_century + (year_of_century/4).floor + ((100 * century)/4).floor - (2 * (century *100) )) % 7
    # try_parens - 2
    # zeller_hash = { }
    #return day-of-week the month starts on
  end
end