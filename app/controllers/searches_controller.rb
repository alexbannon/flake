class SearchesController < ApplicationController
  def user_search
    user_helper
    @events = Event.all.order("event_time").limit(8)
    @search = params[:user_search]
    @search_events = Event.where("title ILIKE (?)", "%#{@search}%")
    @search_users = User.where("first_name ILIKE (?)", "%#{@search}%") + User.where("last_name ILIKE (?)", "%#{@search}%")
    @search_split = @search.split
    if @search_split.length > 1
      @search_first_last_user = User.where("first_name ILIKE (?)", "%#{@search_split.first}%") && User.where("last_name ILIKE (?)", "%#{@search_split.last}%")
    else
      @search_first_last_user = []
    end
    #output: @search_events, @search_users, @search_first_last_user
  end
end
