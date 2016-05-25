module ComicsHelper
  def comic_box(comic, votes)
    html = ""
    img_path = "#{comic.thumbnail.path}.#{comic.thumbnail.extension}"

    html += content_tag(:div, nil, class: 'comic-box', style: "background-image: url('#{img_path}');")
    html += content_tag(:div, upvote(comic, votes), class: 'comic-actions')
    html += content_tag(:span, comic.title, class: 'comic-title')

    html.html_safe
  end

  private

    def upvote(comic, votes)
      if votes.include?(comic.id)
        content_tag(:span, '', class: 'fa fa-star')
      else
        upvote_action(comic)
      end
    end

    def upvote_action(comic)
      button_tag(
        type: 'button',
        class: "btn btn-default upvote-btn",
        id: "comic-upvote-btn-#{comic.id}",
        data: { comic_id: comic.id }) do
          content_tag(:span, '', class: 'fa fa-thumbs-o-up')
      end
    end
end
