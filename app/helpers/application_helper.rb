module ApplicationHelper

    def liked?(like)
        result = Like.where(user_id: current_user.id, reference_movie_ep_id: like).exists?
    end
end
