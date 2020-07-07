class RankingController < ApplicationController
    before_action :set_global_summary_service

    before_action :set_global_summary_service

    def index
        @ranking = raking_formated()
    end

    def show
        @details = @sumary_service.details(params[:id])
    end
    private 

    def set_global_summary_service
        @sumary_service = GlobalSummary.new
    end

    def raking_formated()
       votos =  Like.find_by_sql('
            SELECT reference_movie_ep_id, 
            COUNT(reference_movie_ep_id) ,
            DENSE_RANK() OVER(
                ORDER BY COUNT(reference_movie_ep_id) DESC
            ) as rank
            FROM likes 
            group by reference_movie_ep_id
        ').as_json

        @summary = @sumary_service.general

        ranking = []
        votos.each do |voto|
            @summary['results'].each do | suma| 
                if suma['episode_id'] == voto['reference_movie_ep_id']
                    ranking << suma.merge(voto)
                end
            end
        end

        ranking
        
    end
end
