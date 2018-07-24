class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  validates_presence_of :name, on: :update

  def gravatar_image_url
  	"https://www.gravatar.com/avatar/#{gravatar_hash}"
  end

  def display_name
  	if name.present?
  		name
  	else
  		"Author"
  	end
  end

  private

  def gravatar_hash
  	Digest::MD5.hexdigest(email.downcase)
  end

end
