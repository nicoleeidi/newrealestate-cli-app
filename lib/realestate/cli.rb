#CLI Controller
#require_relative "./realestate.rb" ??
class RealEstate::CLI
  app= Realestate.new
  def call
    puts "Hello! Welcome to the RealEstate App!"
    puts "Enter the name of the state for the Average Listing Price per county."
    input1= gets.strip #these two lines combined?
    state= input1.capitalize!

    puts "Would you like to see the listing prices for all counties, or for one county? Type 'all' or 'one'"
    input2= gets.strip
    if input2== "all"
      app.all_counties(state)

    elsif input2== "one"
      input3= gets.strip #these two lines can be comibened ?
      county= input3.capitalize!
      app.by_county(state,county)
      county= input2.capitalize!
    end

    while input != "exit"
      input= gets.strip
      input.capitalize!
      # case input
      # when "Maryland"
      #   ...
      # when ""
      #   ...
      # end
  end
end
