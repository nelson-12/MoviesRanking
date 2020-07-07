class GlobalSummary
    include HTTParty
    base_uri 'https://swapi.dev/api'

    def initialize
        @options = { }
    end

    def general 
        self.class.get('/films/?format=json', @options)
    end

    def details(film)
        puts film
        self.class.get('/films/'+film+'/?format=json', @options)
    end
end