Class {
	#name : #KzMenuInfoBodySite,
	#superclass : #KZSite,
	#instVars : [
		'bibBuilder'
	],
	#category : #Kozen
}

{ #category : #initialization }
KzMenuInfoBodySite class >> generate [
	"self generate"
	self new generate
]

{ #category : #accessing }
KzMenuInfoBodySite >> block [
	| block |
	block := KZRightBlock new.
	self buildBlockBodyOn: block.
	self declare: block withId: #block.
	^ block
]

{ #category : #block }
KzMenuInfoBodySite >> buildBlockBodyOn: block [
	block addElement: self imageItem.
	block addElement: self inriaBlockItem.
	block addElement: self rmodBlockItem.
	block addElement: self mailToBlockItem
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildMenuBodyOn: menu [
	"Subclasses can change the menu items simply by changing this method"

	menu addElement: self homeMenuItem.
	menu addElement: self pharoMenuItem.
	menu addElement: self coordinatesMenuItem
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildOtherPages [

	
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> buildWelcomePageSectionsOn: welcomePage [
	welcomePage addElementInMain: self sectionCurrentJob.
	welcomePage addElementInMain: self sectionNews.	
	
]

{ #category : #menu }
KzMenuInfoBodySite >> coordinatesMenuItem [
	^ KZMenuItem new
		name: 'Coordinates';
		link: 'Coordinates.html';
		yourself
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> cssFile [
	^ 'CSS/stef.css'
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> currentJobText [

	^ 'I''m ZZZ and I have a lot of fun doing KKK .' 
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> currentSectionTitle [
	^ 'Current Situation'
]

{ #category : #elements }
KzMenuInfoBodySite >> defineInformationOfPage: welcomePage [
	welcomePage title: self title.
	welcomePage cssFile: self cssFile.
	welcomePage headerSiteTitle: self headerSiteTitle.
	
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> headerSiteTitle [

	^ 'Ze great title'
	
]

{ #category : #menu }
KzMenuInfoBodySite >> homeMenuItem [
	^ KZMenuItem new
		name: 'Home';
		link: 'index.html';
		yourself
]

{ #category : #block }
KzMenuInfoBodySite >> imageItem [
	^ KZImage new
		image: self imageName;
		yourself
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> imageName [
	^ 'PictureToBeDisplayedIn128Pixels.jpg'
]

{ #category : #block }
KzMenuInfoBodySite >> inriaBlockItem [
	^ KZBlockItem new
		name: 'INRIA';
		link: 'http://www.inria.fr/';
		yourself
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> mailText [
	^ 'XXXX(@At@)YYYY.HHH'
]

{ #category : #mail }
KzMenuInfoBodySite >> mailToBlockItem [
	^ KZBlockItem new
		name: self mailText;
		link: self mailtoString;
		yourself
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> mailtoString [
	^ 'mailto:real.address@foo.bar'
]

{ #category : #accessing }
KzMenuInfoBodySite >> menu [
	| menu |
	menu := KZMenu new.
	self buildMenuBodyOn: menu.
	self declare: menu withId: #menu.
	^ menu
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> newsSectionTitle [
	^ 'News'
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> newsText [

	^ '<div class="itemizedlist"> 
      <ul type="disc"> 
		<li>I attended <a href="http://www.esug.org/wiki/pier/Conferences/2011"> ESUG 2011</a>. </li>
	 	<li><a href="http://www.pharo-project.org/">Pharo</a> is cool!</li>
	
	  </ul>
    </div>'
]

{ #category : #menu }
KzMenuInfoBodySite >> pharoMenuItem [
	^ KZMenuItem new
		name: 'Pharo';
		link: 'http://www.pharo-project.org';
		yourself
]

{ #category : #block }
KzMenuInfoBodySite >> rmodBlockItem [
	^ KZBlockItem new
		name: 'RMOD';
		link: 'http://rmod.lille.inria.fr/';
		yourself
]

{ #category : #elements }
KzMenuInfoBodySite >> sectionCurrentJob [
	| section |
	section := KZSection new
		title: self currentSectionTitle;
		text: self currentJobText.
	self declare: section withId: #secCurrentJob.
	^ section
]

{ #category : #elements }
KzMenuInfoBodySite >> sectionNews [
	| section |
	section := KZSection new
		title: self newsSectionTitle;
		text: self newsText.
	self declare: section withId: #secNews.
	^ section
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> site [
	"self site"
	
	self welcomePage.
	self buildOtherPages.
	
	^ self.
	
]

{ #category : #'custom-points-who' }
KzMenuInfoBodySite >> title [ 

	^ 'Dr. St&eacute;phane Ducasse' 
]

{ #category : #'custom-points' }
KzMenuInfoBodySite >> welcomeName [
	^ 'Home'
]

{ #category : #elements }
KzMenuInfoBodySite >> welcomePage [
	| welcomePage |
	welcomePage := KZPage new.
	welcomePage name: self welcomeName.
	welcomePage filename: 'index'.
	self defineInformationOfPage: welcomePage.
	self declarePage: welcomePage withId: #welcomePage.
	welcomePage addElement: self menu.
	welcomePage addElementInMain: self block.
	self buildWelcomePageSectionsOn: welcomePage.
	^ welcomePage
]
