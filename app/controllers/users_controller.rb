class UsersController < ApplicationController

  before_filter :generate_ical_secret, :only => [:show, :feed]

  def index
    authorize! :site_admin, :all
    @users = User.all.sort { |a,b| a.email <=> b.email }
  end

  def show
    @user = User.find(params[:id])
    authorize! :edit, @user
    fix_range params
    if params[:range] == :past
      @current = false
    else
      @current = true
    end
    @list_subscriptions = Hash[current_user.subscribed_lists]
    @your_lists = (current_user.owned_lists + current_user.poster_lists + @list_subscriptions.keys).sort { |a,b| a.name <=> b.name }.uniq
    @lists = List.all.sort { |a,b| a.name <=> b.name }
    @talk_subscriptions = current_user.subscribed_talks(params[:range])
    if @current then
      @talks = current_user.owned_talks.current
    else
      @talks = current_user.owned_talks.past
    end
    @talks += RDL.type_cast(@talk_subscriptions.keys, "Array<Talk>")
    @talks.uniq!
    if params[:range] == :past
      @talks.sort! { |a,b| [b.start_time.beginning_of_day, a.start_time] <=> [a.start_time.beginning_of_day, b.start_time] }
    else
      @talks.sort! { |a,b| a.start_time <=> b.start_time }
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize! :edit, @user
  end

  def update
    @user = User.find(params[:id])
    authorize! :edit, @user
    up = user_params
    if up[:password].blank?
      up.delete :password
      up.delete :password_confirmation
    end
    unless can? :site_admin, :all
      up.delete :perm_site_admin
      up.delete :perm_create_talk
    end
    if @user.update(up)
      redirect_to @user
    else
      render :action => "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :site_admin, :all
    @user.destroy
    redirect_to users_path
  end

  # Note that this can't require the user to log in...
  def feed
    user = User.find(params[:id])
    @title = "Your Talks"
    @talks = user.subscribed_talks(:all, ["kind_subscriber", "kind_subscriber_through"]).keys
    respond_to do |format|
      if params[:key] == user.ical_secret
        format.ics { render :text => (generate_ical @talks) }
        format.atom { render "shared/feed", :layout => false  }
      else
        format.ics { render :nothing => true, :status => :forbidden }
        format.atom { render :nothing => true, :status => :forbidden }
      end
    end
  end

  def reset_ical_secret
    @user = User.find(params[:id])
    authorize! :edit, @user
    @user.update_attribute(:ical_secret, nil)
    redirect_to users_path, :notice => "ical secret reset for #{@user.email}"
  end

private

  def generate_ical_secret
    if current_user && (current_user.ical_secret == nil || current_user.ical_secret == "") then
      current_user.update_attribute(:ical_secret, SecureRandom.base64)
    end
    true
  end

  def user_params
    return params.require(:user).permit(:name, :email, :organization,
      :password, :password_confirmation, :opt_email_today,
      :opt_email_this_week, :perm_site_admin, :perm_create_talk)
  end

end
