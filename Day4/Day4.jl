
# some intro

file_name = "Day4.txt"
# file_name = "Day4test.txt"
#
value_1  = 0
value_2  = 0

open( file_name, "r") do f

    while ! eof(f)
        s = readline(f)
        c = split(s, ",")
        # println( c)
        elf_1 = split(c[1], '-')
        elf_2 = split(c[2], '-')
        elf_1 = [ parse(Float64,elf_1[i]) for i in 1:2 ]
        elf_2 = [ parse(Float64,elf_2[i]) for i in 1:2 ]

        # c = [ elf_1[i] for i in Int(1):length(elf_1)]
        # when one is fully contained in the other
        if elf_1[1] <= elf_2[1] && elf_1[2] >= elf_2[2]
            # println("First " elf_2, " ", elf_1)
            global value_1 = value_1 + 1
        elseif elf_2[1] <= elf_1[1] && elf_2[2] >= elf_1[2]
            # println( "Second ", elf_1, " ", elf_2)
            global value_1 = value_1 + 1
        end

        if elf_1[1] <= elf_2[1] && elf_1[2] >= elf_2[2]
            global value_2 = value_2 + 1
        elseif elf_2[1] <= elf_1[1] && elf_2[2] >= elf_1[2]
            global value_2 = value_2 + 1
        elseif elf_1[2] >= elf_2[1] && elf_1[2] <= elf_2[2]
            global value_2 = value_2 + 1
        elseif elf_1[1] <= elf_2[2] && elf_1[1] >= elf_2[1]
            global value_2 = value_2 + 1
        elseif elf_2[2] >= elf_1[1] && elf_2[2] <= elf_1[2]
            global value_2 = value_2 + 1
        elseif elf_2[1] <= elf_1[2] && elf_2[1] >= elf_1[1]
            global value_2 = value_2 + 1
        end
    end
end

println( "First rule ", value_1)
println( "Second rule ", value_2)

# test =
# b    = parse(Float64, test)
# println(b, " ", typeof(b))

# https://docs.julialang.org/en/v1/manual/conversion-and-promotion/
