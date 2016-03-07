class ArticlesController < ApplicationController
  
  def index
    @test = "lol"
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    puts '-------'
    puts params
    @article = Article.new(restaurant_params)
    @article.save

    redirect_to articles_path
  end

  private

  def restaurant_params
    params.require(:article).permit(:author, :content)
  end
end