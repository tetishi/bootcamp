# frozen_string_literal: true

module UserDecorator
  def twitter_url
    "https://twitter.com/#{twitter_account}"
  end

  def role
    roles = [
      { role: :admin, value: admin },
      { role: :mentor, value: mentor },
      { role: :adviser, value: adviser },
      { role: :trainee, value: trainee },
      { role: :graduate, value: graduated_on },
      { role: :student, value: true }
    ]
    roles.detect { |v| v[:value] }[:role]
  end

  def avatar_image(length)
    avatar.variant(combine_options: {
      resize: "#{length}x#{length}^",
      crop: "#{length}x#{length}+0+0",
      gravity: :center
    }).processed
  end

  def face_image(length)
    face.variant(combine_options: {
      resize: "#{length}x#{length}^",
      crop: "#{length}x#{length}+0+0",
      gravity: :center
    }).processed
  end
end
