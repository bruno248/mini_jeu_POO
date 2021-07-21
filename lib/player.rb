class Player

  attr_accessor :name, :life_points
  @@ennemies_all = []
  def initialize(name)
    @name = name.to_s
    @life_points = 10

    @@ennemies_all.push(self)
    p @@ennemies_all
  end

  def self.all
    return @@ennemies_all
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end

  def attack(player_attacked)
    damage = compute_damage
    puts "#{@name} attaque le joueur #{player_attacked.name} et lui inflige #{damage} 
    points de dégats"
    puts ""
    player_attacked.life_points = player_attacked.life_points - damage
    if player_attacked.life_points <=0
      puts "#{player_attacked.name} a été tué, vive #{@name} !! "
    end
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @name = name.to_s
    @life_points = 100
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level} "
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon = rand(1..6)
    puts "tu as trouvé une arme de niveau #{weapon}"
    if weapon > @weapon_level
      puts "youhou, elle est meilleure que ton arme actuelle, tu la prends."
      @weapon_level = weapon
    else
      puts "tu gardes ton arme actuelle, bien plus puissante"
    end   
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1  
    puts "tu n'as rien trouvé" 
    elsif health_pack >=2 || health_pack <=5
      puts "bravo, tu as gagné 50 points de vie"
      if @life_points <=50
        @life_points = @life_points + 50
      else
        @life_points = 100
      end
    elsif health_pack == 6
      puts "bravo, tu as gagné 80 points de vie"
      if @life_points <=20
        @life_points = @life_points + 80
      else
        @life_points = 100
      end
    end   
    puts "tu as #{life_points}"
  end

end
