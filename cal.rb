# Program file (setup for integration testing when typing rake)
require_relative 'cal_class.rb'

#accepting arguments from command line, e.g. "ruby cal.rb month year"
month = ARGV[0].to_i
year = ARGV[1].to_i

# puts "#{month} #{year}"

if month
  Cal.display_month(month, year)
else
  Cal.display_year(year)
end

# Example for Future Reference
# #using tick marks (tilde key) to shell commands
# puts "first argument: #{month}"
# puts "second argument: #{year}"
# puts "now shelling to Unix cal, Unix's result"
# puts `cal #{month} #{year}`
# puts  "***My zeller result:  " + Cal.zeller(month.to_i, year.to_i, :full).to_s