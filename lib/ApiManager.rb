class Pokedex::APIManager

    BASE_URL = "https://pokeapi.co/api/v2/"

    def self.get_pokemon
        puts "MAKING A NETWORK REQUEST"

        url = BASE_URL + "pokemon"
        res = HTTParty.get(url)
        res
    end

end