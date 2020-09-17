
class Character
    def initialize(wwidth,wheight)
        @texture = "./Ressources/character.png"
        @image = Gosu::Image.new(@texture)
        @position = Vector2.new(wwidth/2-@image.width/2,wheight-@image.height)
    end

    def draw()
        @image.draw(@position.x,@position.y,0)
    end

    def move(vector2)
        @position.add(vector2)
    end
end