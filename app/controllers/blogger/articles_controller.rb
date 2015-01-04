require_dependency "blogger/application_controller"

module Blogger
  class ArticlesController < ApplicationController
    before_filter :require_login
    skip_before_filter :require_login, only: [:index, :show]
    layout "blog"
 
    def index
      @articles = Article.order("created_at desc").page(params[:page]).per(10)
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @articles }
      end
    end
  
    def show
      @article = Article.find(params[:id])
      @meta_title = @article.title
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @article }
      end
    end
  
    def new
      @article = Article.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @article }
      end
    end
  
    def edit
      @article = Article.find(params[:id])
    end
  
    def create
      @article = Article.new(article_params)
      @article.author = current_user
  
      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
          format.json { render json: @article, status: :created, location: @article }
        else
          format.html { render action: "new" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      @article = Article.find(params[:id])
  
      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
  
      respond_to do |format|
        format.html { redirect_to articles_url }
        format.json { head :no_content }
      end
    end

    private
    def article_params
      params.require(:article).permit(:author_id, :confirmed, :content, :publish_date, :title, :website)
    end
  end
end
