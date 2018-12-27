module ApplicationHelper
  # def markdown(text)
  #   options = {
  #     filter_html:     true,
  #     hard_wrap:       true,
  #     link_attributes: { rel: 'nofollow', target: "_blank" },
  #     space_after_headers: true,
  #     fenced_code_blocks: true,
  #
  #     prettify:         true,  #useless
  #     with_toc_data:    true,  #useless
  #     escape_html:     false
  #   }
  #
  #   extensions = {
  #     autolink:           true,
  #     superscript:        true,
  #     disable_indented_code_blocks: false,
  #
  #     highlight: true,
  #     underline: true,
  #     tables: true,
  #     fenced_code_blocks: true,
  #     space_after_headers: true
  #   }
  #
  #   renderer = Redcarpet::Render::HTML.new(options)
  #   markdown = Redcarpet::Markdown.new(renderer, extensions)
  #   markdown.render(text).html_safe
  # end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end

  class RougeRenderer < Redcarpet::Render::HTML
    require "rouge"
    require "rouge/plugins/redcarpet"

    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    coderougify = RougeRenderer.new(filter_html: true, hard_wrap: true)
    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true,
      tables: true,
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html = Redcarpet::Markdown.new(coderougify, options)

    markdown_to_html.render(text).html_safe
  end
end
