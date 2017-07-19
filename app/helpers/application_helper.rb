module ApplicationHelper
  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?id=identicon&s=50"
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}');</script>"
      flash_messages << text.html_safe if message
    end
    puts(flash_messages)
    flash_messages.join("\n").html_safe

  end


  def devise_message_flash
    return "" if resource.errors.empty?
    messages = resource.errors.full_messages.map {|msg| content_tag(:li, msg)}.join
    html = "<script>toastr.#{'error'}('#{messages}');</script>"
    html.html_safe
  end


end

