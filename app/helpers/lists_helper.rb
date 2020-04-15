module ListsHelper
  def set_list_title
    main_text @list.title
    content_for :main_text_id, 'list-title'
  end

  def shared?(list)
    content_tag :sup, '(shared)', class: 'shared_text' if list.has_at_least_one_collaborator?
  end
end
