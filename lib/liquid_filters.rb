module LiquidFilters
  include ActionView::Helpers::NumberHelper

  def nav(site, page="")
    @site = Site.find_by_name(site)
    menu = ""
    menu << "<ul class='nav'>"
      @site.pages.each do |pg|
        if page == pg.name
          menu << "<li class='active'>"
        else
          menu << "<li>"
        end
          menu << "<a href='"+pg.url+"'>"+pg.name+"</a>"
        menu << "</li>"
      end
    menu << "</ul>"
    return menu
  end

#HTML Filters
  def img_tag(url, alt="")
    "<img src='"+file+"' alt='"+alt+"' />"
  end

  def script_tag(file)
    "<script src='/assets/"+file+"' type='text/javascript'></script>"
  end

  def stylesheet_tag(file, media="all")
    "<link src='"+file+"' media='"+media+"' rel='stylesheet' type='text/css'>"
  end

#URL Filters
  def link_to(link, url, title="")
    "<a href='"+url+"' tile='"+title+"'>"+link+"</a>"
  end

#MONEY
  def currency(price)
    number_to_currency(price)
  end

#MATH

#MANIPULATION


end