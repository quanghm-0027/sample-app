module ApplicationHelper
  # Returns the full title on a per-page basis. # Documentation
  def full_title page_title = ""
    base_title = t("title.base_title")
    page_title.empty? ? base_title : (page_title + " | " + base_title)
  end
end
