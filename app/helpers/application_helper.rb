module ApplicationHelper
  def is_current_page(section)
    'active' if current_page? section
  end

  def get_classname_as_string(instance)
    instance.class.name.downcase
  end

  def get_month_name(month_i)
    t("date.month_names")[month_i.to_i].capitalize
  end
end
