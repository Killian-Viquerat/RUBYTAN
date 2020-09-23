
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
            @vector = Vector2.new(0,5)
        end
        @vector.norme(@direction)
        @position.add(@vector)
    end

    def space()
        @image.height*2
    end

    def destruction()
        if (@position.y >= @bottom)
            return true 
        else
            return false
        end 
    end
end