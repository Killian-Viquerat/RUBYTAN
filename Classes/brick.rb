class Brick

    attr_accessor :position

    Heigth = 50
    Width= 5
    Offset = Vector2.new(22,18)

    def initialize(font,x,y,nb)
        @position = Vector2.new(x,y)
        @font = font
        @number = nb
    end

    def draw
        Gosu.draw_rect(@position.x,@position.y,Heigth,Width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y+Heigth,Heigth,Width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y,Width,Heigth,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x+Heigth,@position.y,Width,Heigth+Width,Gosu::Color.rgba(240, 52, 52, 255))
        @font.draw_text(@number,@position.x+Offset.x,@position.y+Offset.y,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
    end

    def collapse(ball)
    end
end