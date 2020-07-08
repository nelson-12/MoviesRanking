module ApplicationHelper
    require "addressable/uri"

    def liked?(like)
        result = Like.where(user_id: current_user.id, reference_movie_ep_id: like).exists?
    end


    def url_param(url)
        uri = Addressable::URI.parse(url)
        uri.path.split('/')[3]
    end

    

end
