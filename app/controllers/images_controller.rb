class ImagesController < ApplicationController
  before_action :set_article

  def destroy
    @article.image.purge_later
    redirect_to edit_article_path(@article)
  end

  private
  def set_article
    @article = Article.find(params[:article_id])
  end
end
