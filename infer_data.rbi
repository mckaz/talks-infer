# typed: strong
class User
  # RDL Type: () -> String
  sig { returns(String) }
  def name_and_email; end

  # RDL Type: () -> String
  sig { returns(String) }
  def email_and_name; end

  # RDL Type: () -> Array<[List, String]>
  sig { returns(T::Array[T::Array[T.any(List, String)]]) }
  def subscribed_lists; end

  # RDL Type: (([ ==: (:all) -> (false or true) ] and [ ==: (:current) -> (false or true) ] and [ ==: (:past) -> (false or true) ] and [ ==: (:this_week) -> (false or true) ] and [ ==: (:today) -> (false or true) ] and [ ==: (:upcoming) -> (false or true) ] and [ inspect: () -> XXX ]), ?[ member?: (String) -> XXX ]) -> Hash<Talk, String>
  sig { params(range: T.untyped, filter: T.untyped).returns(T::Hash[Talk, String]) }
  def subscribed_talks(range, filter = nil); end
end

class Talk
  # RDL Type: () -> String
  sig { returns(String) }
  def extended_title; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def start_end_same_day; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def start_end_not_error; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def start_less_than_end; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def at_least_one_list; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def past?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def upcoming?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def current?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def today?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def this_week?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def later_this_week?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def next_week?; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def further_ahead?; end

  # RDL Type: (([ ==: (:all) -> (false or true) ] and [ ==: (:current) -> (false or true) ] and [ ==: (:past) -> (false or true) ] and [ ==: (:this_week) -> (false or true) ] and [ ==: (:today) -> (false or true) ] and [ ==: (:upcoming) -> (false or true) ])) -> (false or true)
  sig { params(range: T.untyped).returns(T.any(FalseClass, TrueClass)) }
  def match_range(range); end

  # RDL Type: (User) -> (false or true)
  sig { params(user: User).returns(T.any(FalseClass, TrueClass)) }
  def owner?(user); end

  # RDL Type: (User) -> (false or true)
  sig { params(user: User).returns(T.any(FalseClass, TrueClass)) }
  def poster?(user); end

  # RDL Type: (User) -> (false or true)
  sig { params(user: User).returns(T.any(FalseClass, TrueClass)) }
  def subscriber?(user); end

  # RDL Type: (User) -> (false or true)
  sig { params(user: User).returns(T.any(FalseClass, TrueClass)) }
  def watcher?(user); end

  # RDL Type: (User) -> (false or true)
  sig { params(user: User).returns(T.any(FalseClass, TrueClass)) }
  def registered?(user); end

  # RDL Type: (User) -> { subscriber: Array<(List or XXX)>, watcher: Array<(List or XXX)> }
  sig { params(user: User).returns(T::Hash[Symbol, T::Array[T.untyped]]) }
  def through(user); end

  # RDL Type: (Array<[ name: () -> XXX ]>) -> Array<(User or XXX)>
  sig { params(changes: T::Array[T.untyped]).returns(T::Array[T.untyped]) }
  def email_watchers(changes); end
end

class [s]Talk
  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def upcoming; end

  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def past; end

  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def current; end

  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def today; end

  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def this_week; end
end

class Building
  # RDL Type: () -> String
  sig { returns(String) }
  def abbrv_and_name; end
end

class List
  # RDL Type: (User) -> Subscription
  sig { params(user: User).returns(Subscription) }
  def subscription(user); end

  # RDL Type: (User) -> Array<String>
  sig { params(user: User).returns(T::Array[String]) }
  def owner?(user); end

  # RDL Type: (User) -> Array<String>
  sig { params(user: User).returns(T::Array[String]) }
  def poster?(user); end

  # RDL Type: (User) -> XXX
  sig { params(user: User).returns(T.untyped) }
  def watcher?(user); end

  # RDL Type: (User) -> XXX
  sig { params(user: User).returns(T.untyped) }
  def subscriber?(user); end
end

class AdminController
  # RDL Type: () -> Array<Talk>
  sig { returns(T::Array[Talk]) }
  def index; end

  # RDL Type: () -> Array<Talk>
  sig { returns(T::Array[Talk]) }
  def spam; end

  # RDL Type: () -> String
  sig { returns(String) }
  def send_spam; end
end

class [s]AdminController
  # RDL Type: (([ []: (:message) -> XXX ] and [ []: (:subject) -> XXX ])) -> (false or true)
  sig { params(h: T.untyped).returns(T.any(FalseClass, TrueClass)) }
  def spam_users(h); end
end

class ApplicationController
  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def require_site_admin; end

  # RDL Type: ([ each: () {(XXX) -> XXX} -> XXX ]) -> (false or true)
  sig { params(talks: T.untyped).returns(T.any(FalseClass, TrueClass)) }
  def generate_ical(talks); end

  # RDL Type: (([ []: (:range) -> XXX ] and [ []=: (:range, :current) -> XXX ])) -> Array<String>
  sig { params(params: T.untyped).returns(T::Array[String]) }
  def fix_range(params); end
end

class BuildingsController
  # RDL Type: () -> Array<Building>
  sig { returns(T::Array[Building]) }
  def index; end

  # RDL Type: () -> String
  sig { returns(String) }
  def update; end

  # RDL Type: () -> String
  sig { returns(String) }
  def destroy; end
end

class JobsController
  # RDL Type: () -> Array<Delayed::Backend::ActiveRecord::Job>
  sig { returns(T::Array[Delayed::Backend::ActiveRecord::Job]) }
  def index; end

  # RDL Type: () -> String
  sig { returns(String) }
  def delete; end

  # RDL Type: () -> String
  sig { returns(String) }
  def delete_all; end

  # RDL Type: () -> String
  sig { returns(String) }
  def do_start; end

  # RDL Type: () -> String
  sig { returns(String) }
  def do_stop; end

  # RDL Type: () -> String
  sig { returns(String) }
  def do_restart; end

  # RDL Type: () -> String
  sig { returns(String) }
  def do_reload; end

  # RDL Type: () -> String
  sig { returns(String) }
  def do_status; end

  # RDL Type: (XXX) -> String
  sig { params(cmd: T.untyped).returns(String) }
  def runcmd(cmd); end

  # RDL Type: (XXX) -> (false or true)
  sig { params(s: T.untyped).returns(T.any(FalseClass, TrueClass)) }
  def error(s); end
end

class ListsController
  # RDL Type: () -> Array<List>
  sig { returns(T::Array[List]) }
  def index; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def show; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def new; end

  # RDL Type: () -> ActiveRecord_Relation<User>
  sig { returns(ActiveRecord_Relation[User]) }
  def edit; end

  # RDL Type: () -> ActiveRecord_Relation<User>
  sig { returns(ActiveRecord_Relation[User]) }
  def compute_edit_fields; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def create; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def update; end

  # RDL Type: () -> String
  sig { returns(String) }
  def destroy; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def subscribe; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def feed; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def show_subscribers; end

  # RDL Type: (([ []: (:list) -> XXX ] and [ each_pair: () {(XXX, XXX) -> XXX} -> XXX ])) -> [{ name: String }, Array<XXX>, Array<XXX>]
  sig { params(params: T.untyped).returns(T::Array[T.any(T::Array[T.untyped], T::Hash[Symbol, String])]) }
  def adjust(params); end
end

class TalksController
  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def index; end

  # RDL Type: () -> ActiveRecord_Relation<Talk>
  sig { returns(ActiveRecord_Relation[Talk]) }
  def admin_view; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def new; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def show; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def create; end

  # RDL Type: () -> XXX
  sig { returns(T.untyped) }
  def edit; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def update; end

  # RDL Type: () -> String
  sig { returns(String) }
  def destroy; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def subscribe; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def register; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def show_registrations; end

  # RDL Type: () -> String
  sig { returns(String) }
  def cancel_registration; end

  # RDL Type: () -> (Array<String> or Mail::Message)
  sig { returns(T.any(T::Array[String], Mail::Message)) }
  def external_register; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def cancel_external_registration; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def feed; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def calendar; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def show_subscribers; end

  # RDL Type: () -> Array<List>
  sig { returns(T::Array[List]) }
  def feedback; end

  # RDL Type: () -> String
  sig { returns(String) }
  def receive_feedback; end

  # RDL Type: (([ []: (:talk) -> XXX ] and [ []: (:temp_date) -> XXX ] and [ []: (:temp_date_time) -> XXX ] and [ []: (:temp_end_time) -> XXX ] and [ []: (:temp_start_time) -> XXX ] and [ each_pair: () {(XXX, XXX) -> XXX} -> XXX ] and [ require: (:talk) -> XXX ])) -> [{  }, Array<XXX>]
  sig { params(params: T.untyped).returns(T::Array[T.any(T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
  def adjust(params); end

  # RDL Type: () -> Array<List>
  sig { returns(T::Array[List]) }
  def compute_edit_fields; end
end

class UsersController
  # RDL Type: () -> Array<User>
  sig { returns(T::Array[User]) }
  def index; end

  # RDL Type: () -> Array<Talk>
  sig { returns(T::Array[Talk]) }
  def show; end

  # RDL Type: () -> Array<String>
  sig { returns(T::Array[String]) }
  def edit; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def update; end

  # RDL Type: () -> String
  sig { returns(String) }
  def destroy; end

  # RDL Type: () -> (Array<String> or String)
  sig { returns(T.any(T::Array[String], String)) }
  def feed; end

  # RDL Type: () -> String
  sig { returns(String) }
  def reset_ical_secret; end

  # RDL Type: () -> (false or true)
  sig { returns(T.any(FalseClass, TrueClass)) }
  def generate_ical_secret; end
end

class TheMailer
  # RDL Type: (User, Array<(Talk or XXX)>, String) -> ActionMailer::MessageDelivery
  sig { params(user: User, talks: T::Array[T.untyped], subj: String).returns(ActionMailer::MessageDelivery) }
  def send_talks(user, talks, subj); end

  # RDL Type: ((Registration and [ talk: () -> XXX ])) -> ActionMailer::MessageDelivery
  sig { params(reg: T.untyped).returns(ActionMailer::MessageDelivery) }
  def send_external_reg(reg); end

  # RDL Type: (User, Talk, Array<[ name: () -> XXX ]>) -> ActionMailer::MessageDelivery
  sig { params(user: User, talk: Talk, changes: T::Array[T.untyped]).returns(ActionMailer::MessageDelivery) }
  def send_talk_change(user, talk, changes); end

  # RDL Type: (([ []: (:comments) -> XXX ] and [ []: (:email) -> XXX ] and [ []: (:name) -> XXX ] and [ []: (:subject) -> XXX ])) -> ActionMailer::MessageDelivery
  sig { params(h: T.untyped).returns(ActionMailer::MessageDelivery) }
  def send_feedback(h); end

  # RDL Type: (([ email: () -> XXX ] and [ name: () -> XXX ]), ([ []: (:message) -> XXX ] and [ []: (:subject) -> XXX ])) -> ActionMailer::MessageDelivery
  sig { params(u: T.untyped, h: T.untyped).returns(ActionMailer::MessageDelivery) }
  def send_admin_message(u, h); end
end

module ApplicationHelper
  # RDL Type: (([ []: (Number) -> XXX ] and [ []: (Range<Number>) -> XXX ] and [ length: () -> XXX ])) -> String
  sig { params(a: T.untyped).returns(String) }
  def join_with_and(a); end
end

module TalksHelper
  # RDL Type: (Talk) -> String
  sig { params(talk: Talk).returns(String) }
  def render_speaker(talk); end

  # RDL Type: (Talk) -> String
  sig { params(talk: Talk).returns(String) }
  def render_venue(talk); end

  # RDL Type: (Talk) -> String
  sig { params(talk: Talk).returns(String) }
  def render_time(talk); end

  # RDL Type: (Talk) -> String
  sig { params(talk: Talk).returns(String) }
  def render_lists(talk); end

  # RDL Type: (Array<[ name: () -> XXX ]>) -> String
  sig { params(lists: T::Array[T.untyped]).returns(String) }
  def render_array_of_lists(lists); end

  # RDL Type: ([ each: () {(XXX) -> XXX} -> XXX ]) -> { past: Array<XXX>, today: Array<XXX>, later_this_week: Array<XXX>, next_week: Array<XXX>, beyond: Array<XXX>, now: Time }
  sig { params(talks: T.untyped).returns(T::Hash[Symbol, T.any(T::Array[T.untyped], Time)]) }
  def organize_talks(talks); end

  # RDL Type: ([ strftime: (String) -> XXX ]) -> ActiveRecord_Relation<Talk>
  sig { params(time: T.untyped).returns(ActiveRecord_Relation[Talk]) }
  def format_day(time); end
end
