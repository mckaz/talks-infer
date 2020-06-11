## Building model
RDL.orig_type(Building, :abbrv_and_name, "() -> String")

## List model
List.class_eval do
  extend RDL::Annotate
  orig_type(:subscription, "(User) -> Subscription")
  orig_type(:owner?, "(User) -> %bool")
  orig_type(:poster?, "(User) -> %bool")
  orig_type(:watcher?, "(User) -> %bool")
  orig_type(:subscriber?, "(User) -> %bool")
end

Talk.class_eval do
  extend RDL::Annotate
  orig_type(:extended_title, "() -> String")
  orig_type(:start_less_than_end, "() -> Array<String>")
  orig_type(:start_end_not_error, "() -> Array<String>")
  orig_type(:start_end_same_day, "() -> Array<String>")
  orig_type(:at_least_one_list, "() -> Array<String>")
  orig_type('self.current', "() -> ActiveRecord_Relation<Talk>")
  orig_type('self.past', "() -> ActiveRecord_Relation<Talk>")
  orig_type('self.this_week', "() -> ActiveRecord_Relation<Talk>")
  orig_type('self.today', "() -> ActiveRecord_Relation<Talk>")
  orig_type('self.upcoming', "() -> ActiveRecord_Relation<Talk>")
  orig_type(:owner?, "(User) -> %bool")
  orig_type(:today?, "() -> %bool")
  orig_type(:past?, "() -> %bool")
  orig_type(:current?, "() -> %bool")
  orig_type(:upcoming?, "() -> %bool")
  orig_type(:this_week?, "() -> %bool")
  orig_type(:later_this_week?, "() -> %bool")
  orig_type(:next_week?, "() -> %bool")
  orig_type(:further_ahead?, "() -> %bool")
  orig_type(:match_range, "(Symbol) -> %bool")
  orig_type(:registered?, "(User) -> %bool")
  orig_type(:poster?, "(User) -> %bool")
  orig_type(:watcher?, "(User) -> %bool")
  orig_type(:subscriber?, "(User) -> %bool")
  orig_type(:through, "(User) -> :kind_subscriber_through or :kind_watcher_through")
  orig_type(:email_watchers, "(Set<:title or :speaker or :venue or :time or :abstract or :bio or :reg>) -> Array<User>")
end




User.class_eval do
  extend RDL::Annotate
  orig_type(:name_and_email, "() -> String")
  orig_type(:email_and_name, "() -> String")
  orig_type(:subscribed_lists, "() -> Array<Array<List or Symbol>>")
  orig_type(:subscribed_talks, "(Symbol) -> Hash<Talk, String or Symbol>")
end


AdminController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> nil")
  orig_type(:spam, "() -> nil")
  orig_type(:send_spam, "() -> String")
  orig_type('self.spam_users', "(Hash<Symbol, String>) -> %bool")
end


ApplicationController.class_eval do
  extend RDL::Annotate
  orig_type(:fix_range, "(Hash<Symbol or String, %any>) -> Symbol")
  orig_type(:do_subscription, "(List or Talk, String) -> Subscription or %bool")
  orig_type(:generate_ical, "(Array<Talk>) -> RiCal::Component::Calendar")
  orig_type(:require_site_admin, "() -> %any")
end


BuildingsController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> Array<Building>")
  orig_type(:destroy, "() -> String")
  orig_type(:update, "() -> String or Array<String>")

  orig_var_type(:@buildings, "Array<Building>")
end


JobsController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> Array<Delayed::Job>")
  orig_type(:delete, "() -> String")
  orig_type(:delete_all, "() -> String")
  orig_type(:do_start, "() -> String")
  orig_type(:do_stop, "() -> String")
  orig_type(:do_reload, "() -> String")
  orig_type(:do_status, "() -> String")
  orig_type(:do_restart, "() -> String")
  orig_type(:runcmd, "(String) -> String")
  orig_type(:error, "(String) -> FalseClass")

  orig_var_type(:@out, "String")
  orig_var_type(:@success, "%bool")
  orig_var_type(:@job, "Delayed::Job")
  orig_var_type(:@jobs, "Array<Delayed::Job>")
end



ListsController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> Array<List>")
  orig_type(:show, "() -> %any")
  orig_type(:new, "() -> Array<String>")
  orig_type(:edit, "() -> Array<User>")
  orig_type(:create, "() -> String or Array<String>")
  orig_type(:destroy, "() -> String")
  orig_type(:update, "() -> String or Array<String>")
  orig_type(:feed, "() -> Array<String> or String")
  orig_type(:show_subscribers, "() -> Array<String>")
  orig_type(:subscribe, "() -> Array<String> or String")
  orig_type(:compute_edit_fields, "() -> Array<User>")
  orig_type(:adjust, "(Hash<Symbol or String, %any>) -> Array<User>")
 
  orig_var_type(:@current, "%bool")
  orig_var_type(:@upcoming, "%bool")
  orig_var_type(:@list, "List")
  orig_var_type(:@title, "String")
  orig_var_type(:@lists, "Array<List>")
  orig_var_type(:@talks, "Array<Talk>")
  orig_var_type(:@users, "Array<User>")
  orig_var_type(:@subscribers, "Array<User>")
  orig_var_type(:@owners, "Array<User>")
  orig_var_type(:@posters, "Array<User>")
end


TalksController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> Array<Talk>")
  orig_type(:show, "() -> Subscription")
  orig_type(:add_registrations, "() -> String")
  orig_type(:cancel_registration, "() -> String")
  orig_type(:register, "() -> Array<String> or String")
  orig_type(:external_register, "() -> Array<String> or Mail::Message")
  orig_type(:cancel_external_registration, "() -> %bool")
  orig_type(:edit, "() -> Array<List>")
  orig_type(:update, "() -> Array<String> or String")
  orig_type(:calendar, "() -> Array<String> or String")
  orig_type(:create, "() -> Array<String> or String")
  orig_type(:subscribe, "() -> Array<String> or String")
  orig_type(:feed, "() -> Array<String> or String")
  orig_type(:admin_view, "() -> Array<Talk>")
  orig_type(:destroy, "() -> String")
  orig_type(:new, "() -> Array<String>")
  orig_type(:feedback, "() -> Array<List>")
  orig_type(:receive_feedback, "() -> String")
  orig_type(:compute_edit_fields, "() -> Array<List>")
  orig_type(:show_registrations, "() -> Array<User> or Array<String>")
  orig_type(:adjust, "(Hash<Symbol or String, %any>) -> Array<List>")
  orig_type(:show_subscribers, "() -> Array<String>")

  orig_var_type(:@reg, "Registration")
  orig_var_type(:@regs, "Array<Registration>")
  orig_var_type(:@current, "%bool")
  orig_var_type(:@talk, "Talk")
  orig_var_type(:@users, "Array<User>")
  orig_var_type(:@talks, "Array<Talk>")
  orig_var_type(:@talk_old, "Talk")
  orig_var_type(:@title, "String")
  orig_var_type(:@lists, "Array<List>")
  orig_var_type(:@posted, "Array<List>")
  orig_var_type(:@date, "String")
  orig_var_type(:@success, "%bool")
  orig_var_type(:@subscription, "Subscription")
  orig_var_type(:@start_time, "String")
  orig_var_type(:@end_time, "String")
end



UsersController.class_eval do
  extend RDL::Annotate
  orig_type(:index, "() -> Array<User>")
  orig_type(:generate_ical_secret, "() -> TrueClass")
  orig_type(:show, "() -> Array<Talk>")
  orig_type(:edit, "() -> %any")
  orig_type(:feed, "() -> Array<String> or String")
  orig_type(:destroy, "() -> String")
  orig_type(:reset_ical_secret, "() -> String")
  orig_type(:update, "() -> String or Array<String>")

  orig_var_type(:@password, "String")
  orig_var_type(:@title, "String")
  orig_var_type(:@user, "User")
  orig_var_type(:@users, "Array<User>")
  orig_var_type(:@current, "%bool")
  orig_var_type(:@upcoming, "%bool")
  orig_var_type(:@list_subscriptions, "Hash<List, Symbol>")
  orig_var_type(:@your_lists, "Array<List>")
  orig_var_type(:@lists, "Array<List>")
  orig_var_type(:@talk_subscriptions, "Hash<Talk, String or Symbol>")
  orig_var_type(:@talks, "Array<Talk>")
end


ApplicationHelper.class_eval do
  extend RDL::Annotate
  orig_type(:join_with_and, "(Array<String>) -> String")
end


TalksHelper.class_eval do
  extend RDL::Annotate
  orig_type(:render_speaker, "(Talk) -> String")
  orig_type(:render_venue, "(Talk) -> String")
  orig_type(:render_time, "(Talk) -> String")
  orig_type(:render_lists, "(Talk) -> String")
  orig_type(:render_array_of_lists, "(Array<List>) -> String")
  orig_type(:format_day, "(ActiveSupport::TimeWithZone or Date) -> String")
  orig_type(:organize_talks, "(Array<Talk>) -> Hash<:past or :today or :later_this_week or :next_week or :beyond or :now, Array<Talk> or Time or Array<Array<Talk>>>")

  orig_var_type(:@out, "String")
end


TheMailer.class_eval do
  extend RDL::Annotate
  orig_type(:send_talks, "(User, Array<Talk>, String) -> Mail::Message")
  orig_type(:send_admin_message, "(User, Hash<Symbol, String>) -> Mail::Message")
  orig_type(:send_feedback, "(Hash<Symbol, String>) -> Mail::Message")
  orig_type(:send_external_reg, "(Registration) -> Mail::Message")
  orig_type(:send_talk_change, "(User, Talk, Set<:title or :speaker or :venue or :time or :abstract or :bio or :reg>) -> Mail::Message")
  orig_type(:mail, "(Hash<:to or :subject or :from or :content_type or :parts_order or :charset or :delivery_method or :content or :body or :template_name or :template_path, String>) -> Mail::Message")

  orig_var_type(:@user, "User")
  orig_var_type(:@talk, "Talk")
  orig_var_type(:@talks, "Array<Talk>")
  orig_var_type(:@changes, "Set<Symbol>")
  orig_var_type(:@subj, "String")
  orig_var_type(:@comments, "String")
  orig_var_type(:@message, "String")
  orig_var_type(:@reg, "Registration")
end
