# Program file (setup for integration testing when typing rake)
require_relative 'cal_class.rb'

#accepting arguments from command line, e.g. "ruby cal.rb month year"
first_argument = ARGV[0].to_i
second_argument = ARGV[1].to_i

if ARGV.length == 2
  if second_argument > 3000 || second_argument < 1800
    puts "Date is out-of-scope (years 1800-3000)."
  else
    Cal.display_month(first_argument, second_argument)
  end
else
  if first_argument > 3000 || first_argument < 1800
    puts "Date is out-of-scope (years 1800-3000)."
  else
    Cal.display_year(first_argument)
  end
end

# Example for Future Reference
# #using tick marks (tilde key) to shell commands
# puts "first argument: #{month}"
# puts "second argument: #{year}"
# puts "now shelling to Unix cal, Unix's result"
# puts `cal #{month} #{year}`
# puts  "***My zeller result:  " + Cal.zeller(month.to_i, year.to_i, :full).to_s