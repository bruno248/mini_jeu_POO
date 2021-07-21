# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
#require 'bundler'
#Bundler.require
require 'pry'


#require_relative 'lib/game'
require_relative 'lib/player'

def presentation(player1, player2)
  puts "a ma droite, le grand, le puissant #{player1.name}" 
  puts "a ma gauche, le malin, l'agile #{player2.name}"
end

def etat(player)
  puts "voici l'état de #{player.name}, il lui reste #{player.life_points} points de vie " 
  puts ""

end

def combat(player1, player2)
presentation(player1, player2)
  puts ""
  puts "A l'attaque"
  while player1.life_points >0 && player2.life_points >0
  player1.attack(player2)
    if player2.life_points <=0 || player1.life_points <=0
      break
    else
    puts "#{player2.name} n'est pas mort, il contre-attaque"
    player2.attack(player1)
    puts""
    etat(player1)
    etat(player2)
    puts ""
    end
  end
end

binding.pry

