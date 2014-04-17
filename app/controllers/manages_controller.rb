class ManagesController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@meme = Meme.new()
  	@meme.image_name = params[:image_name]
    if @meme.save
      upload(params[:picture], params[:image_name])
      redirect_to root_url
    else
      render action: 'new'
    end
  end

private 

  def upload(picture, image_name)
    File.open(Rails.root.join('public', 'uploads', picture.original_filename), 'wb') do |file|
       file.write(picture.read)
    end
    resize_img(picture.original_filename, image_name)
    File.delete(Rails.root.join('public', 'uploads', picture.original_filename))
  end

  def resize_img(img_origin_name, image_name)
      img_path = Rails.root.join("public/uploads/", img_origin_name)
      source = Magick::Image.read(img_path).first
      source.resize_to_fit!(500)
      thumb = source.thumbnail(source.columns*0.4, source.rows*0.4)
      source.write("public/memes/img/" + image_name + "." + source.format)
      thumb.write("public/memes/thumb/" + "thumb_" + image_name + "." + source.format)
  end
end
