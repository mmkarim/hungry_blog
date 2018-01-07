module ApplicationHelper
  def markdown text
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, no_intra_emphasis: true,
      fenced_code_blocks: true, disable_indented_code_blocks: false, autolink: true,
      tables: true, underline: true, highlight: true)

    markdown.render(text).html_safe
  end

  def first_image_link text
    match = text.match Settings.image.fetch_regex
    match ? match[1] : image_path(Settings.image.default_post_url)
  end

  def activate
    "current"
  end

  def image_markdown image_link
    "![](/#{image_link})"
  end

  def popular_posts
    Post.all.order(created_at: :desc).limit Settings.post.popular_posts_limit
  end

  def popular_tags
    ActsAsTaggableOn::Tag.most_used Settings.tag.popular_tags_limit
  end

  def carousel_quotes
    Quote.all.limit(4).order(created_at: :desc)
  end

  def generate_jwt
    admin_signed_in? ? Auth.encode({email: current_admin.email}) : nil
  end
end
