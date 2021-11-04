class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  process :resize_to_fit => [200, 200]

  # 保存形式をJPGにする
  process :convert => 'jpg'
  
  # サムネイル生成
  version :thumb do
    process :resize_to_fit => [65, 65]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # 拡張子が同じでないとコンバートできないので、ファイル名を変更
  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end
  
  # ファイル名をランダムで一意とする
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
