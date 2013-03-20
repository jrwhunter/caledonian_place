class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    if @suggestion.save
      flash[:success] = "Suggestion saved"
      # redirect_to @suggestion
      @suggestions = Suggestion.all
      render 'index'
    else
      render 'new'
    end
  end

  def index
    @suggestions = Suggestion.all
  end

  def destroy
    Suggestion.find(params[:id]).destroy
    flash[:success] = "Suggestion removed."
    #redirect_to users_url
    @suggestions = Suggestion.all
    render 'index'
  end

end
