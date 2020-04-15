module ListsHelper
  def set_list_title
    main_text @list.title
    content_for :main_text_id, 'list-title'
  end
end
