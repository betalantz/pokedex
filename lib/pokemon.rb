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

    attr_accessor :name, :url, :weight, :height, :id, :types

    def initialize(name, url)
        @name, @url = name, url
        save
    end
    
    def save
        @@all << self
    end

    def full_details
        <<-DESC

POKEMON ID: #{self.id}   NAME: #{self.name}
Height: #{self.height}   Weight: #{self.weight}

#{types.length > 1 ? "Types": "Type"}: #{types.join(", ")}
        
        DESC
    end

end