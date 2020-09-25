
class Character

    attr_accessor :balls
    attr_accessor :position
    attr_accessor :number
    attr_accessor :state
    attr_accessor :mouse

    def initialize(screen)
        @texture = "./Ressources/character.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(screen.x/2-@image.width/2,screen.y-@image.height)
        @screen = screen
        @number = 50
        @balls = Array.new()
        @bottom = @position.y
        @lastlaunch = Time.now
        @state = :freeze
        @mouse = Vector2.new(0,0)
    end

    
    def draw()
        @image.draw(@position.x,@position.y,0)
    end

    def shoot()
        if(@state == :shoot) 
            direction = @mouse
            if (@balls.length <= @number-1)
                if(Time.now - @lastlaunch > 0.05)
                    @balls.push(Ball.new(@position, @screen, @bottom, direction))
                    @lastlaunch = Time.now
                end
            end
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