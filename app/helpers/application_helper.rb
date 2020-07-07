module ApplicationHelper
    require "addressable/uri"

    def liked?(like)
        result = Like.where(user_id: current_user.id, reference_movie_ep_id: like).exists?
    end


    def url_param(url)
        uri = Addressable::URI.parse(url)
        uri.path.split('/')[3]
    end

    def search_information_api(type ,id)
        @sumary_service = GlobalSummary.new
        @ranking = @sumary_service.extra_informations(type, id)
        @ranking['name']
    end

end
