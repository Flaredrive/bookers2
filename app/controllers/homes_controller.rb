class HomesController < ApplicationController
  allow_unauthenticated_access only: [:top, :about]

  def top

  end

  def about
  end

  def forgot
  end

end
