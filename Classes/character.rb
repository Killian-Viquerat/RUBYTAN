
class Character

    attr_accessor :balls

    def initialize(screen)
        @texture = "./Ressources/character.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(screen.x/2-@image.width/2,screen.y-@image.height)
        @balls = []
        @screen = screen
        @number = 150
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end

    def shoot()
        if (@balls.length <= @number)
        @balls.push(Ball.new(@position, @screen))
        end
    end

    def move(vector2)
        @position.add(vector2)
    end

end