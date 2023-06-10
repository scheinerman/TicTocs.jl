# TicTocs
Timers in the spirit of `tic` and `toc` from MATLAB.

## Simple Timer

After `using TicTocs` use `tic()` to start a timer and then `toc()` will return the number of seconds since calling `tic()`.
```
julia> tic(); sleep(5); toc()
5.009875059127808
```

Note that `toc` can be called repeatedly and it reports the number of seconds 
since `tic`. That is `toc` does not reset the timer. 
```
julia> tic(); sleep(2); println(toc()); sleep(2); println(toc())
2.0028789043426514
4.037419080734253
```

## Multiple Timers

Calling `TicToc()` creates a new timer. Start and stop the timer like this:
```
julia> t = TicToc()
New Timer

julia> tic(t); sleep(4); toc(t)
4.009500980377197
```

The timer started with a plain `tic()` runs independently from one started 
by `tic(t)`. There can be many timers running at once.

In this example, we start the global timer, wait two seconds, then start a named
timer `t`, wait four seconds, and then query both timers:
```
julia> tic(); sleep(2); tic(t); sleep(4); a = toc(); b = toc(t);

julia> @show a;
a = 6.004667043685913

julia> @show b;
b = 4.002234935760498
```

