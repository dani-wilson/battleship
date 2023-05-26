class Ship

attr_reader :name,
            :length

    def initialize(name, length)
        @name = name
        @length = length
        @sunk = false
    end

    def health
        @length
    end

    def sunk?
        if @length == 0
        @sunk = true
        else
        @sunk = false
        end
    end

    def hit
        @length -= 1
    end



end