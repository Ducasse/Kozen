Class {
	#name : #SmartPublicationSite,
	#superclass : #KzMenuInfoBodySite,
	#category : #Kozen
}

{ #category : #subtopics }
SmartPublicationSite >> createResearchSubTopicPages [

	self subtopics 
		do: [ :each | 
			self
				createSubTopic: each first
				title: each second
				text: each third
				bibTag: each fourth.
			each first ].
]

{ #category : #subtopics }
SmartPublicationSite >> createSubTopic: file title: name text: text bibTag: bibTag [
	| page |
	page := KZPage name: 'Research Topics' filename: file.
	self declarePage: page withId: (self subtopicKey: file).
	page addElement: self menu.
	page
		addElementInMain:
			(KZSection new
				title: name;
				levelDigitString: '3';
				text: text;
				yourself).
	page addElementInMain: (bibBuilder collectionBasedOnKozenTag: bibTag).
	^ page
]

{ #category : #subtopics }
SmartPublicationSite >> languageSubTopics [

	^ #(
	
		#('Classbox' 'Scoping class extensions: Classboxes' 
		'Some languages such as Objective-C, Ruby, Python, Smalltalk can define methods in package while their classes is defined in other packages. This allows one to build powerful layers and extend classes. But this poses the questions of the semantics of such constructs. Classboxes is an experimental solution that scope them dynamically and propose a flat view of the world from the extending package perspective.' 
		'*kzClassbox*')
			
		)
]

{ #category : #'custom-points' }
SmartPublicationSite >> site [
	"self site"
	
	self createResearchSubTopicPages.
	super site.
	^ self
	
]

{ #category : #'custom-points-who' }
SmartPublicationSite >> subtopicKey: file [
	^ ('research' , file) asSymbol
]

{ #category : #subtopics }
SmartPublicationSite >> subtopics [

	^ self languageSubTopics
]

{ #category : #elements }
SmartPublicationSite >> welcomePage [
	| welcomePage |
	welcomePage := KZPage  name: self welcomeName filename: 'index'.
	self declarePage: welcomePage withId: #welcomePage.
	welcomePage addElement: self menu.
	welcomePage addElementInMain: self block.
	self buildWelcomePageSectionsOn: welcomePage.
	^ welcomePage
]
