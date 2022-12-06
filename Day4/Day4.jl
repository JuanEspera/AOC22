
# some intro

file_name = "Day4.txt"
# file_name = "Day4test.txt"
#
value  = 0
open( file_name, "r") do f

    while ! eof(f)
        s = readline(f)
        c = split(s, ",")
        # println( c)
        elf_1 = split(c[1], '-')
        elf_2 = split(c[2], '-')
        c = [ elf_1[i] for i in Int(1):length(elf_1)]
        # when one is fully contained in the other
        if elf_1[1] <= elf_2[1]
            if elf_1[2] >= elf_2[2]
                global value = value + 1
            end
        elseif elf_2[1] <= elf_1[1]
            if elf_2[2] >= elf_1[2]
                global value = value + 1
            end
        elseif elf_1[1] <= elf_2[2]
            if elf_1[1] >= elf_1[2]
                global value = value + 1
            end
        elseif elf_2[1] <= elf_1[2]
            if elf_2[1] >= elf_2[2]
                global value = value + 1
            end
        end
        #
        # if elf_1[1] <= elf_2[2]
        #     if elf_1[2] >= elf_2[2]
        #     println(elf_1, " ", elf_2)
        #     println( " ok funziona")
        #     end
        # end

    end
end

println( value)



# https://docs.julialang.org/en/v1/manual/conversion-and-promotion/
