class World

    def initialize(screen,character,font,bottom)
        @screen = screen
        @character = character
        @font = font
        @bottom = bottom
        @maxbircksline = @screen.x / 50
        @maxline= ((@screen.y-(@bottom-@screen.y)) / 50)
        @world = Array.new(@maxline) { Array.new(@maxbircksline) }
        for i in 0..1
            self.createbricksline()
        end
    end


    def createbricksline()
        line = Array.new()
        number = rand(1..@maxbircksline)
        for i in 0..number
          n = rand(0..@maxbircksline)
          line.insert(n,Brick.new(@font,n*50,0))
        end
        @world.unshift(line)
        self.modifybricksline
    end 

    def modifybricksline()
        for i in 1..@maxline
            if(!@world[i].empty?)
                @world[i].each do |brick|
                    if(brick != nil)
                        brick.position.y = i*50
                    end
                end
            end
        end
    end

    def draw
        Gosu.draw_rect(0,@bottom,@screen.x,1,Gosu::Color.rgba(240, 52, 52, 255))
        @world.each do |line|
            if(!line.empty?)
                line.each do |brick|
                    if(brick != nil)
                        brick.draw
                    end
                end
            end
        end
    end
end