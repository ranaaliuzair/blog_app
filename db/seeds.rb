users_data = [
  {username: "David01", email: "david01@example.com", password: "password01"},
  {username: "David02", email: "david02@example.com", password: "password02"},
  {username: "David03", email: "david03@example.com", password: "password03"},
  {username: "David04", email: "david04@example.com", password: "password04"},
  {username: "David05", email: "david05@example.com", password: "password05"},
  {username: "David06", email: "david06@example.com", password: "password06"},
  {username: "David07", email: "david07@example.com", password: "password07"}
]

users_data.each_with_index do |user_attributes, index|
  user = User.find_by(username: user_attributes[:username])
  user = User.create(user_attributes) if user.blank?

  5.times do |i|
    article =
      user.articles.create(
        title: "Article number #{i} by #{user.username}",
        description:"first description"
      )
    10.times do |i|
      article.comments.create(
        user_id: user.id,
        body: "comment number #{i} by #{user.username} on article #{index}"
      )
    end
  end
end
