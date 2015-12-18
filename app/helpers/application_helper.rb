module ApplicationHelper
  def is_current_page(section)
    'active' if current_page? section
  end
end
