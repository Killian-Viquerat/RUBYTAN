class World

    def initialize(screen,character,font,bottom)
        @screen = screen
        @character = character
        @font = font
        @line = Array.new
        @bottom = bottom
        self.bricksline
    end

    def bricksline
        maxnumber = @screen.x / 50
        number = rand(1..maxnumber)
        for i in 0..number
          n = rand(0..maxnumber)
          @line.insert(n,Brick.new(@font,n*50,0))
        end
    end 

    def draw
        Gosu.draw_rect(0,@bottom,@screen.x,1,Gosu::Color.rgba(240, 52, 52, 255))
        @line.each do |brick|
            if( brick != nil)
            brick.draw
            end
          end
    end
end