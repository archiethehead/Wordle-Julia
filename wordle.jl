function load_file(path::AbstractString)::Vector{AbstractString}

    open(path, "r") do line

        word_list = readlines(line)
        return word_list

    end

end

function random_element(array::Vector)

    index = rand(1:size(array, 1))
    return array[index]

end

function check_word(guess::AbstractString, word::AbstractString)

    attempt = []
    win = true
    for n in 1:length(word)

        colour = 3
        if guess[n] == word[n]
            colour = 1

        
        elseif occursin(guess[n], word)
            colour = 2
            win = false
        
        else
            win = false

        end

        push!(attempt, (guess[n], colour))

    end

    return attempt, win

end

function main()

    word_list = load_file("words.txt")
    word = random_element(word_list)
    attempts = 6
    win = false

    while attempts != 0 && win == false
        
        print("Guesses left = ", attempts, "\n")
        guess = readline()
        println("")

        if length(guess) == 5

            attempts -= 1
            result, win = check_word(guess, word)

            for letter in result

                if letter[2] == 1

                    printstyled(letter[1], color = :green)
                
                elseif letter[2] == 2

                    printstyled(letter[1], color = :yellow)

                else

                    printstyled(letter[1], color = :red)

                end

            end

        end

        println("")

    end

end

main()