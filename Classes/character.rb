
class Character

    attr_accessor :balls
    attr_accessor :position
    attr_accessor :number

    def initialize(screen)
        @texture = "./Ressources/character.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(screen.x/2-@image.width/2,screen.y-@image.height)
        @screen = screen
        @number = 1
        @balls = Array.new()
        @bottom = @position.y
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end

    def shoot()
        if (@balls.length <= @number)
            @balls.push(Ball.new(@position, @screen, @bottom))
        end
    end

    def move(vector2)
        if (@position.x > @screen.x)
            @position = Vector2.new(0,@screen.y-@image.height)
        elsif (@position.x < 0)
            @position = Vector2.new(@screen.x-@image.width/2,@screen.y-@image.height)
        else 
            @position.add(vector2)
        end
    end

end