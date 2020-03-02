class Posts::SearchesController < ApplicationController
  def index
    keywords = params[:keyword].split(/[[:blank:]]+/).select(&:present?)
    negative_keywords, positive_keywords =
    keywords.partition {|keyword| keyword.start_with?("-") }

    @posts = Post

    positive_keywords.each do |keyword|
      @posts = @posts.where("title LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%").order('created_at DESC').page(params[:page]).per(3).all
    end

    negative_keywords.each {|word| word.slice!(/^-/) }

    negative_keywords.each do |keyword|
      next if keyword.blank?
      @posts = @posts.where.not("title LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%").order('created_at DESC').page(params[:page]).per(3).all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
