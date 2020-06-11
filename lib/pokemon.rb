class Pokedex::Pokemon

    @@all = []

    def self.all
        @@all
    end

    def self.mass_create_from_api(pokearr)
        pokearr.each do |pokehash|
            self.new(pokehash["name"], pokehash["url"])
        end
    end

    attr_accessor :name, :url

    def initialize(name, url)
        @name, @url = name, url
        save
    end
    
    def save
        @@all << self
    end

end