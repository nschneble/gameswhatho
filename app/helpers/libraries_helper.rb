# Helper methods for the game library
module LibrariesHelper
  def page_title(search_query = nil)
    if search_query.present?
      I18n.t("app.search_title") + search_query
    else
      I18n.t("app.title")
    end
  end
end
