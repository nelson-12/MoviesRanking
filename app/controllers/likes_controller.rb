class LikesController < ApplicationController
    before_action :authenticate_user!
    include ApplicationHelper
    
    def create
        reference_movie_ep_id = params['format']
        if already_liked?(reference_movie_ep_id)
            dislike(reference_movie_ep_id)
        else
            if !verify_liked_limited? 
                @like = Like.new
                @like.user_id = current_user.id
                @like.reference_movie_ep_id = reference_movie_ep_id
                if !@like.save
                    flash[:danger] = 'like com problema'
                end
                redirect_back(fallback_location: root_path)
            else
                flash['red'] = 'Número total de 2 likes alcançado'
                redirect_back(fallback_location: root_path)
            end
        end
    end

    private

    def dislike(like)
        @like = Like.find_by(reference_movie_ep_id: like)

        return unless @like

        @like.destroy
        redirect_back(fallback_location: root_path)
    end

    def verify_liked_limited?()
        result = false
        likes = Like.where(user_id: current_user.id).count
        if likes == 2
            result = true
        end

        result 
    end

    def already_liked?(like)
        result = Like.where(user_id: current_user.id,
                            reference_movie_ep_id: like).exists?
    end
end

