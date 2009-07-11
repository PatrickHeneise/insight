class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.xml
  def index
    @department_forums = current_user.department.forums.find(:all, :order => 'position desc')
		@forums = Forum.noninternal current_user.department.id
		@css_class = current_user.department.short.downcase
		
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.xml
  def show
		@page = params[:page].to_i
    @forum = Forum.find(params[:id])
		@topics = @forum.topics.paginate :page => @page, :order => 'replied_at DESC', :per_page => 10
    respond_to do |format|
      format.html do
				(session[:forums] ||= {})[@forum.id] = Time.now
        (session[:forum_page] ||= Hash.new(1))[@forum.id] = params[:page].to_i if params[:page]
			end
      format.js do
        render :update do |page|
          page.replace_html 'topics', :partial => "topics/list"
        end
      end
    end
  end
	
	def subscribe
		@subscription = Subscription.new
		@subscription.forum = Forum.find(params[:id])
		@subscription.user = current_user
		if @subscription.save
			flash[:notice] = 'Subscribed.'
			redirect_to(forums_path)
		else
			flash[:error] = @subscription.errors
			redirect_to(overview_path)
		end
	end
	
	def unsubscribe
		@subscription = current_user.subscriptions.find_by_forum_id params[:id]
		@subscription.destroy
		flash[:notice] = 'Unsubscribed.'
		redirect_to(forums_path)
	end
end
