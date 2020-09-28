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

    def sub(vector)
        @x = (vector.x-@x) / 75
        @y = (vector.y-@y) / 75
    end
end