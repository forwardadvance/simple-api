class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  include ApiMethods

  # GET /api/v1/articles.json
  def index
    @articles = Article.all
    if params[:author_id]
      @articles = @articles.where(author_id: params[:author_id])
    end
  end

  # GET /api/v1/articles/1.json
  def show
  end

  # POST /api/v1/articles.json
  def create

    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.json { success( {resource: @article}) }
      else
        format.json { error errors: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.json { head :no_content }
      else
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Note, by default the generator includes all attributes, apart from the following list:
    # [:id, :created_at, :updated_at, :password, :password_confirmation, :salt, :admin, :is_admin, :login]
    def article_params
      params.permit([:title, :intro, :content, :author_id])
    end
end
