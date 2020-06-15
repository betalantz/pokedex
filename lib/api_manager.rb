class Pokedex::APIManager

    BASE_URL = "https://pokeapi.co/api/v2/"

    def self.get_pokemon(page=1, limit=20)
        puts "MAKING A NETWORK REQUEST"

        url = BASE_URL + "pokemon?offset=#{(page -1)* limit}&limit=#{limit}"
        res = HTTParty.get(url)
        pokearr = res["results"]
        # binding.pry
        Pokedex::Pokemon.mass_create_from_api(pokearr)
        # return {
        #     res: res["next"],
        #     prev: res["previous"]
        # }
    end

    def self.get_pokemon_details(poke_obj)
        puts "\nMAKING A NETWORK REQUEST.....\n"

        url = poke_obj.url
        res = HTTParty.get(url)
        # binding.pry
        poke_obj.weight = res["weight"]
        poke_obj.height = res["height"]
        poke_obj.id = res["id"]
        poke_obj.types = res["types"].map {|hash| hash["type"]["name"]}

    end

end