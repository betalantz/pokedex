class Pokedex::APIManager

    BASE_URL = "https://pokeapi.co/api/v2/"

    def self.get_pokemon
        puts "MAKING A NETWORK REQUEST"

        url = BASE_URL + "pokemon"
        res = HTTParty.get(url)
        pokearr = res["results"]
        # binding.pry
        Pokedex::Pokemon.mass_create_from_api(pokearr)
    end

    def self.get_pokemon_details(poke)
        puts "\nMAKING A NETWORK REQUEST.....\n"

        url = poke.url
        res = HTTParty.get(url)
        # binding.pry
        poke.weight = res["weight"]
        poke.height = res["height"]
        poke.id = res["id"]
        poke.types = res["types"].map {|hash| hash["type"]["name"]}

    end

end