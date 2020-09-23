class World

    def initialize(screen,character,font,bottom)
        @screen = screen
        @character = character
        @font = font
        @bottom = bottom
        @maxbircksline = @screen.x / 50
        @maxline= ((@screen.y+(@bottom-@screen.y)) / 50)
        @world = Array.new(@maxline){ Array.new(@maxbircksline)}
        @iteration = 1
        self.createbricksline()
    end


    def createbricksline()
        line = Array.new()
        number = rand(1..@maxbircksline)
        for i in 0..number
          n = rand(0..@maxbircksline)
          line.insert(n,Brick.new(@font,n*50,0,@iteration))
        end
        @world.unshift(line)
        if @world.length > 1
            self.modifybricksline
            self.addpowerup
        end
        @iteration += 1
    end 

    def modifybricksline()
        for i in 1..@world.length-1
            if(!@world[i].empty?)
                @world[i].each_with_index do |brick,index|
                    if(brick != nil)
                        brick.position.y = i*50
                    end
                end
            end
        end
    end

    def addpowerup()
        i = 0
        while i < 2 do
            line = rand(0..@iteration-1)
            emplacement = rand(0..@maxbircksline)
            if @world[line][emplacement] == nil
                @world[line][emplacement] = Powerup.new(emplacement*50,line*50)
                i+=1
            end
        end
    end

    def draw
        Gosu.draw_rect(0,@bottom,@screen.x,1,Gosu::Color.rgba(240, 52, 52, 255))
        @world.each do |line|
            if(!line.empty?)
                line.each do |item|
                    if(item != nil)
                        item.draw
                    end
                end
            end
        end
    end

    def lose
        if(@world.length > @maxline)
            @world = Array.new()
            @iteration = 1
            self.createbricksline()
            return true
        end
    end
end