module SlugExtension
  def slug
    self.title.downcase.gsub(/[\s+\W]+/, '-')
  end
end