module SitesHelper
  def seo_title(page)
    if(!page.site.seo_title.nil? && page.site.seo_title != '')
      title = page.site.seo_title
    else
      title = page.site.title
    end

    if(!page.seo_title.nil? && page.seo_title != '')
      title += " | "+page.seo_title
    end

    return title
  end

  def meta_description(page)
    if(!page.seo_meta.nil? && page.seo_meta != '')
      page.seo_meta
    else
      page.site.seo_meta
    end
  end

  def meta_keywords(page)
    if(!page.seo_keywords.nil? && page.seo_keywords != '')
      page.seo_keywords
    else
      page.site.seo_keywords
    end
  end
end
