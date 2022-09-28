module ApplicationHelper
    def conditional_link_to(condition, url, style, &content)
        if condition
            return link_to url, target: "_top", class: style, &content 
        else 
            return link_to nil, class: style, &content
        end
    end
end
