
require 'pry'
class CLI

    def greeting
      puts "Hello! Welcome to the RealEstate App!"
      call
    end
    def restart_or_exit
    puts "Enter 'restart' to go back to main menu, or enter 'exit'" #if exit, goes to bottom
    input5= gets.strip
    if input5== 'restart'
      call
    elsif input5== 'exit'
    else
      restart_or_exit
    end
    end

    def call
    puts "Enter the name of the state for the Average Listing Price per county."
    state= gets.strip.capitalize
    if state.include?(" ")
      state= state.gsub(" ","_")
    end

    puts "Would you like to see the listing prices for all counties, or for one county? Type 'all' or 'one'"
    input2= gets.strip


      s= Scraper.new(state)
      stateinstance= s.scrape
      if input2== "all"
      stateinstance.counties.each do |county|#match the state the person searched.
      puts "#{county.name}: #{county.price}"
        end
    restart_or_exit
      # puts "Enter 'restart' to go back to main menu, or enter 'exit'" #if exit, goes to bottom
      # input5= gets.strip
      # if input5== 'restart' || input5 != 'exit'
      #   call
      # elsif input5== 'exit'
      #
      # end
    elsif input2== "one"
      puts "Enter the county name:"
      county= gets.strip.capitalize

      countyinstnace=stateinstance.counties.find{|c| c.name= county}
      puts countyinstnace.price

      restart_or_exit
      # puts "Please enter 'restart' to make another search, or enter 'exit'"
      # input4= gets.strip
      # if input4== 'restart'  #|| input4 != 'exit'
      #   call
      # elsif input4== 'exit'
      # else
      #
      #   end
    else
      call

end
end
end
