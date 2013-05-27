class SuggestionsController < ApplicationController

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      flash[:success] = "Suggestion saved"
      render_correct_list(@suggestion.suggestion_type)
    else
      render 'new'
    end
  end

  def book_group
    render_correct_list('book_group')
  end

  def read_only
     render_correct_list('read_only')
  end

  def destroy
    s = Suggestion.find(params[:id])
    s.destroy
    flash[:success] = "Suggestion removed."
    render_correct_list(s.suggestion_type)
  end

  def edit
    @suggestion = Suggestion.find(params[:id])
    render 'edit'
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.update_attributes(params[:suggestion])
      flash[:success] = "Suggestion updated"
      render_correct_list(@suggestion.suggestion_type)
    else
      render 'edit'
    end
  end

  private

  def get_suggestions(s_type)
    if s_type == nil
       return Suggestion.all
    else
      sug = []
      Suggestion.all.each do |s|
        if s.suggestion_type == s_type 
          sug.push(s)
        end
      end
      return sug
    end
  end

  def render_correct_list(s_type)
    if s_type == "book_group"
      @suggestions = get_suggestions('book_group')
      render 'book_group'
    else
      @suggestions = get_suggestions('read_only')
      render 'read_only'
    end 
  end

end
