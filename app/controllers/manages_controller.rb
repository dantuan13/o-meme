class ManagesController < ApplicationController
  def index
  end

  def new
  end

  def upload
    uploaded_io = params[:picture]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
       file.write(uploaded_io.read)
    end
    resize_img(uploaded_io.original_filename)
    File.delete(Rails.root.join('public', 'uploads', uploaded_io.original_filename))
  redirect_to :action => "new"
  end
  
private 

  def resize_img(img_name)
      img_path = Rails.root.join("public/uploads/", img_name)
      source = Magick::Image.read(img_path).first
      source.resize_to_fit!(500)
      source.write("public/memes/img/" + img_name)
  end
end
