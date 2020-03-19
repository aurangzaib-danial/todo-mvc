module ApplicationHelper
  def error_text(attribute, object)
    object.errors.full_messages_for(attribute).first
  end
end
