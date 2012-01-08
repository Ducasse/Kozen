"
Generate collection of bibitems based on tags.
"
Class {
	#name : #ARBibCollectionBuilder,
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
ARBibCollectionBuilder class >> forStef [
	"self forStef"
	
	^ self new 
		author: '*Ducasse*';
		loadBib: 'rmod.bib'.
		
		
]

{ #category : #accessing }
ARBibCollectionBuilder >> author [
	"copy from above for now because I hate CZDocument and I do not like the superclass too"
	
	^ author ifNil: [ author := '*Ducasse*']
]

{ #category : #accessing }
ARBibCollectionBuilder >> author: aString [
	"copy from above for now because I hate CZDocument and I do not like the superclass too"
	
	 author := aString
]

{ #category : #operation }
ARBibCollectionBuilder >> collectionBasedOnKozenTag: aTag [

	^ ARBibCollection new elements: (self filterKozenTag: aTag); yourself
	


]

{ #category : #operation }
ARBibCollectionBuilder >> filter: aQuery [
	
	^ (bibset entries select: [ :each | aQuery value: each])
]

{ #category : #operation }
ARBibCollectionBuilder >> filterKozenTag: aTag [

	^ self filter:  (self queryForKozenTag: aTag).
]

{ #category : #initialize }
ARBibCollectionBuilder >> initializeBibSetFromPath: inputFile [
	"self new createBibSetFromPath: 'rmod.bib'"
	
	bibset := originalBibset := CZFileLoader bibFromFileNamed: inputFile.
]

{ #category : #operation }
ARBibCollectionBuilder >> inputFileName:  inputFileString [

	inputFileName := inputFileString
]

{ #category : #operation }
ARBibCollectionBuilder >> loadBib: aString [

	self initializeBibSetFromPath: aString.
	self prepareForAuthor.
	
]

{ #category : #accessing }
ARBibCollectionBuilder >> originalBibset [ 

	^ originalBibset 
]

{ #category : #private }
ARBibCollectionBuilder >> prepareForAuthor [
	
	| qu |
	qu := self withAuthor.
	bibset entries: (originalBibset entries select: [ :each | qu value: each])
]

{ #category : #query }
ARBibCollectionBuilder >> queryForKozenTag: aTag [

	^ CZFieldQuery named: #keywords checks: [ :value | aTag match: value ]
]

{ #category : #query }
ARBibCollectionBuilder >> withAuthor [
	^ CZFieldQuery named: #author checks: [ :value | self author match: value ]
]
