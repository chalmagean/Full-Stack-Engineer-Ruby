module ComicsHelper
  def comic_box(comic)
    html = ""
    img_path = "#{comic.thumbnail.path}.#{comic.thumbnail.extension}"

    html += content_tag(:div, nil, class: 'comic-box', style: "background-image: url('#{img_path}');")
    html += content_tag(:span, comic.title)

    html.html_safe
  end
end
