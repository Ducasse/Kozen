"
Generate collection of bibitems based on tags.
"
Class {
	#name : #KZBibCollectionBuilder,
	#superclass : #CZPersonalGenerator,
	#instVars : [
		'dispatchTag',
		'outbibset',
		'bibset',
		'originalBibset',
		'author2'
	],
	#category : #KoCizen
}

{ #category : #examples }
KZBibCollectionBuilder class >> forStef [
	"self forStef"
	
	^ self new 
		author: '*Ducasse*';
		loadBib: 'rmod.bib'.
		
		
]

{ #category : #accessing }
KZBibCollectionBuilder >> author [
	"copy from above for now because I hate CZDocument and I do not like the superclass too"
	
	^ author ifNil: [ author := '*Ducasse*']
]

{ #category : #accessing }
KZBibCollectionBuilder >> author: aString [
	"copy from above for now because I hate CZDocument and I do not like the superclass too"
	
	 author := aString
]

{ #category : #operation }
KZBibCollectionBuilder >> collectionBasedOnKozenTag: aTag [

	^ KZBibCollection new elements: (self filterKozenTag: aTag); yourself
	


]

{ #category : #operation }
KZBibCollectionBuilder >> filter: aQuery [
	
	^ (bibset entries select: [ :each | aQuery value: each])
]

{ #category : #operation }
KZBibCollectionBuilder >> filterKozenTag: aTag [

	^ self filter:  (self queryForKozenTag: aTag).
]

{ #category : #initialize }
KZBibCollectionBuilder >> initializeBibSetFromPath: inputFile [
	"self new createBibSetFromPath: 'rmod.bib'"
	
	bibset := originalBibset := CZFileLoader bibFromFileNamed: inputFile.
]

{ #category : #operation }
KZBibCollectionBuilder >> inputFileName:  inputFileString [

	inputFileName := inputFileString
]

{ #category : #operation }
KZBibCollectionBuilder >> loadBib: aString [

	self initializeBibSetFromPath: aString.
	self prepareForAuthor.
	
]

{ #category : #accessing }
KZBibCollectionBuilder >> originalBibset [ 

	^ originalBibset 
]

{ #category : #private }
KZBibCollectionBuilder >> prepareForAuthor [
	
	bibset entries: (originalBibset entries select: self withAuthor).
	bibset entries: (bibset entries reject:  (CZFieldQuery 
												named: #keywords 
												checks: [ :value | '*insubmission*' match: value ])).
	
]

{ #category : #query }
KZBibCollectionBuilder >> queryForKozenTag: aTag [

	^ CZFieldQuery named: #keywords checks: [ :value | aTag match: value ]
]

{ #category : #query }
KZBibCollectionBuilder >> withAuthor [
	^ CZFieldQuery named: #author checks: [ :value | self author match: value ]
]
