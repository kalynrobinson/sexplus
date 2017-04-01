module ApplicationHelper
  # Returns full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Sex+'
    if page_title.empty?
      base_title
    else
      base_title + ' | ' + page_title
    end
  end

  def nav_link(text, path)
    active = current_page?(path) ? 'is-active' : ''
    link_to text, path, class: 'mdl-layout__tab ' + active
  end
end
