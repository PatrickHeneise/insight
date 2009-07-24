class TopicsController < ApplicationController
	before_filter :load_forum, :except => 'recent'
	
	def load_forum
		@forum = Forum.find(params[:forum_id])
	end
	
  # GET /topics
  # GET /topics.xml
  def index
		@page = params[:page].to_i
    @topics = Topic.paginate :page => @page, :per_page => 10

		respond_to do |format|
      format.html
      format.js do
        render :update do |page|
          page.replace_html 'topics', :partial => "topics/list"
        end
      end
    end
  end
	
	# GET /topics
  # GET /topics.xml
  def recent
		@page = params[:page].to_i
    @topics = Topic.paginate :page => @page, :per_page => 10

		respond_to do |format|
      format.html
      format.js do
        render :update do |page|
          page.replace_html 'topics', :partial => "topics/list"
        end
      end
    end
  end
	
  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topic = Topic.find(params[:id])
		@page = params[:page].to_i
		if (@page == 0)
			@posts = @topic.posts.paginate :page => :last, :order => 'created_at ASC', :per_page => 10
		else
			@posts = @topic.posts.paginate :page => @page, :order => 'created_at ASC', :per_page => 10
		end
    respond_to do |format|
      format.html do
				update_last_seen_at
				(session[:topics] ||= {})[@topic.id] = Time.now
				@topic.hit! 
			end
      format.js do
        render :update do |page|
          page.replace_html 'posts', :partial => "posts/list"
        end
      end
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
		@post = Post.new(params[:posts])
		@topic.user = current_user
		@topic.forum = @forum
		@post.user = current_user
		@post.topic = @topic
		
    respond_to do |format|
      if @topic.save
				@post.save
        flash[:notice] = 'Topic was successfully created.'
        format.html { redirect_to([@forum, @topic]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        flash[:notice] = 'Topic was successfully updated.'
        format.html { redirect_to(@forum) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = Topic.find(params[:id])
		@forum = @topic.forum
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(@forum) }
    end
  end
end
