class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  include ApiMethods

  # GET /api/v1/authors.json
  def index
    @authors = Author.all
  end

  # GET /api/v1/authors/1.json
  def show
  end

  # POST /api/v1/authors.json
  def create

    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.json { success }
      else
        format.json { error errors: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.json { head :no_content }
      else
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Note, by default the generator includes all attributes, apart from the following list:
    # [:id, :created_at, :updated_at, :password, :password_confirmation, :salt, :admin, :is_admin, :login]
    def author_params
      params.permit([:first_name, :surname, :email, :about])
    end
end
