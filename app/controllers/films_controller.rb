require 'mechanize'

class FilmsController < ApplicationController
  def get
  	
  	Film.delete_all
	agent = Mechanize.new
	agent2 = Mechanize.new


	for j in 1..7
	  	page = agent.get('http://www.canalplus.fr/c-grille-tv/pid3248-c-films-du-moment.html?page='+j.to_s())

	  	i=30
	  
	  	while (page.links[i].text().eql?('Page Suivante')==false && page.links[i].text().eql?('Page Précédente')==false)
		    if page.links[i].text().eql?('')==false
		      	if page.links[i].text().eql?('BA')==false
			        if page.links[i].text().eql?('Enregistrement')==false
			          
			          film = agent2.get('http://www.allocine.fr/recherche/?q='+page.links[i].text().split(' ').join("+"))

			          	unless film.links_with(:href => /film/)[1].nil?
				            link = "http://www.allocine.fr"+film.links_with(:href => /film/)[1].uri().to_s
				            film = film.links_with(:href => /film/)[1].click



				            for k in 0..1 
				              	unless (search = film.search(".//span[@class='note']")[k].to_s).nil?
					                tab = search.split('>') unless search.nil?
					                until ( tab[0].nil? || tab[0][0,1].eql?("<")==false)
					                  tab.delete_at(0)
					                end
					                if k==0
					            	  	press = tab[0].split('<')[0].split(',').join('.') unless tab[0].nil?
					            	else 
					              	spectator = tab[0].split('<')[0].split(',').join('.') unless tab[0].nil?
					            	end
				          		end
				        	end

				        	Film.film!(film.title(),press,spectator,link)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	end

  	flash[:success]="Films added!"
  	redirect_to root_path
  end


	def showBestPress
		@films = Film.order("press desc")
	end

	def showBestSpectator
		@films = Film.order("spectator desc")
	end

	def self.getDate
		#return Film.last.updated_at unless Film.nil?
	end
end