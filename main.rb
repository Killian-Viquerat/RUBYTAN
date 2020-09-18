require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'
require_relative './Classes/ball'
require_relative './Classes/brick'

class Game < Gosu::Window
    def initialize
      super 600, 800
      self.caption = "BBTAN"
      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
      @screen = Vector2.new(self.width,self.height)
      @character = Character.new(@screen)
      @line = Array.new
      self.bricksline
    end
    
    def update
      @character.move(Vector2.new(-5,0)) if Gosu.button_down?(Gosu::KB_LEFT) || Gosu.button_down?(Gosu::KB_A)
      @character.move(Vector2.new(5,0))  if Gosu.button_down?(Gosu::KB_RIGHT) || Gosu.button_down?(Gosu::KB_D)
      @character.shoot if Gosu.button_down?(Gosu::KB_UP)
    end
    
    def draw
      @character.draw
      @line.each do |brick|
        if( brick != nil)
        brick.draw
        end
      end
      if(@character.balls.length != 0)
        @character.balls.each  do |ball|
          ball.draw
          ball.move
        end
      end
    end

    def bricksline
        maxnumber = @screen.x / 50
        number = rand(1..maxnumber)
        for i in 0..number
          n = rand(0..maxnumber)
          @line.insert(n,Brick.new(@font,n*50,0))
        end
    end 
end

Game.new.show