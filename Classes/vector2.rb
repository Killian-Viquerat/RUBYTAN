class Vector2

    attr_accessor :x
    attr_accessor :y

    def initialize(x,y)
        @x = x
        @y = y
    end

    def add(vector)
        @x += vector.x
        @y += vector.y
    end

    def norme(vector)
        @x = (@x-vector.x) / 80
        @y = (@y-vector.y) / 80
    end
end