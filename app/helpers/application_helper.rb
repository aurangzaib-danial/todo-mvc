module ApplicationHelper
  def placeholder_text(attribute, object, text)
    object.errors.full_messages_for(attribute).first || text
  end

  def main_field(form_builder, attribute, placeholder)
    form_builder.text_field(attribute, class: 'new-todo', autofocus: true, 
      placeholder: placeholder_text(attribute, form_builder.object, placeholder))
  end
end
