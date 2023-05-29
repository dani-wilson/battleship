module Renderable

    def render(peek = false)
        if @fired_upon == false
            if peek == true && @ship
                @render = "S"
            else
                @render
            end
        else 
            if !@ship
                @render = "M"
            elsif @ship.sunk? == true
                @render = "X"
            else
                @render = "H"
            end
        end
    end
end