module ApplicationHelper

  def liquidize(content, arguments)
    Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters]).html_safe
  end
  def redcloth_liquidize(content, arguments)
    RedCloth.new(Liquid::Template.parse(content).render(arguments, :filters => [LiquidFilters])).to_html.html_safe
  end

end