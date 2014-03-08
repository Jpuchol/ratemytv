class Film < ActiveRecord::Base
	#validates :link, presence: true, uniqueness: { case_sensitive: false}
	validates :link, presence: true
	validates :name, presence: true

	def exists?(link)
		film = Film.find_by(link: link)
		if film.nil?
			return false
		else
			return true
		end
	end

	def self.film!(name,press,spectator,link,senscritique)
		if(exists?(link)==false) 
			create!(name: name,press: press,spectator: spectator,link: link,senscritique: senscritique)
		end
	end
end
