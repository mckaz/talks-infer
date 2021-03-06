class Talk < ActiveRecord::Base
  extend Enumerize

  belongs_to :owner, class_name: "User", inverse_of: :owned_talks
  has_and_belongs_to_many :lists, :include => :subscriptions
  has_many :subscriptions, :as => :subscribable, :dependent => :destroy # :include => :user
  has_many :subscribers, :through => :subscriptions, :class_name => "User", :source => :user
  belongs_to :building
  has_many :registrations, inverse_of: :talk

  validate :start_end_same_day
  validate :start_end_not_error
  validate :start_less_than_end
  validates_presence_of :owner
  validate :at_least_one_list

  attr_accessor :trigger_watch_email

  # The following can be customized, but leave at least :standard in the list.
  # Change text values in config/locales/en.yml
  enumerize :kind, in: [:standard, :ms_defense, :phd_proposal, :phd_defense]


  # symbolize :kind, :in => {
  #   :standard => "Standard",
  #   :ms_defense => "MS Defense",
  #   :phd_proposal => "PhD Proposal",
  #   :phd_defense => "PhD Defense"},
  # :scopes => true, :methods => true

  def extended_title
    if kind == :standard
      title
    else
      "#{kind_text}: #{title}"
    end
  end

  def start_end_same_day
    if start_time && end_time && (start_time.to_date != end_time.to_date)
      errors.add(:internal_error, "- start time and end time must be on same day")
    end
  end

  def start_end_not_error
    errors.add(:start_time, "- Invalid start time") if not start_time
    errors.add(:end_time, "- Invalid end time") if not end_time
  end

  def start_less_than_end
    errors.add(:end_time, "- End time must be greater than start time") if (start_time && end_time && (not (end_time > start_time)))
  end

  def at_least_one_list
    errors[:base] << "A talk must belong to at least one list" if lists.length < 1
  end

  def self.upcoming
    # use end_time so talks going on now still appear
    where("end_time >= ?", Time.zone.now)
  end

  # before today
  def self.past
    where("end_time < ? and end_time >= ?", Time.zone.now.beginning_of_day, Time.zone.now - 1.year)
  end

  # today or in the future
  def self.current
    where("end_time >= ?", Time.zone.now.beginning_of_day)
  end

  def self.today
    where("end_time >= ? and start_time < ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
  end

  def self.this_week
    where("end_time >= ? and start_time < ?", (Time.zone.now + 1.day).beginning_of_week - 1.day, (Time.zone.now + 1.day).end_of_week - 1.day)
  end

  def self.all_recent
    where("end_time >= ?", Time.zone.now - 1.year)
  end

  def past?
    end_time < Time.zone.now.beginning_of_day
  end

  def upcoming?
    end_time >= Time.zone.now
  end

  # today or in the future
  def current?
    (end_time >= Time.zone.now.beginning_of_day)
  end

  def today?
    (end_time >= Time.zone.now.beginning_of_day) && (start_time < Time.zone.now.end_of_day)
  end

  def this_week?
    (end_time >= (Time.zone.now + 1.day).beginning_of_week - 1.day) && (start_time < (Time.zone.now + 1.day).end_of_week - 1.day)
  end

  def later_this_week?
    (not past?) && (end_time >= (Time.zone.now + 1.day).beginning_of_week - 1.day) && (start_time < (Time.zone.now + 1.day).end_of_week - 1.day)
  end

  def next_week?
    (end_time >= (Time.zone.now + 1.day).beginning_of_week + 6.day) && (start_time < (Time.zone.now + 1.day).end_of_week + 6.day)
  end

  def further_ahead?
    (end_time >= (Time.zone.now + 1.day).beginning_of_week + 13.day)
  end

  # range may be :all, :today, :this_week, :upcoming, :current
  def match_range(range)
    (range == :all) ||
      (range == :past && past?) ||
      (range == :upcoming && upcoming?) ||
      (range == :current && current?) ||
      (range == :today && today?) ||
      (range == :this_week && this_week?)
  end

  def subscription(user)
    s = Subscription.where(:subscribable_id => id, :subscribable_type => "Talk", :user_id => user.id)
    return nil if s.length == 0
    return s.first if s.length == 1
    logger.error "Multiple subscriptions #{s}"
    return nil
  end

  def owner?(user)
    return owner == user
  end

  def poster?(user)
    return false
  end

  def subscriber?(user)
    s = subscription(user)
    return s && (s.kind == "kind_subscriber")
  end

  def watcher?(user)
    s = subscription(user)
    return s && (s.kind == "kind_watcher")
  end

  def registered?(user)
    not (registrations.where(:user_id => user.id).empty?)
  end

  def through(user)
    h = Hash.new RDL.type_cast([], "Array<List>")
    return h unless user
    user.subscribed_lists.each do |l, kl|
      if l.talks.exists? self.id then
        if kl == "kind_subscriber"
          h[:subscriber] += [l]
        elsif kl == "kind_watcher"
          h[:watcher] += [l]
        end
      end
    end
    return h
  end

  def email_watchers(changes)
    to_email = []
    to_email += subscribers # all direct subscribers
    to_email += RDL.type_cast((lists.map { |l| l.subscribers }).flatten, "Array<User>") # all indirect subscribers

    to_email.uniq.each do |u|
      TheMailer.send_talk_change(u, self, changes).deliver_now
    end
  end

end
