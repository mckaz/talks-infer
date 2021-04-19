Rails.application.eager_load! ## load Rails app

require 'types/active_record'
require_relative './orig_types'

RDL.load_rails_schema

RDL::Config.instance.promote_widen = true

## user model
RDL.infer User, :name_and_email, time: :later
RDL.infer User, :email_and_name, time: :later
RDL.infer User, :subscribed_lists, time: :later
RDL.infer User, :subscribed_talks, time: :later

## talks model
RDL.infer Talk, :extended_title, time: :later
RDL.infer Talk, :start_end_same_day, time: :later
RDL.infer Talk, :start_end_not_error, time: :later
RDL.infer Talk, :start_less_than_end, time: :later
RDL.infer Talk, :at_least_one_list, time: :later
RDL.infer Talk, 'self.upcoming', time: :later
RDL.infer Talk, 'self.past', time: :later
RDL.infer Talk, 'self.current', time: :later
RDL.infer Talk, 'self.today', time: :later
RDL.infer Talk, 'self.this_week', time: :later
#RDL.infer Talk, 'self.all_recent', time: :later
RDL.infer Talk, :past?, time: :later
RDL.infer Talk, :upcoming?, time: :later
RDL.infer Talk, :current?, time: :later
RDL.infer Talk, :today?, time: :later
RDL.infer Talk, :this_week?, time: :later
RDL.infer Talk, :later_this_week?, time: :later
RDL.infer Talk, :next_week?, time: :later
RDL.infer Talk, :further_ahead?, time: :later
RDL.infer Talk, :match_range, time: :later
#RDL.infer Talk, :subscription, time: :later
RDL.infer Talk, :owner?, time: :later
RDL.infer Talk, :poster?, time: :later
RDL.infer Talk, :subscriber?, time: :later
RDL.infer Talk, :watcher?, time: :later
RDL.infer Talk, :registered?, time: :later
RDL.infer Talk, :through, time: :later
RDL.infer Talk, :email_watchers, time: :later

## ability (not actually model)
#RDL.infer Ability, :initialize, time: :later

## building model
RDL.infer Building, :abbrv_and_name, time: :later

## list model
RDL.infer List, :subscription, time: :later
RDL.infer List, :owner?, time: :later
RDL.infer List, :poster?, time: :later
RDL.infer List, :watcher?, time: :later
RDL.infer List, :subscriber?, time: :later

## AdminController
RDL.infer AdminController, :index, time: :later
RDL.infer AdminController, :spam, time: :later
RDL.infer AdminController, :send_spam, time: :later
RDL.infer AdminController, 'self.spam_users', time: :later

## ApplicationController

RDL.infer ApplicationController, :require_site_admin, time: :later
#RDL.infer ApplicationController, :do_subscription, time: :later ## TODO: handle polymorphic associations
RDL.infer ApplicationController, :generate_ical, time: :later
RDL.infer ApplicationController, :fix_range, time: :later
#RDL.infer ApplicationController, :configure_permitted_parameters, time: :later

## BuildingsController
RDL.infer BuildingsController, :index, time: :later
RDL.infer_var_type BuildingsController, :@buildings
RDL.infer BuildingsController, :update, time: :later
RDL.infer BuildingsController, :destroy, time: :later

## JobsController
RDL.infer JobsController, :index, time: :later
RDL.infer_var_type JobsController, :@jobs
RDL.infer_var_type JobsController, :@job
RDL.infer JobsController, :delete, time: :later
RDL.infer JobsController, :delete_all, time: :later
RDL.infer JobsController, :do_start, time: :later
RDL.infer_var_type JobsController, :@out
RDL.infer JobsController, :do_stop, time: :later
RDL.infer JobsController, :do_restart, time: :later
RDL.infer JobsController, :do_reload, time: :later
RDL.infer JobsController, :do_status, time: :later
RDL.infer JobsController, :runcmd, time: :later
RDL.infer_var_type JobsController, :@success
#RDL.infer_var_type :$?
#RDL.infer JobsController, :note, time: :later
RDL.infer JobsController, :error, time: :later

## ListsController
RDL.infer ListsController, :index, time: :later
RDL.infer_var_type ListsController, :@lists
RDL.infer ListsController, :show, time: :later
RDL.infer_var_type ListsController, :@list
RDL.infer_var_type ListsController, :@talks
RDL.infer_var_type ListsController, :@current
RDL.infer ListsController, :new, time: :later
RDL.infer_var_type ListsController, :@title
RDL.infer_var_type ListsController, :@owners
RDL.infer_var_type ListsController, :@posters
RDL.infer_var_type ListsController, :@users
RDL.infer ListsController, :edit, time: :later
RDL.infer ListsController, :compute_edit_fields, time: :later
RDL.infer ListsController, :create, time: :later
RDL.infer ListsController, :update, time: :later
RDL.infer ListsController, :destroy, time: :later
RDL.infer ListsController, :subscribe, time: :later
RDL.infer ListsController, :feed, time: :later
RDL.infer ListsController, :show_subscribers, time: :later
RDL.infer_var_type ListsController, :@subscribers
RDL.infer ListsController, :adjust, time: :later
RDL.infer ListsController, :compute_edit_fields, time: :later

## TalksController
RDL.infer TalksController, :index, time: :later
RDL.infer_var_type TalksController, :@talks
RDL.infer_var_type TalksController, :@current
RDL.infer_var_type TalksController, :@lists
RDL.infer TalksController, :admin_view, time: :later
RDL.infer TalksController, :new, time: :later
RDL.infer_var_type TalksController, :@talk
RDL.infer_var_type TalksController, :@title
RDL.infer_var_type TalksController, :@posted
RDL.infer TalksController, :show, time: :later
RDL.infer TalksController, :create, time: :later
RDL.infer_var_type TalksController, :@subscription
RDL.infer TalksController, :edit, time: :later
RDL.infer TalksController, :update, time: :later
RDL.infer_var_type TalksController, :@talk_old
RDL.infer TalksController, :destroy, time: :later
RDL.infer TalksController, :subscribe, time: :later
RDL.infer TalksController, :register, time: :later
RDL.infer TalksController, :show_registrations, time: :later
RDL.infer_var_type TalksController, :@regs
RDL.infer_var_type TalksController, :@users
RDL.infer TalksController, :cancel_registration, time: :later
RDL.infer TalksController, :external_register, time: :later
RDL.infer TalksController, :cancel_external_registration, time: :later
RDL.infer_var_type TalksController, :@reg
RDL.infer_var_type TalksController, :@success
RDL.infer TalksController, :feed, time: :later
RDL.infer TalksController, :calendar, time: :later
RDL.infer TalksController, :show_subscribers, time: :later
#RDL.infer_var_type TalksController, :@subscribers
RDL.infer TalksController, :feedback, time: :later
RDL.infer TalksController, :receive_feedback, time: :later
RDL.infer TalksController, :adjust, time: :later
RDL.infer TalksController, :compute_edit_fields, time: :later
RDL.infer_var_type TalksController, :@date
RDL.infer_var_type TalksController, :@start_time
RDL.infer_var_type TalksController, :@end_time


## UsersController
RDL.infer UsersController, :index, time: :later
RDL.infer_var_type UsersController, :@users
RDL.infer UsersController, :show, time: :later
RDL.infer_var_type UsersController, :@user
RDL.infer_var_type UsersController, :@current
RDL.infer_var_type UsersController, :@list_subscriptions
RDL.infer_var_type UsersController, :@your_lists
RDL.infer_var_type UsersController, :@lists
RDL.infer_var_type UsersController, :@talk_subscriptions
RDL.infer_var_type UsersController, :@talks
RDL.infer UsersController, :edit, time: :later
RDL.infer UsersController, :update, time: :later
RDL.infer UsersController, :destroy, time: :later
RDL.infer UsersController, :feed, time: :later
RDL.infer_var_type UsersController, :@title
RDL.infer UsersController, :reset_ical_secret, time: :later
RDL.infer UsersController, :generate_ical_secret, time: :later
#RDL.infer UsersController, :user_params, time: :later


## TheMailer

RDL.infer TheMailer, :send_talks, time: :later
RDL.infer_var_type TheMailer, :@talks
RDL.infer_var_type TheMailer, :@subj
RDL.infer TheMailer, :send_external_reg, time: :later
RDL.infer_var_type TheMailer, :@reg
RDL.infer_var_type TheMailer, :@talk
#RDL.infer TheMailer, :send_cancel_reg, time: :later
RDL.infer TheMailer, :send_talk_change, time: :later
RDL.infer_var_type TheMailer, :@user
RDL.infer_var_type TheMailer, :@changes
RDL.infer TheMailer, :send_feedback, time: :later
RDL.infer_var_type TheMailer, :@comments
RDL.infer TheMailer, :send_admin_message, time: :later
RDL.infer_var_type TheMailer, :@message

## ApplicationHelper
RDL.infer ApplicationHelper, :join_with_and, time: :later

## TalksHelper

RDL.infer TalksHelper, :render_speaker, time: :later
RDL.infer_var_type TalksHelper, :@out
RDL.infer TalksHelper, :render_venue, time: :later
RDL.infer TalksHelper, :render_time, time: :later
RDL.infer TalksHelper, :render_lists, time: :later
RDL.infer TalksHelper, :render_array_of_lists, time: :later
RDL.infer TalksHelper, :organize_talks, time: :later
RDL.infer TalksHelper, :format_day, time: :later



## mixin methods
RDL.type TalksHelper, :link_to, "(String, String) -> String", wrap: false
RDL.type TalksHelper, :list_url, "(List) -> String", wrap: false

## params
RDL.type TalksController, :params, "() -> { id: Integer, do: Symbol, csv: String, name: String, email: String, organization: String, registration: Integer, secret: Integer, comments: String, subject: String, temp_date_time: String, temp_date: String, temp_start_time: String, temp_end_time: String, range: Symbol, talk: { title: String, speaker: String, speaker_affiliation: String, speaker_url: String, room: String, building_id: Integer, kind: String, request_reg: Integer, trigger_watch_email: Integer, owner_id: Integer, abstract: String, bio: String, reg_info: String }}", wrap: false
RDL.type ListsController, :params, "() -> { id: Integer, range: Symbol, do: Symbol, list: { name: String, short_descr: String, long_descr: String, owner_0: Integer, owner_proto: String, poster_0: Integer, poster_proto: String } }", wrap: false
RDL.type UsersController, :params, "() -> { id: Integer, range: Symbol, key: String, user: { name: String, email: String, organization: String, password: String, password_confirmation: String, opt_email_today: %bool, opt_email_this_week: %bool }}", wrap: false



RDL.type Hash, :require, "(Symbol) -> self", wrap: false
RDL.type Hash, :permit, "(*Symbol) -> ``permit_ret(trec, targs)``", wrap: false

def Hash.permit_ret(trec, targs)
  case trec
  when RDL::Type::FiniteHashType
    if targs.all? { |t| t.is_a?(RDL::Type::SingletonType) }
      permitted = targs.map { |t| t.val }
      new_hash = {}
      trec.elts.each_pair { |k, v|
        if v.is_a?(RDL::Type::FiniteHashType)          
          v.elts.each_pair { |k1, v1|
            if permitted.include? k1
              new_hash[k1] = v1
            end
          }
        elsif permitted.include? k
          new_hash[k] = v
        end
        return RDL::Type::FiniteHashType.new(new_hash, nil)
      }
    else
      return trec
    end
  else
    return trec
  end
end

RDL.do_infer :later, num_times: 1

