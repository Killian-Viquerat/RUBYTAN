require 'gosu'
require_relative './Classes/character'
require_relative './Classes/vector2'
require_relative './Classes/ball'
require_relative './Classes/brick'
require_relative './Classes/world'
require_relative './Classes/powerup'

Polygon = Struct.new(:min, :max)

class Game < Gosu::Window

    def initialize
      super 600, 800
      self.caption = "RUBYTAN"
      @score = 0
      @cursor = Gosu::Image.new('./Ressources/cursor.png')
      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
      @screen = Vector2.new(self.width,self.height)
      @character = Character.new(@screen)
      @bottom = @character.position.y
      @world = World.new(@screen,@font,@bottom)
    end
    
    def update
      @character.shoot if @character.state == :shoot
      @character.balls.each_with_index  do |ball,index|
        if(@character.balls[index] != nil)
          if(ball.destruction)
            @character.move(ball.position) if ball == @character.balls.first
            @character.balls[index] = nil
          else
            if(ball.position.y != ball.vector.y)
              y = ((ball.position.y + ball.vector.y)/50).floor
              x = ((ball.position.x + ball.vector.x)/50).floor
              if(!@world.world[y][x].nil?  )
                if(@world.world[y][x].instance_of?(Brick))
                  brick = @world.world[y][x]
                  brick.number -= 1
                  @world.world[y][x] = nil if brick.destroy?
                  direction = "bottom"
                  ball.collision_change_direction(direction)
                elsif(@world.world[y][x].instance_of?(Powerup))
                  @character.number += 1
                  @world.world[y][x] = nil
                end
                puts "block at y:#{y} and x:#{x} touch"
              end
            end
            ball.move
          end
        end
      end
      if(@character.balls.last == nil && @character.balls.length >= @character.number)
        @character.state = :freeze
        @world.createbricksline()
        @character.balls = Array.new()
        @score += 1
      end
      @score = 0 if @world.lose
    end
    
    def draw
      if(@character.state == :freeze)
        Gosu.draw_line(@character.position.x,@bottom,Gosu::Color.rgba(255, 255, 255, 255),self.mouse_x, self.mouse_y,Gosu::Color.rgba(0, 0, 0, 255))
      end

      #Game UI
      @cursor.draw(self.mouse_x, self.mouse_y, 0)
      @font.draw_text("#{self.mouse_x},#{self.mouse_y}",self.mouse_x,self.mouse_y+20,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
      Gosu.draw_rect(0,@bottom,@screen.x,@screen.y-@bottom,Gosu::Color.rgba(0, 0, 153, 50))
      #Text for game
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

    def button_down(button)
      case button
      when Gosu::MsLeft
        if(@character.state == :freeze)
          @character.state = :shoot 
          @character.direction = Vector2.new(self.mouse_x, self.mouse_y)
        end
      end
    end

    def overlap(polygona,polygonb)
       d1x = polygonb.min.x - polygona.max.x;
       d1y = polygonb.min.y - polygona.max.y;
       d2x = polygona.min.x - polygonb.max.x;
       d2y = polygona.min.y - polygonb.max.y;

    if (d1x > 0.0 || d1y > 0.0)
        return false;
    end
    if (d2x > 0.0 || d2y > 0.0)
        return false;
    end
    return true;
    end

    def side?()

    end
end

Game.new.show