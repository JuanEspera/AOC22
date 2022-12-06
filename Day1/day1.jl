x     = 0 #variable for local calories
c_max = 0 #maximum caloriees

calories = Float64[]


open("day1.txt", "r") do f
# open("day1test.txt", "r") do f
    line = 0
    while ! eof(f)
        s = readline(f)
        line += 1
        # println(s)
        if s == ""
            global calories = push!(calories, x)
            if x > c_max
                global c_max = x
            end
            global x = 0
        else
            global x = x + parse(Float64,s)
        end

    end
end
global calories = push!(calories, x)
if x > c_max
    global c_max = x
end

calories = sort(calories, rev = true)
first_three = calories[1] + calories[2] + calories[3]
println(c_max)
println(first_three)

# println(calories)
