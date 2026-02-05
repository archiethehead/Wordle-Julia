word_list = [];

function load_file(path::AbstractString)::Vector{AbstractString}

    open(path, "r") do line

        word_list = readlines(line)
        return word_list

    end

end

function random_element(array::Vector)

    index = rand((1, size(array, 1)))
    return array[index]

end

function main()

    word_list = load_file("words.txt")
    word = random_element(word_list)
    print(word)

end

main();