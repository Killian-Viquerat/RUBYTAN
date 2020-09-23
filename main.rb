require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'
require_relative './Classes/ball'
require_relative './Classes/brick'
require_relative './Classes/world'
require_relative './Classes/powerup'

class Game < Gosu::Window
    def initialize
      super 600, 800
      self.caption = "RUBYTAN"
      @cursor = Gosu::Image.new(self, './Ressources/cursor.png')
      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
      @screen = Vector2.new(self.width,self.height)
      @character = Character.new(@screen)
      @bottom = @character.position.y
      @score = 0
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
      if(@character.balls.last == nil && @character.balls.length >= @character.number)
        @world.createbricksline()
        @character.balls = Array.new()
        @score += 1
      end
      @score = 0 if @world.lose
    end
    
    def draw
      @cursor.draw(self.mouse_x, self.mouse_y, 0)
      @font.draw_text(Gosu.fps,self.width-30,self.height-30,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
      @font.draw_text("Score: #{@score}",0+30,self.height-30,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
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