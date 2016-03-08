class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
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
    @article = Article.new(restaurant_params)
    @article.user = @user
    @article.save

    redirect_to articles_path
  end

  private

  def restaurant_params
    params.require(:article).permit(:author, :content)
  end
end