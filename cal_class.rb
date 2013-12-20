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
  end

  def self.get_month_name(month_number)
    month_name_hash = { 1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
    month_name_hash[month_number]
  end

  # def self.number_of_days_in_month(month, year)
  #   # the days in a month are determined solely by the month, except for February which changes in leap year
  #   month_days_hash = { 1 => 31, 2 => "February", 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
  #   this_month_number_days = month_days_hash[month]

  #   #deal with February

  #   # return number of days in this month-year
  # end

# #may be unnecessary
#   def number_of_rows_in_month(first_day_of_month, number_of_days_in_month)
#   end

#   def create_month_header_string(month, year, month_xor_year_display)
#   end

#   def make_date_rows(month, year)
#   end

#   def display_one_month(month, year)
#   end

#   def display_year(year)
#   end
end