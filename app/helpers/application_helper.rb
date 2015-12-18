module ApplicationHelper
  def is_current_page(section)
    'active' if current_page? section
  end

  def get_classname_as_string(instance)
    instance.class.name.downcase
  end
end
