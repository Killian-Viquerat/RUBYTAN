class Brick

    attr_accessor :position

    def initialize(font,x,y)
        @heigth = 50
        @width= 5
        @position = Vector2.new(x,y)
        @offset = Vector2.new(22,18)
        @font = font
        @number = 1
    end

    def draw
        Gosu.draw_rect(@position.x,@position.y,@heigth,@width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y+@heigth,@heigth,@width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y,@width,@heigth,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x+@heigth,@position.y,@width,@heigth+@width,Gosu::Color.rgba(240, 52, 52, 255))
        @font.draw_text(@number,@position.x+@offset.x,@position.y+@offset.y,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
    end


end