class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
