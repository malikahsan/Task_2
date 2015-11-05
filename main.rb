require "./player.rb"

class Main
  @players = Array.new
  
  def self.display_default
    puts "==========================="
    puts "Welcome to the Battle Arena"
    puts "---------------------------"
    puts "Description"
    puts "1. Type \"new\" to create a character \n2. Type \"start\" to begin the fight"
    puts "------------------------------------"
    puts "\n"
    puts "Type:" 
    opti = gets.chomp.to_str
    
    if opti.eql? "new"
      puts "\n"
      Main.opti_new
    elsif opti.eql? "start"
      puts "\n"
      Main.opti_start
    else
      puts "Sorry, you wrong type options!"
      system(exit)
   end
  end
      
   def self.opti_new
     @n = @players.length
     
     puts "Total Players: #{@n}"
     if @n < 3
       puts "Put Player Name: " 
       @name=gets.chomp
       puts "\n"
     else
       puts "sorry, you cant put the player name again because maximum 3 players!! \n"
     end

     puts "Current Player: "
        
        if @n < 3
          @players.push(Player.new("#{@name}"))
        end 
        
        @players.each do |count_player|
          puts count_player.name
        end
        
      puts "Max Player 2 or 3"
      puts "-----------------"
      puts "\n"
      
      Main.display_default
    end
    
    def self.opti_start
      if @players.length == 0
        puts "Sorry, cannot play the game."
      else
	repeat = 0
        puts "#=============================#"
        puts "# Welcome to the Battle Arena #"
        puts "#-----------------------------#"
	while repeat < 5
          puts "Battle Start"
	  if @players.length > 1
	     puts "Who will attack: "
             @player_one = gets.chomp.to_str
             puts "Who will attacked: "
             @player_two = gets.chomp.to_str
	     puts "Description"
	     Main.attack
	     puts "=" * 10
	     Main.attacked
	     puts "=" * 10
	  end
	repeat += 1
        end
     end
   end

   def self.attack
   check = 0
   while check < @players.length
     if @players[check].name.eql? @player_one
	puts "Name Player 1: #{@players[check].name}"
	puts "Blood : #{@players[check].blood}"
	puts "Manna : #{@players[check].manna -= 20}"
     end

     if @players[check].manna == 0 || @players[check].blood == 0
	Main.game_over
     end
     check += 1
    end
   end

   def self.attacked
   check = 0
   while check < @players.length
     if @players[check].name.eql? @player_two
	puts "Name Player 2 : #{@players[check].name}"
	puts "Blood : #{@players[check].blood -= 20}"
	puts "Manna : #{@players[check].manna}"
     end

     if @players[check].manna == 0 || @players[check].blood == 0
	Main.game_over
     end
     check += 1
    end
   end

   def self.game_over
     puts "Game Over!"
     Main.display_default
   end
end

Main.display_default



