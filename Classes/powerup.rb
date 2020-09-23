class Powerup

    attr_accessor :position

    def initialize(x,y)
        @offset = 15
        @heigth = 20
        @width = 2
        @position = Vector2.new(x,y)
        @centercontent = @offset + @heigth/2
    end


    def draw
        #cube
        Gosu.draw_rect(@position.x+@offset,@position.y+@offset,@heigth,@width,Gosu::Color.rgba(218, 242, 52, 255))
        Gosu.draw_rect(@position.x+@offset,@position.y+@heigth+@offset,@heigth,@width,Gosu::Color.rgba(218, 242, 52, 255))
        Gosu.draw_rect(@position.x+@offset,@position.y+@offset,@width,@heigth,Gosu::Color.rgba(218, 242, 52, 255))
        Gosu.draw_rect(@position.x+@heigth+@offset,@position.y+@offset,@width,@heigth+@width,Gosu::Color.rgba(218, 242, 52, 255))
        #+
        Gosu.draw_rect(@position.x + @centercontent,@position.y + @centercontent - @heigth/4 + @width/2,@width,@heigth/2,Gosu::Color.rgba(218, 242, 52, 255))
        Gosu.draw_rect(@position.x + @centercontent - @heigth/4 + @width/2,@position.y + @centercontent,@heigth/2,@width,Gosu::Color.rgba(218, 242, 52, 255))
    end
end