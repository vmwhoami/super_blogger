class ArticlesController < ApplicationController
#   require 'articles_helper'

    before_action :article_find, only: [:destroy,:edit, :update, :show]

def home
end

def index
	@articles = Article.all
end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to article_path(@article)
        else
        render 'new'
        end 
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article.delete
        flash[:notice] = "Article #{params[:id]}  was successfully deleted"
        redirect_to articles_path
    end


    private

    def article_find
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description)
    end
end
