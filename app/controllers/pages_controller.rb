# frozen_string_literal: true

class PagesController < InheritedResources::Base
  private

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end
end
