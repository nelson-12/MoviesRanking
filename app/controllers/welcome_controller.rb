class WelcomeController < ApplicationController

    before_action :set_global_summary_service

    def index
        @summary = @sumary_service.general
    end

    def set_global_summary_service
        @sumary_service = GlobalSummary.new
    end
end
