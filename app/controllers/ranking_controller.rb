class RankingController < ApplicationController
    before_action :set_global_summary_service
    include ApplicationHelper
    include RankingHelper

    def index
        @ranking = raking_formated()
    end

    def show
        puts params
        @details = get_details(params[:id])
        if @details['detail'] == 'Not found'
            flash[:danger] = 'Filme não existente'
            redirect_back(fallback_location: ranking_index_path)
        else
            if validade_position_show(@details['episode_id']) == true
                @details
            else
                flash[:danger] = 'O Filme indicado não oculpa as 2 primeiras posições no Ranking ou não possui votos'
                redirect_back(fallback_location: ranking_index_path)
            end
        end
    end

    private 

    def raking_formated()
       votos =  get_votos()
       if votos.empty? 
        ranking = []
       else

        @summary = @sumary_service.general
        if @summary['count'].to_i > 0 || @summary.empty?
            ranking = []
            votos.each do |voto|
                @summary['results'].each do | suma| 
                    if suma['episode_id'] == voto['reference_movie_ep_id']
                        ranking << suma.merge(voto)
                    end
                end
            end
            ranking
        else
            ranking = []
        end
       end
    end

    def validade_position_show(episode_id)
        votos = get_votos()
        if votos.empty? 
            result = false
        else
            votos.each do |voto|
               if voto['reference_movie_ep_id'] == episode_id
                    if voto['rank'] <= 2
                        result = true
                    else
                        result = false
                    end
               end
            end
            result
        end

    end


    def get_votos()
        votos =  Like.find_by_sql('
            SELECT reference_movie_ep_id, 
            COUNT(reference_movie_ep_id) ,
            DENSE_RANK() OVER(
                ORDER BY COUNT(reference_movie_ep_id) DESC
            ) as rank
            FROM likes 
            group by reference_movie_ep_id
        ').as_json
    end

    def get_details(movie)
        @details = @sumary_service.details(movie)
    end

    def set_global_summary_service
        @sumary_service = GlobalSummary.new
    end

end
