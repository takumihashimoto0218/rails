module PagyHelper
  include Pagy::Frontend

  def custom_pagy_nav(pagy)
    link = lambda do |n, text = nil|
      p = { page: n }
      p.merge!(pagy.vars[:params]) if pagy.vars[:params].is_a?(Hash)
      active_class = n == pagy.page ? ' active' : ''
      html = link_to((text || n.to_s), url_for(p), class: "page btn#{active_class}")
      html + ' '
    end

    current_page = pagy.page
    total_pages = pagy.pages

    html = +''
    from = [1, current_page - 2].max
    to = [total_pages, current_page + 2].min

    html << link.call(1, '<<') if current_page > 3 

    (from..to).each { |n| html << link.call(n) }

    html << link.call(total_pages, '>>') if current_page < total_pages - 2 

    html.html_safe
  end
end