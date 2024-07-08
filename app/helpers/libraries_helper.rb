# Helper methods for the game library
module LibrariesHelper
  def page_title(filter = nil, search_query = nil)
    if filter.present? && !filter.eql?("sorted")
      I18n.t("app.filter_title") + I18n.t("home.tabs.#{filter}")
    elsif search_query.present?
      I18n.t("app.search_title") + search_query
    else
      I18n.t("app.title")
    end
  end

  def filter_nav_classes(item, filter = nil, search_query = nil)
    if (filter.present? && filter.eql?(item)) ||
       (filter.nil? && search_query.nil? && item.eql?("sorted"))
      "text-white bg-blue-600 cursor-default active"
    else
      "text-gray-700 active:text-gray-800 hover:bg-gray-100 active:bg-gray-200"
    end
  end
end
