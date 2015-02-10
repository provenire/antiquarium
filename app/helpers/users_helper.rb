module UsersHelper

  def notifications_tag
    notifications = current_user.mailbox.notifications.size
    label_classes = ['fs-13', 'label']
    label_classes << 'label-inverse' if notifications > 0
    content_tag(:span, notifications, class: label_classes)
  end

end
