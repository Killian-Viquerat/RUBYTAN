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
        p self
    end
end