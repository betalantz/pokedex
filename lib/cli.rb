class Pokedex::CLI

    def start
        introduction
        get_pokemon_data
        main_loop
    end

    def introduction

        puts "\n\n\n\n"
        puts 'Welcome to the Wonderful World of Pokemon!'
        sleep(2)
        puts "\n\n\n\n"
    end

    def get_pokemon_data
        Pokedex::APIManager.get_pokemon
    end

    def main_loop
        loop do
            menu
            input = get_pokemon_choice
            case input
            when "exit"
                break
            when "invalid"
                next
            else
                puts input
                # display_single_pokemon(input)
            end

        end
        puts "in main loop"
    end

    def menu
        display_pokemon
        display_instrutions
        # binding.pry
    end

    def get_pokemon_choice
        input = gets.strip.downcase
        return input if input == "exit"
        if input.to_i.between?(1, Pokedex::Pokemon.all.length)
            return input.to_i
        else
            puts "ummm....that doesn't make sense"
            return "invalid"
        end
    end

    def display_pokemon
        pokemon = Pokedex::Pokemon.all
        pokemon.each.with_index(1) do |poke, index|
            puts "#{index}. #{poke.name}"
        end
    end

    def display_instrutions
        puts <<-INST

Please choose a pokemon by number or type 'exit' to exit the program.


        INST
    end
end