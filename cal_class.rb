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

    # test that year is within scope (1800 - 3000)
    if year > 3000 || year < 1800
      return "Date is out-of-scope (years 1800-3000)."
    end

    #assign variables to be used within the Zeller equation
    first_day_of_month = 1
    day_of_month = first_day_of_month

    if month <= 2
      zeller_month = month + 12
      year = year - 1
    else
      zeller_month = month
    end

    zeller_day_of_week_index = (day_of_month + (((zeller_month + 1) * 26)/ 10) + year + (year/4).floor + (6 * ((year/100).floor)) + (year/400).floor) % 7

    # return results in format designated by result_format
    if result_format == :full
      zeller_days_hash = { 0 => "Saturday", 1 => "Sunday", 2 => "Monday", 3 => "Tuesday", 4 => "Wednesday", 5 => "Thursday", 6 => "Friday"}
      zeller_days_hash[zeller_day_of_week_index]
    elsif result_format == :zeller_index
      zeller_day_of_week_index
    else
      raise Error, "Specify result_format in call to Cal.zeller"
    end
  end

  def self.display_month(month_number, year_number)
    month_name = Cal.get_month_name(month_number)
    month_space_year = month_name + " " + year_number.to_s

    leading_whitespace = ""
    leading_spaces_by_month = { 1 => 4, 2 => 3, 3 => 5, 4 => 5, 5 => 6,  6 => 5, 7 => 5, 8 => 4, 9 => 3, 10 => 4, 11 => 3, 12 => 3}
    number_of_leading_spaces = leading_spaces_by_month[month_number]
    for i in 1..number_of_leading_spaces
      leading_whitespace += " "
    end

    month_header_string = leading_whitespace + month_space_year
    puts month_header_string

    weekday_names_row = "Su Mo Tu We Th Fr Sa"
    puts weekday_names_row

    week_rows = []
    week_rows[0] = " 1  2  3  4  5  6  7"
    week_rows[1] = " 8  9 10 11 12 13 14"
    week_rows[2] = "15 16 17 18 19 20 21"
    week_rows[3] = "22 23 24 25 26 27 28"
    week_rows[4] = "29 30 31"

    for i in 0..week_rows.length
      puts week_rows[i]
    end
  end

  def self.get_month_name(month_number)
    month_name_hash = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
    month_name_hash[month_number]
  end

  def self.leap_year?(year)
    if year % 4 == 0
      if year % 100 == 0
        if year % 400 == 0
          # century years which are multiples of 400
          # e.g. 1600, 2000, are leap years
          return true
        else
          # century years which aren't multiples of 400
          # aren't leap years (e.g. 1700, 1800, 1900)
          return false
        end
      else
        # a year that is divisible by 4 and isn't a century year
        # is a leap year
        return true
      end
    else
      # a year that isn't a multiple of 4 isn't a leap year
      return false
    end
  end

  def self.number_of_days_in_month(month, year)
    # the days in a month are determined solely by the month, except for February which changes in leap year
    month_days_hash = { 1 => 31, 2 => "February", 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
    if month_days_hash[month] != "February"
      this_month_number_days = month_days_hash[month]
    else
      # if February determine whether leap year (e.g. whether 28 or 29 days)
      if Cal.leap_year?(year)
        this_month_number_days = 29
      else
        this_month_number_days = 28
      end
    end
  end

# #may be unnecessary
#   def number_of_rows_in_month(first_day_of_month, number_of_days_in_month)
#   end

#   def create_month_header_string(month, year, month_xor_year_display)
#   end

#   def make_date_rows(month, year)
#   end

#   def display_year(year)
#   end
end