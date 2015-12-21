module ContactsHelper
  def get_contact_options
    to_ret = Contact.select([:name, :id]).map{|v| [v.name, v.id]}
  end
end
