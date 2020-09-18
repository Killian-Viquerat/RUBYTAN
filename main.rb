require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'
require_relative './Classes/ball'

class Game < Gosu::Window
    def initialize
      super 600, 800
      self.caption = "BBTAN"
      @screen = Vector2.new(self.width,self.height)
      @character = Character.new(@screen)
    end
    
    def update
      @character.move(Vector2.new(-5,0)) if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::KB_A)
      @character.move(Vector2.new(5,0))  if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::KB_D)
      @character.shoot if Gosu.button_down?(Gosu::KB_UP)
    end
    
    def draw
      @character.draw
      if(@character.balls.length != 0)
        @character.balls.each  do |ball|
          ball.draw
          ball.move
        end
      end
    end
end

Game.new.show