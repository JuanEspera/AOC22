
# some intro
# x = lose
# y = draw
# Z = win

# function find_value(x)
#     open( "value.txt", "r") do f2
#         global line = 1
#         while ! eof(f2)
#             linea = readline(f2)
#             if common == linea
#                 println( line)
#                 return line
#             end
#             line = line + 1
#         end
#     end
#
# end

file_name = "Day3.txt"
# file_name = "Day3test.txt"
#
value  = 0
open( file_name, "r") do f

    while ! eof(f)
        s = readline(f)
        c = split(s, "")
        N_2 = floor(length(c)/2 + 0.001)
        N_tot = floor(length(c) + 0.001)

        half_1 = [ c[i] for i in Int.(1):Int.(N_2) ]
        half_2 = [ c[i] for i in Int.(N_2 + 1):Int.(N_tot) ]
        # println( c)
        # println( half_1)
        # println( half_2)
        common = 0
        for a in half_1
            for b in half_2
                if a == b
                    common = a
                end
            end
        end
        # println( common)
        open( "value.txt", "r") do f
            line = 1
            while ! eof(f)
                s = readline(f)
                if common == s
                    # println( common, " ", s, " ", line)
                    global value = value + line
                end
                line = line + 1
            end
        end
    end
end

println( "First rule ", value)

value  = 0

open( file_name, "r") do f
    group = 1
    while ! eof(f)
        s = readline(f)
        c = split(s, "")

        if group == 1
            global line_1 = c
        elseif group == 2
            global line_2 = c
        else
            global line_3 = c
        end

        if group == 3
            for a in line_1
                for b in line_2
                    if a == b
                        for c in line_3
                            if c == b
                                global common = c
                            end
                        end
                    end
                end
            end
            # println( line_1)
            # println( line_2)
            # println( line_3)
            open( "value.txt", "r") do f
                line = 1
                while ! eof(f)
                    s = readline(f)
                    if common == s
                        global value = value + line
                    end
                    line = line + 1
                end
            end
            group = 0
        end
        group = group + 1
        # println( common)
    end
end

println( "Second rule ", value)
