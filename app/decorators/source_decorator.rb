class SourceDecorator < ObjectDecorator
  delegate_all

  def kind
    model.kind.capitalize
  end

  def thumbnail_url
    model.pages.first.image.index.url || 'http://placehold.it/100x100&text=No Photo'
  end

end
