module StaticPagesHelper

  def framing_text
    page = StaticPage.find_by_title "Framing"
    page.html if page
  end
end
