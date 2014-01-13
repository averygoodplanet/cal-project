class Cal

  def self.zeller(month, year)
    # uses Zeller Congruence for Gregorian (modern) Calendar formula to return
    # the day-of-week a month-year starts on
    # see http://en.wikipedia.org/wiki/Zeller's_congruence,
    #formulas under "Implementation in software"

    # in Zeller's Congruence formula months are numbered:
    #(3 = March, 4 = April, 5 = May, ..., 14 = February)
    if month <= 2
      months_in_a_year = 12
      zeller_month = month + months_in_a_year
      year = year - 1
    else
      zeller_month = month
    end

    zeller_day_of_week_index = (1 + (((zeller_month + 1) * 26)/ 10) + year +
                                                     (year/4).floor + (6 * ((year/100).floor)) +
                                                     (year/400).floor) % 7
  end

  def self.get_month_strings_no_headers(month_number, year_number)
    days_in_this_month = Cal.number_of_days_in_month(month_number,
                                         year_number)
    first_day_of_month = Cal.zeller(month_number, year_number)
    first_day_of_month = 7 if first_day_of_month == 0
    last_number_in_first_row = 7 - (first_day_of_month - 1)

    week_rows = []
    week_rows[0] = Cal.make_month_first_row(first_day_of_month, last_number_in_first_row)
    week_rows, last_number_middle_rows = Cal.add_month_middle_rows(week_rows,
      last_number_in_first_row, days_in_this_month)
    week_rows = Cal.add_month_partial_last_row(week_rows,last_number_middle_rows,
     days_in_this_month) if last_number_middle_rows < days_in_this_month
    week_rows
  end

  def self.get_month_strings_array_without_year_header(month_number, year_number)
    week_rows = Cal.get_month_strings_no_headers(month_number, year_number)
    week_rows.unshift( Cal.get_month_name(month_number).center(20),
              "Su Mo Tu We Th Fr Sa")
  end

  def self.display_month(month_number, year_number)
    week_rows = Cal.get_month_strings_no_headers(month_number, year_number)
    puts (Cal.get_month_name(month_number) +  " " + year_number.to_s).center(20),
              "Su Mo Tu We Th Fr Sa", week_rows, "\n"
  end

  def self.display_year(year)
    puts "                             #{year}"

    # handles edge case where we don't place a spacer row after quarter year if
    # contains a month with six week rows
    six_weeks_row = false

    for quarter_of_year in [0, 3, 6, 9]
      q = quarter_of_year
      #for each trimester
      puts "\n" if !six_weeks_row

      six_weeks_row = false
      month_strings = []
      left_month, center_month, right_month = q, q + 1, q + 2

        for i in left_month..right_month
          month_strings[i] = self.get_month_strings_array_without_year_header(i+1, year)
        end

      for row in 0..5
        self.concatenate_and_puts(row, month_strings, left_month,
                                                      center_month, right_month)
      end

      # Handle edge cases where a month has only four (4) or has six (6) week rows
      for row in 6..7
        if !month_strings[left_month][row].nil? or
          !month_strings[center_month][row].nil? or
          !month_strings[right_month][row].nil?
          six_weeks_row = true if row == 7
          for q in left_month..right_month
            month_strings[q][row] = "".ljust(20, " ") if month_strings[q][row].nil?
          end
          self.concatenate_and_puts(row, month_strings, left_month, center_month,
            right_month)
        end
      end
    end
    puts "\n"
  end

  def self.concatenate_and_puts(row, month_strings, left_month, center_month,
    right_month)
    concat_strings = []
    concat_strings[row] = month_strings[left_month][row].ljust(20, " ").chomp +
                          "  " +month_strings[center_month][row].ljust(20, " ").chomp +
                          "  " +month_strings[right_month][row].ljust(20, " ").sub(/\s+\Z/, "")
    puts concat_strings[row]
  end

  def self.get_month_name(month_number)
    month_name_hash = { 1 => "January", 2 => "February", 3 => "March",
          4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August",
          9 => "September", 10 => "October", 11 => "November", 12 => "December"}
    month_name_hash[month_number]
  end

  def self.leap_year?(year)
    mult_4 = ((year % 4) == 0)
    century = ((year % 100) == 0)
    mult_400 = ((year % 400) == 0)

    (mult_4 and !century) or (mult_4 and century and mult_400) ? true : false
  end

  def self.number_of_days_in_month(month, year)
    month_days_hash = { 1 => 31, 2 => "February", 3 => 31, 4 => 30, 5 => 31,
                    6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}

    if month_days_hash[month] != "February"
      num_days = month_days_hash[month]
    else
      Cal.leap_year?(year) ? num_days = 29 : num_days = 28
    end
  end

  def self.make_month_first_row(first_day_of_month, last_number_in_first_row)
    week_rows = []
    week_rows[0] = (" " * 3) * (first_day_of_month - 1)

    for i in 1..last_number_in_first_row
      week_rows[0] += " #{i} "
    end

    week_rows[0] = week_rows[0].chop
  end

  def Cal.add_month_middle_rows(week_rows,
        last_number_in_first_row, days_in_this_month)
  current_week_row = 1
  first_in_row = last_number_in_first_row + 1
    while (first_in_row + 6) <= days_in_this_month do
      week_string = ""
      for i in first_in_row..(first_in_row + 6)
        week_string += (i.to_s).rjust(2, " ") + " "
        last_number_middle_rows = i
      end
      week_string = week_string.chop
      week_rows[current_week_row] = week_string
      current_week_row += 1
      first_in_row += 7
    end
    return week_rows, last_number_middle_rows
  end

  def self.add_month_partial_last_row(week_rows,
        last_number_middle_rows, days_in_this_month)
        first_in_row = last_number_middle_rows + 1
        last_week_array = []
        for i in first_in_row..days_in_this_month
          last_week_array.push(i)
        end
        week_rows.push(last_week_array.join(" "))
  end
end