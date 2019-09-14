class ApplicationController < ActionController::Base
    include SessionsHelper

    def landing_page
        render 'layouts/landing_page'
    end
end
