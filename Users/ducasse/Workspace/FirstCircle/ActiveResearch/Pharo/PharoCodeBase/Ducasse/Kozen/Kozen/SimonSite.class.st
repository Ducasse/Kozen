Class {
	#name : #SimonSite,
	#superclass : #KzMenuInfoBodySite,
	#category : #Kozen
}

{ #category : #'custom-points' }
SimonSite >> buildMenuBodyOn: menu [
	"Subclasses can change the menu items simply by changing this method"

	menu addElement: self homeMenuItem.
	menu addElement: self pharoMenuItem.
	menu addElement: self coordinatesMenuItem
]

{ #category : #'custom-points' }
SimonSite >> buildWelcomePageSectionsOn: welcomePage [
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionNews.	
	
]

{ #category : #'custom-points-who' }
SimonSite >> cssFile [
	^ 'CSS/stef.css'
]

{ #category : #'custom-points-who' }
SimonSite >> currentJobText [

	^ 'I''m post doc in the RMOD Team. I worked on Component Identification using dynamic information.' 
]

{ #category : #'custom-points-who' }
SimonSite >> headerSiteTitle [

	^ 'Simon Allier'
	
]

{ #category : #'custom-points-who' }
SimonSite >> mailText [
	^ 'Simon.Allier(@At@)inria.fr'
]

{ #category : #'custom-points-who' }
SimonSite >> mailtoString [
	^ 'mailto:simon.allier@inria.fr'
]

{ #category : #'custom-points' }
SimonSite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
		<li>My CASCON paper got awarded best student paper 2009.</li>
		<li>I ''m working . </li>
	  </ul>
    </div>'
]

{ #category : #'custom-points-who' }
SimonSite >> title [ 

	^  'Dr. Simon Allier'
]
