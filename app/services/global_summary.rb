class GlobalSummary
    include HTTParty
    base_uri 'https://swapi.dev/api'

    def initialize
        @options = { }
    end

    def general 
        self.class.get('/films/?format=json', @options)
    end
end