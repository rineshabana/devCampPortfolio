class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skill =Skill.all
  end

  def about
  end

  def contact
  end
end
