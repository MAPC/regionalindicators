module SlugExtension
  def slug
    self.title.downcase.gsub(/[\s+\W]+/, '-').gsub(/\A[-*]+|[-*]\z+/, '')
  end
end