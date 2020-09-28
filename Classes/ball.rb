
class Ball

    attr_accessor :position

    def initialize(characterPosition,screen,bottom,direction)
        @texture = "./Ressources/ball.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(characterPosition.x,bottom-@image.height)
        @screen = screen
        @vector =  Vector2.new(@position.x,@position.y)
        @bottom = bottom
        @direction = direction
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end
    def move()
        if (@position.y <= 0)
            @vector.y = -@vector.y
        elsif (@position.x <= 0)
            @vector.x = -@vector.x
        elsif (@position.x >= @screen.x)
            @vector.x = -@vector.x
        end

        if(@direction != nil)
        @vector.sub(@direction)
        @direction = nil
        end
        @position.add(@vector)
    end

    def destruction()
        if (@position.y >= @bottom)
            return true 
        else
            return false
        end 
    end
end