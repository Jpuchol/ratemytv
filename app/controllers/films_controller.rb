require 'mechanize'



class FilmsController < ApplicationController
  	def get1
  	
		Film.delete_all
		agent = Mechanize.new
		agent2 = Mechanize.new

		j = 1
		page = agent.get('http://www.canalplus.fr/c-cinema/pid6268-les-films-sur-canal.html?page='+j.to_s+'&onglet=1')
		while (page.links[67].text.eql?('Toutes les émissions cinéma')==false) 
		  
		  i=67
		  
		  while (page.links[i].text().eql?('Page Suivante')==false && page.links[i].text().eql?('Page Précédente')==false)
		    infos = page.links[i].text().split("Court métrage")[0]
		                                .split("Film x")[0]
		                                .split("Peplum")[0]
		                                .split("Téléfilm")[0]
		                                .split("Téléfilm d'animation")[0]
		                                .split("Action")[0]
		                                .split("Fantastique")[0]
		                                .split("Film historique")[0]
		                                .split("Science-fiction")[0]
		                                .split("Thriller")[0]
		                                .split("Film d'animation")[0]                                
		                                .split("Aventures")[0]
		                                .split("Film biographique")[0]
		                                .split("Comédie")[0]
		                                .split("Comédie dramatique")[0]
		                                .split("Horreur")[0]
		                                .split("Comédie sentimentale")[0]
		                                .split("Documentaire")[0]
		                                .split("Drame")[0]
		                                .split("Film de guerre")[0]
		                                .split("Western")[0]
		                                .split("NC")




		    film_retrieve = agent2.get('http://www.allocine.fr/recherche/?q='+infos[0])
		    link = 0
		    name = infos[0].strip!
		    if name != nil 
		      infos[0] = name.split(" ").join("+")
		    end
		    
		    
		    
		    while (film_retrieve.links[link] != nil && "".eql?(film_retrieve.links[link].text())==false) 
		      link = link + 1
		    end

		    if (film_retrieve.links[link] == nil) 
		      notePresse = "0"
		      noteSpectateurs = "0"
		      link_allocine = "NC"
		    else 
		      link_allocine = film_retrieve.links[link+1].uri()
		      film_retrieve = film_retrieve.links[link+1].click
		      senscritique = 'http://www.senscritique.com/recherche?query='+infos[0].split(' ').join("+")



		      for k in 0..1 
		        unless (search = film_retrieve.search(".//span[@class='note']")[k].to_s).nil?
		          tab = search.split('>') unless search.nil?
		          until ( tab[0].nil? || tab[0][0,1].eql?("<")==false)
		            tab.delete_at(0)
		          end
		          if k==0
		            notePresse = tab[0].split('<')[0].split(',').join('.') unless tab[0].nil?
		          else 
		            noteSpectateurs = tab[0].split('<')[0].split(',').join('.') unless tab[0].nil?
		          end
		        end
		      end
		      if(name?eql("")==false)
		      	Film.film!(name,notePresse,noteSpectateurs,link_allocine.to_s,senscritique)
		      end
		    end
		    i=i+2
		  end
		  j=j+1
		  page = agent.get('http://www.canalplus.fr/c-cinema/pid6268-les-films-sur-canal.html?page='+i+'&onglet=1')
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
		return Film.last.updated_at unless Film.nil?
	end
end