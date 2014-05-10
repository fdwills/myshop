module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
        hard_wrap: true,
        filter_html: true,
        autolink: true,
        no_intra_emphasis: true,
        strikethrough: true,
        fenced_code_blocks: true,
        gh_blockcode: true,
        tables: true,
        footnotes: true,
        lax_spacing: true
      }

      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer, options)
    end

    @markdown.render(text).force_encoding("UTF-8").html_safe
  end
end
