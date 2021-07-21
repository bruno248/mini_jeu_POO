# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
#require 'bundler'
#Bundler.require
require 'pry'

#require_relative 'lib/game'
require_relative 'lib/player'

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------

"

puts "Entre ton nom, humain : "
prenom = gets.chomp
user = HumanPlayer.new(prenom)

player1 = Player.new("jose")
#@@ennemies_all.push(player1)
player2 = Player.new("josiane")
#@@ennemies_all.push(player2)

def etat(user)
  puts "voici l'état de #{user.name}, il lui reste #{user.life_points} points de vie " 
  puts ""
end

def etat(player)
  if player.life_points >0
  puts "voici l'état de #{player.name}, il lui reste #{player.life_points} points de vie " 
  puts ""
  else
    puts "#{player.name} est mort " 
    puts ""
  end
end

def combat(user, player1, player2)
  while user.life_points >0 && (player1.life_points >0 || player2.life_points >0)
    puts "quelle action veux tu effectuer"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    
    puts "attaquer un joueur en vue :"
    puts "0 - #{player1.show_state}"
    puts "1 - #{player2.show_state}"

    input = gets.chomp

    if input == "0"
      user.attack(player1)
    elsif input == "1" 
      user.attack(player2)
    elsif input == "a"
      user.search_weapon
    elsif input == "s"
      user.search_health_pack
    end

    puts "au tour des ennemis d'attaquer"
      Player.all.each do |player|
        if player.life_points >0 
          player.attack(user)
        end
    end

    puts ""
    etat(user)
    etat(player1)
    etat(player2)
    

  end

    if user.life_points >0
      puts "BRAVO, tu as survécu"
    else
      puts "LOOSER"
    end

end

binding.pry
