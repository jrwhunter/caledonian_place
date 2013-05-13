class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
  end

  def adopt
    s =Suggestion.find(params[:sugg])
    @meeting = Meeting.new
    @meeting.title = s.title
    @meeting.author = s.author
    render 'new'
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    if @meeting.save
      flash[:success] = "Meeting saved"
      if @meeting.date >=  DateTime.now
        @meetings = get_meetings('future')
        render 'future'
      else
        @meetings = get_meetings('past')
        render 'past'
      end
   else
      render 'new'
    end
  end

  def future
    @meetings = get_meetings('future')
  end

  def past
    @meetings = get_meetings('past')
  end


  def destroy
    m = Meeting.find(params[:id])
    m.destroy
    flash[:success] = "Meeting removed."
    if m.date >=  DateTime.now
      @meetings = get_meetings('future')
      render 'future'
    else
      @meetings = get_meetings('past')
      render 'past'
    end
  end

  def edit
    @meeting = Meeting.find(params[:id])
    @meeting.date = @meeting.date.strftime('%A %d %B %Y')
    render 'edit'
  end

 
  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update_attributes(params[:meeting])
      flash[:success] = "Meeting updated"
      if @meeting.date >=  DateTime.now
        @meetings = get_meetings('future')
        render 'future'
      else
        @meetings = get_meetings('past')
        render 'past'
      end
   else
      render 'edit'
    end
  end


  def get_meetings(m_type)
    if m_type == nil
       return Meeting.all
    else 
      meet = []
      if (m_type == "future") 
        Meeting.all.each do |m|
          if m.date >=  DateTime.now
            meet.push(m)
          end
        end
        meet.sort! {|a,b| a.date <=> b.date}
      else
        Meeting.all.each do |m|
          if m.date <  DateTime.now
            meet.push(m)
          end
        end
        meet.sort! {|a,b| b.date <=> a.date}
      end
      return meet
    end
  end

end
