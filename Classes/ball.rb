
class Ball
    def initialize(characterPosition,screen,bottom)
        @texture = "./Ressources/ball.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(characterPosition.x,bottom-@image.height)
        @screen = screen
        @vector = Vector2.new(0,-5)
        @bottom = bottom
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end
    def move()
        if (@position.y <= 0)
            @vector = Vector2.new(0,5)
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