class PostingsController < ApplicationController

  def index
    @postings = get_postings
  end

  def new
   @posting = Posting.new
  end

  def create
    @posting = Posting.new(params[:posting])
    if @posting.save
      flash[:success] = "Posting saved"
      @postings = get_postings
      render 'index'
    else
      render 'new'
    end
  end

  def destroy
    p = Posting.find(params[:id])
    p.destroy
    flash[:success] = "Posting removed."
    @postings = get_postings
    render 'index'
  end

  def edit
    @posting = Posting.find(params[:id])
    render 'edit'
  end

  def update
    @posting = Posting.find(params[:id])
    if @posting.update_attributes(params[:posting])
      flash[:success] = "Posting updated"
      @postings = get_postings
      render 'index'
    else
      render 'edit'
    end
  end

  def get_postings
    post = []
    Posting.all.each do |p|
      post.push(p)
    end
    post.sort! {|a,b| b.updated_at <=> a.updated_at}
    return post
  end

end
