class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
    @image_path = "http://www.opera-restaurant.fr/images/photos/restaurant/large/RH2014-0083.jpg"
  end

  def new
    @user = User.find_by(token: params['token'])

    if @user != nil && @user.admin == true
      @article = Article.new
    else 
      redirect_to articles_path
    end
  end

  def create
    @user = User.find_by(token: params['token'])

    puts restaurant_params

    @article = Article.new(restaurant_params)

    if (restaurant_params[:author].blank? || restaurant_params[:model].blank? || restaurant_params[:content].blank? || restaurant_params[:summary].blank? || restaurant_params[:title].blank?) then
      # Eventually add an error message here
      redirect_to articles_path
    else
      @article.user = @user
      @article.save

      redirect_to articles_path
    end
  end

  def show
    puts params['id']
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
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    @article.content = markdown.render(@article.content)
  end

  private

  def restaurant_params
    params.require(:article).permit(:author, :content, :model, :summary, :title)
  end
end