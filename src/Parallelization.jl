# Adding Procs to core
addprocs(4)


@everywhere function fib(n)
  if n < 2
    return n
    else return fib(n-1) + fib(n-2)
  end
end


@elapsed @spawn for i = 1:45
                  fib(i)
                end

@elapsed @parallel for i = 1:45
                  fib(i)
                end

b = @spawn fib(45)

@elapsed a = fetch(b)
print(a)
rmprocs(workers())
current_task()
