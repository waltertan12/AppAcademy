# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, presence: true, length: { maximum: 255 }
  validates :short_url, presence: true, uniqueness: true
  validates :submitter_id, presence: true
  validate :count_in_last_one_min, :count_all_for_premium

  belongs_to :submitter,
    class_name: "User",
    foreign_key: :submitter_id,
    primary_key: :id

  has_many :visits,
    class_name: "Visit",
    foreign_key: :short_url_id,
    primary_key: :id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user

  has_many :taggings,
    class_name: "Tagging",
    foreign_key: :short_url_id,
    primary_key: :id

  def self.random_code
    random_code = SecureRandom.urlsafe_base64(16)

    while ShortenedUrl.exists?(random_code)
      random_code = SecureRandom.urlsafe_base64(16)
    end

    random_code
  end

  def self.create_for_user_and_long_url!(user,long_url)
    ShortenedUrl.create!({submitter_id: user.id,
                          long_url:     long_url,
                          short_url:    ShortenedUrl.random_code})
  end

  def count_in_last_one_min
    current_count = ShortenedUrl
                      .all
                      .where(submitter_id: submitter_id)
                      .where(created_at: 1.minutes.ago..Time.now)
                      .count
    if current_count > 5
      errors.add(:current_count, "oh no, you submit to quickly")
    end
  end

  def count_all_for_premium
    current_count = ShortenedUrl
                      .all
                      .where(submitter_id: submitter_id)
                      .count

    if current_count > 5 && !User.find_by_id(submitter_id).premium
      errors.add(:current_count, "oh no, you should pay us")
    end
  end

  def num_clicks
    visits.all.where(short_url_id: id).count
  end

  def num_uniques
    visitors.all.count
  end

  def num_recent_uniques
    visitors.all.where(created_at: 10.minutes.ago..Time.now).count
  end
end