
# some intro
# x = lose
# y = draw
# Z = win

function value(x)
    if x == "A"
        return 1
    elseif x == "B"
        return 2
    else
        return 3
    end
end

file_name = "day2.txt"
# file_name = "day2test.txt"
final_1 = 0
final_2 = 0

open( file_name, "r") do f

    score    = 0
    score_2  = 0
    line     = 0
    #opponent
    rock     = "A"
    paper    = "B"
    scissor  = "C"
    #me
    rock_me     = "X"
    paper_me    = "Y"
    scissor_me  = "Z"

    rock_value     = 1
    paper_value    = 2
    scissor_value = 3

    while ! eof(f)
        s        = readline(f)
        # println(s)
        c        = split(s, " ")
        opponent = c[1]
        me       = c[2]

        if me == rock_me
            score = score + rock_value
        elseif me == paper_me
            score = score + paper_value
        else
            score = score + scissor_value
        end

        # rule for rock
        if opponent == rock
            if me == rock_me
                score = score + 3
            elseif me == paper_me
                score = score + 6
            end
        end
        # rule for paper
        if opponent == paper
            if me == paper_me
                score = score + 3
            elseif me == scissor_me
                score = score + 6
            end
        end
        # rule for scissors
        if opponent == scissor
            if me == scissor_me
                score = score + 3
            elseif me == rock_me
                score = score + 6
            end
        end

        #second rule
        if me == "X" # I need to lose
            score_2 = score_2 + 0
            if opponent == rock
                score_2 += scissor_value
            elseif opponent == scissor
                score_2 += paper_value
            else
                score_2 += rock_value
            end
        elseif me == "Y"# I need to draw
            score_2 = score_2 + 3
            score_2 = score_2 + value(opponent)
        else # I need to win
            score_2 = score_2 + 6
            if opponent == rock
                score_2 += paper_value
            elseif opponent == scissor
                score_2 += rock_value
            else
                score_2 += scissor_value
            end
        end
    end

    global final_1 = score
    global final_2 = score_2

end

println( final_1)
println( final_2)
