class Brick

    attr_accessor :position
    attr_reader :polygon

    Heigth = 50
    Width= 5
    Offset = Vector2.new(20,16)

    def initialize(font,x,y,nb)
        @position = Vector2.new(x,y)
        @font = font
        @number = nb
        @polygon = Polygon.new(Vector2.new(@position.x,position.y),Vector2.new(@position.x+Heigth,@position.y+Heigth))
    end

    def draw
        Gosu.draw_rect(@position.x,@position.y,Heigth,Width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y+Heigth-Width,Heigth,Width,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x,@position.y,Width,Heigth,Gosu::Color.rgba(240, 52, 52, 255))
        Gosu.draw_rect(@position.x+Heigth-Width,@position.y,Width,Heigth,Gosu::Color.rgba(240, 52, 52, 255))
        @font.draw_text(@number,@position.x+Offset.x,@position.y+Offset.y,0,1,1,Gosu::Color.rgba(240, 52, 52, 255))
    end

    def collapse(ball)
    end
end