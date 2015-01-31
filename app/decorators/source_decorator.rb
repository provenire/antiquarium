class SourceDecorator < ObjectDecorator
  delegate_all

  def kind
    model.kind.capitalize
  end

  def thumbnail
    model.image.index.url || 'no_photo/100.png'
  end

  def show_image
    model.image.show.url || 'no_photo/500.png'
  end

end
