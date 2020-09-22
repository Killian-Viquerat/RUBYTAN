require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'
require_relative './Classes/ball'
require_relative './Classes/brick'
require_relative './Classes/world'

class Game < Gosu::Window
    def initialize
      super 600, 800
      self.caption = "RUBYTAN"
      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
      @screen = Vector2.new(self.width,self.height)
      @character = Character.new(@screen)
      @bottom = @character.position.y
      @world = World.new(@screen,@character,@font,@bottom)
    end
    
    def update
      @character.move(Vector2.new(-5,0)) if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::KB_A)
      @character.move(Vector2.new(5,0))  if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::KB_D)
      @character.shoot if Gosu.button_down?(Gosu::KB_UP)
      @character.balls.each_with_index  do |ball,index|
        if(@character.balls[index] != nil)
          if(ball.destruction)
            @character.balls[index] = nil
          else
            ball.move
          end
        end
      end
    end
    
    def draw
      @character.draw
      @world.draw
      @character.balls.each_with_index  do |ball,index|
        if(@character.balls[index] != nil)
          ball.draw
        end
      end
    end
end

Game.new.show