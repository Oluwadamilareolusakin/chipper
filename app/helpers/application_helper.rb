module ApplicationHelper
    def page_title(title = '')
        @base_title = 'Chipper'
        if title == ''
            @base_title
        else
            title + ' | ' + @base_title
        end
    end
end
