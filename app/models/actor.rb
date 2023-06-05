class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    self.shows.each do |show|
      characters = show.characters.where(actor_id: self.id)
      characters.each do |character|
        return "#{character.name} - #{show.name}"
      end
    end
  end
end