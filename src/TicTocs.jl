module TicTocs

export TicToc, tic, toc

g_start = 0.0


"""
    TicToc

This is a timer. To start the timer:
```
t = TicToc();  # create a new timer 
tic(t)         # starts the timer
```
Then use `toc(t)` to find out how many seconds have 
elapsed since the timer was started.
"""
mutable struct TicToc
    start::Float64
    TicToc() = new(0.0)
end

"""
    tic()
    tic(t::TicToc)

Start a timer. With no argument, use the single global timer. 
"""
function tic()
    global g_start = time()
    nothing
end

function tic(t::TicToc)
    t.start = time()
    nothing
end 


"""
    toc()
    toc(t::TicToc)

Return the number of seconds since the timer has been started.
"""
function toc()
    global g_start
    time() - g_start
end

function toc(t::TicToc)
    time() - t.start
end

import Base: show

show(io::IO, t::TicToc) = print(io,"New Timer")

end # module TicTocs
