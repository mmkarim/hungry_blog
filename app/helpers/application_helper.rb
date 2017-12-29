module ApplicationHelper
  def markdown text
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, no_intra_emphasis: true,
      fenced_code_blocks: true, disable_indented_code_blocks: false, autolink: true,
      tables: true, underline: true, highlight: true)

    markdown.render(text).html_safe
  end

  def first_image_link text
    match = text.match(/\!\[.*\]\((.*)\)/)
    match ? match[1] : image_path("default.jpg")
  end

  def activate
    "current"
  end

  def image_markdown image_link
    "![](/#{image_link})"
  end

  def popular_posts
    Post.all.order(created_at: :desc).limit 5
  end
end
