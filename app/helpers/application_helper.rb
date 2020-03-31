module ApplicationHelper
  def placeholder_text(attribute, object, text)
    object.errors.full_messages_for(attribute).first || text
  end

  def main_field(form_builder, attribute, placeholder)
    form_builder.text_field(attribute, class: 'new-todo', autofocus: true, 
      placeholder: placeholder_text(attribute, form_builder.object, placeholder))
  end

  def main_text(text)
    content_for :main_text, text
  end


  def login_link(site)

    url = "/auth/#{site}"
    
    url << '_oauth2' if site == 'google'

    link_text = "Sign in with #{site.capitalize}"

    link_class = "btn btn-block btn-social btn-#{site}"

    span_class = "fa fa-#{site}"

    link_to(url, class: link_class) do
      content_tag(:span, nil, class: span_class) << link_text
    end
  end

end
