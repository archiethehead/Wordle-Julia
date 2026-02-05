word_list = [];

function load_file(path::AbstractString)::vector{AbstractString}

    open(path, "r") do line

        word_array = readlines(line)

    end

    return word_array

end

function main()

    word_array = load_file("words.txt");
    print(file_names)

end

main();