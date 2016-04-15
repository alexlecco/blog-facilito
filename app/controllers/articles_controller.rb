class ArticlesController < ApplicationController
  #before_action :validate_user, except: [:show, :index]
  before_action :authenticate_user!, only: [:create, :new]
  before_action :set_article, except: [:index, :new, :create]

  #GET /articles
  def index
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    #@article = Article.find(params[:id])
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  #POST /articles
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  #PUT /articles/:id
  def update
    # @article.update_attributes({ title: 'Nuevo titulo' })
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def validate_user
    redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end

end
