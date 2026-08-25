function max_divisor(number::Integer) ::Integer
    return Integer(floor(sqrt(number)))
end

function is_prime(number::Integer) ::Bool
    max::Integer = max_divisor(number)
    # False if any number evenly divides it.
    for x=2:max
        if number % x == 0
            return false
        end
    end
    # true otherwise.
    return true
end

function next_prime(number::Integer) ::Integer
    to_check = number
    while true
        to_check += 1
        if is_prime(to_check)
            return to_check
        end
    end
end
   
function first_n_primes(number::Integer) ::Vector{<:Integer}
    last::Integer = 0
    primes = Vector{Integer}()
    for n=1:number
        last = next_prime(last)
        push!(primes, last)
    end
    return primes
end

function first_n_twin_primes(number::Integer) ::Vector{<:Integer}
    last::Integer = 0
    primes = Vector{Integer}()
    for n=3:number
        while true
            last = next_prime(last)
            if is_prime(last + 2)
                push!(primes, last)
                push!(primes, last+2)
                last += 2
                break
            end
        end
    end
    return primes
end

sum(x^2 for x in first_n_twin_primes(10000))