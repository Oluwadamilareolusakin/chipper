class ApplicationController < ActionController::Base
    include SessionsHelper

    def landing_page
        if current_user
            render 'timelines/show'
        else
            render 'layouts/landing_page'
        end
    end
end
