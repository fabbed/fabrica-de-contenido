class Account::MyAuthorsController < ApplicationController

  def index
    @authors = current_user.authors.activated
  end

end
