class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      flash[:success] = "Suggestion saved"
      if @suggestion.suggestion_type == "book_group"
        @suggestions = get_suggestions('book_group')
        render 'book_group'
      else
        @suggestions = get_suggestions('read_only')
        render 'read_only'
      end
    else
      render 'new'
    end
  end

  def book_group
    @suggestions = get_suggestions('book_group')
  end

  def read_only
     @suggestions = get_suggestions('read_only')
  end

  def index
    @suggestions = get_suggestions(nil)
  end

  def destroy
    s = Suggestion.find(params[:id])
    s.destroy
    flash[:success] = "Suggestion removed."
    #redirect_to users_url
    if s.suggestion_type == "book_group"
      @suggestions = get_suggestions('book_group')
      render 'book_group'
    else
      @suggestions = get_suggestions('read_only')
      render 'read_only'
    end
  end

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

end
