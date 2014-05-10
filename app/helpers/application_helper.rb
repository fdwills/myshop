module ApplicationHelper
  def cut_short(info, length = 10)
    return unless info
    if info.length > length
      "#{info[0..length]}..."
    else
      info
    end
  end

  def utf8_html(content)
    return unless content
    content.force_encoding("UTF-8").html_safe
  end

  def short_utf8_html(content, length = 10)
    return unless content
    cut_short(utf8_html(content), length)
  end

  def utf8(content)
    return unless content
    content.force_encoding("UTF-8")
  end
end
