module ApplicationHelper

  def author_name(content)
    if content.user
      content.user.login
    else
      'admin'
    end
  end

  def author_link(content)
    if content.user
      member_path(content.user)
    else
      '#'
    end
  end

  def published_tag(content)
    if content.published
      'Unpublished?'
    else
      'Published?'
    end
  end

  def published_link(content)
    if content.published
      unpublished_content_path(content)
    else
      published_content_path(content)
    end
  end

  def owner(user)
    user.eql?(current_user)
  end

end
