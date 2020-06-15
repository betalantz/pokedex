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
            
        end
        puts "in main loop"
    end

    def menu
        display_pokemon
        # display_instrutions
        binding.pry
    end

    def display_pokemon
        pokemon = Pokedex::Pokemon.all
        pokemon.each do |poke|
            puts poke.name
        end
    end
end