class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contact, :le_projet, :l_association, :le_site, :soutiens]
  def home
  end

  def contact
  end

  def le_projet
  end

  def l_association
  end

  def le_site
  end

  def soutiens
  end

end
