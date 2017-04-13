class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity

  def clickbaity
  clickbait_titles = [/Won't Believe/i, /Secret/i,
    /Top [0-9]/i, /Guess/i]
    if clickbait_titles.none? {|clickbait_title| clickbait_title.match title}
      errors.add(:title, "it's clickbait!")
    end
  end
end
