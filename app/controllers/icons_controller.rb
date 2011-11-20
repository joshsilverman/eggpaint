class IconsController < ApplicationController

  def load
    Icon.delete_all
    Dir.glob('app/assets/images/icons/*.png') do |rb_file|
      icon = Icon.new
      file_match = /\/([^\/]*)\.png/.match(rb_file)
      icon.filename = "icons#{file_match[0]}"
      icon.term = file_match[1].gsub "-", " "
      icon.save
    end
  end
  
  def list
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      icons = Icon.where("term like ?", like)
    else
      icons = User.all
    end
    list = icons.map {|u| Hash[ id: u.id, label: u.term, name: u.term, filename: u.filename]}
    render json: list
  end
  
  def read
    Icon.find(icon_id).term if icon_id
  end
  
end
