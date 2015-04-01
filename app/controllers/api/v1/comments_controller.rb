class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  include ApiMethods

  # GET /api/v1/comments.json
  def index
    @comments = Comment.all
    if params[:article_id]
      @comments = @comments.where(article_id: params[:article_id])
    end
  end

  # GET /api/v1/comments/1.json
  def show
  end

  # POST /api/v1/comments.json
  def create

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.json { success }
      else
        format.json { error errors: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { head :no_content }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Note, by default the generator includes all attributes, apart from the following list:
    # [:id, :created_at, :updated_at, :password, :password_confirmation, :salt, :admin, :is_admin, :login]
    def comment_params
      params.permit([:article_id, :content, :name, :email, :website])
    end
end
