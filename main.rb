require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'

class Game < Gosu::Window
    def initialize
      super 600, 800
      self.caption = "BBTAN"
      @character = Character.new(self.width,self.height)
    end
    
    def update
    end
    
    def draw
      @character.draw()
    end

    def button_down(id)
      case id
      when Gosu::KbLeft
        @character.move(Vector2.new(-10,0))
      when Gosu::KbRight
        @character.move(Vector2.new(10,0))
      end
    end
end

Game.new.show