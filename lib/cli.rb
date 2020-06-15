class Pokedex::CLI

    def initialize
        @page = 1
        @limit = 20
    end

    def start
        introduction
        get_pokemon_data
        # binding.pry
        main_loop
    end

    def introduction

        puts "\n\n\n\n"
        puts 'Welcome to the Wonderful World of Pokemon!'
        sleep(2)
        puts "\n\n\n\n"
    end

    def get_pokemon_data
        Pokedex::APIManager.get_pokemon(@page, @limit)
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
            when "next"
                @page += 1
                _, stop = get_page_range
                if Pokedex::Pokemon.all.length < stop
                    get_pokemon_data
                end
            when "prev"
                if @page <= 1
                    puts "You are on page 1!"
                else
                    @page -= 1
                end
            else
                display_single_pokemon(input)
            end

        end
    end

    def menu
        display_pokemon
        display_instrutions
        # binding.pry
    end

    def get_pokemon_choice
        input = gets.strip.downcase
        commands = ["exit", "next", "prev"]
        return input.downcase if commands.include?(input.downcase)
        if input.to_i.between?(1, Pokedex::Pokemon.all.length)
            return input.to_i - 1
        else
            puts "ummm....that doesn't make sense"
            return "invalid"
        end
    end

    def display_pokemon
        start, stop = get_page_range
        pokemon = Pokedex::Pokemon.all[start...stop]
        pokemon.each.with_index(start) do |poke, index|
            puts "#{index}. #{poke.name}"
        end
    end

    def get_page_range
        [(@page - 1) * @limit, @page * @limit]
    end

    def display_single_pokemon(i)
        poke_obj = Pokedex::Pokemon.all[i]
        Pokedex::APIManager.get_pokemon_details(poke_obj)
        # binding.pry
        puts poke_obj.full_details
        puts 'press any key to continue'
        gets
    end

    def display_instrutions
        puts <<-INST

Please choose a pokemon by number or type 'exit' to exit the program.


        INST
    end
end