require 'mechanize'

class FilmsController < ApplicationController
  def get1
  	
  	Film.delete_all
	agent = Mechanize.new
	agent2 = Mechanize.new
	agent3 = Mechanize.new

	j=1
	
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
		            		senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")


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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get2_path
  end

  def get2
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new


	j=2
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")



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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get3_path
  end

  def get3
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new

	j=3
	
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")



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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get4_path
  end

  def get4
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new

	j=4
	
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")



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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get5_path
  end

  def get5
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new

	j=5
	
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")



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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get6_path
  end

  def get6
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new

	j=6
	
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")


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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to get7_path
  end

  def get7
  	
  	
	agent = Mechanize.new
	agent2 = Mechanize.new

	j=7
	
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
				            senscritique = 'http://www.senscritique.com/recherche?query='+page.links[i].text().split(' ').join("+")



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

				        	Film.film!(film.title(),press,spectator,link,senscritique)

			        
			    		end

			    	end
		  		end
			end
		i=i+1
		end
	

  	flash[:success]="Films 1 added!"
  	redirect_to root_path
  end


	def showBestPress
		@films = Film.order("press desc")
	end

	def showBestSpectator
		@films = Film.order("spectator desc")
	end

	def self.getDate
		return Film.last.updated_at unless Film.nil?
	end
end