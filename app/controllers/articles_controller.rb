class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all.order(:rank)
    @tracker.track('--', 'Blog view')
  end

  def new
    @user = User.find_by(token: params['token'])

    if @user != nil && @user.admin == true
      @article = Article.new
    else 
      redirect_to articles_path
    end
  end

  def edit
    @user = User.find_by(token: params['token'])

    if @user != nil && @user.admin == true
      @article = Article.find_by(id: params['id'])
    else 
      redirect_to articles_path
    end
  end

  def update
    @user = User.find_by(token: params['token'])
    @article = Article.find_by(id: params['id'])
    @article.update_attributes(restaurant_params)

    redirect_to article_path(id: params['id'])
  end


  def create
    @user = User.find_by(token: params['token'])
    @article = Article.new(restaurant_params)

    if (restaurant_params[:picture].blank? || restaurant_params[:author].blank? || restaurant_params[:model].blank? || restaurant_params[:content].blank? || restaurant_params[:summary].blank? || restaurant_params[:title].blank?) then
      # Eventually add an error message here
      redirect_to articles_path
    else
      @article.user = @user
      @article.save

      redirect_to articles_path
    end
  end

  def show
    options = {
      filter_html:     true,
      hard_wrap:       true, 
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true, 
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    @article = Article.find_by(id: params['id'])

    if @article == nil
      redirect_to articles_path
    else
      @tracker.track(@article.id, 'Blog article viewed', {'title' => @article.title})
      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
      @article.content = markdown.render(@article.content)
    end
  end

  private

  def restaurant_params
    params.require(:article).permit(:author, :content, :model, :summary, :title, :picture, :rank)
  end
end