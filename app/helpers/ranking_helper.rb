module RankingHelper
    def search_information_api(type ,id)
        @sumary_service = GlobalSummary.new
        @ranking = @sumary_service.extra_informations(type, id)
        @ranking['name']
    end
end
