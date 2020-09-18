
class Ball
    def initialize(characterPosition,screen)
        @texture = "./Ressources/ball.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(characterPosition.x,characterPosition.y)
        @screen = screen
        @vector = Vector2.new(0,-5)
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end
    def move()
        if (@position.y >= @screen.y)
            @vector = Vector2.new(0,-5)
        elsif (@position.y <= 0)
            @vector = Vector2.new(0,5)
        end
        @position.add(@vector)
    end
end