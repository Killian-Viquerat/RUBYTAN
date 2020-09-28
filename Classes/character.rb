
class Character

    attr_accessor :balls
    attr_accessor :position
    attr_accessor :number
    attr_accessor :state
    attr_accessor :direction

    def initialize(screen)
        @texture = "./Ressources/character.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(screen.x/2-@image.width/2,screen.y-@image.height)
        @screen = screen
        @number = 1
        @balls = Array.new()
        @bottom = @position.y
        @lastlaunch = Time.now
        @state = :freeze
        @direction = Vector2.new(0,0)
    end

    
    def draw()
        @image.draw(@position.x,@position.y,0)
    end

    def shoot()
        if(@state == :shoot) 
            if (@balls.length <= @number-1)
                if(Time.now - @lastlaunch > 0.05)
                    @balls.push(Ball.new(@position, @screen, @bottom, @direction))
                    @lastlaunch = Time.now
                end
            end
        end
    end

    def move(vector2)
            @position = Vector2.new(vector2.x,vector2.y)
    end
end