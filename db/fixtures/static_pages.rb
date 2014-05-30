module Fixtures
  def static_pages
    [{ id: 1, slug_id: "about",   top: true, sort_order: 1, title: "About",   content: "About __Regional__ Indicators" },
     { id: 2, slug_id: "contact", top: true, sort_order: 2, title: "Contact", content: "*Contact* us about this site"  }]
  end

  module_function :static_pages
end