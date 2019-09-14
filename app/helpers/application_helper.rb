module ApplicationHelper
    def page_title(title = '')
        @base_title = 'Chipper | Social network for the dauntless'
        if title == ''
            @base_title
        else
            title + ' | ' + @base_title
        end
    end
end
