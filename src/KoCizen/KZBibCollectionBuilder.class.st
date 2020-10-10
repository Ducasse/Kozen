"
A builder to create collection of CZEntries wrapped into a Kozen structure. 
"
Class {
	#name : #KZBibCollectionBuilder,
	#superclass : #CZVisitor,
	#instVars : [
		'bibset',
		'author'
	],
	#category : #'KoCizen-Bib'
}

{ #category : #accessing }
KZBibCollectionBuilder >> author [

	^ author ifNil: [ author := '*Ducasse*']
]

{ #category : #accessing }
KZBibCollectionBuilder >> author: aString [
	"author argument should be in the form: '*Ducasse*' for example."
	 author := aString
]

{ #category : #public }
KZBibCollectionBuilder >> collectionBasedOnKozenTag: aTag [
	"Return a KZ collection holding CZEntries having a given tag"
	
	^ KZBibCollection new elements: (self filterKozenTag: aTag); yourself
	


]

{ #category : #private }
KZBibCollectionBuilder >> filter: aQuery [
	
	^ (bibset entries select: [ :each | aQuery value: each])
]

{ #category : #private }
KZBibCollectionBuilder >> filterKozenTag: aTag [

	^ self filter:  (self queryForKozenTag: aTag).
]

{ #category : #file }
KZBibCollectionBuilder >> initializeBibSetFromPath: inputFile [
	"self new initializeBibSetFromPath: 'rmod.bib'"
	
	bibset  := CZBibParser bibFromFileNamed: inputFile.
]

{ #category : #file }
KZBibCollectionBuilder >> loadBib: aString [

	self initializeBibSetFromPath: aString.
	self prepareForAuthor.
	
]

{ #category : #accessing }
KZBibCollectionBuilder >> originalBibSet: aCZSet [ 
	
	bibset := aCZSet.
	self prepareForAuthor.
]

{ #category : #private }
KZBibCollectionBuilder >> prepareForAuthor [
	
	bibset entries: (bibset entries select: self queryWithAuthor).
	bibset entries: (bibset entries reject:  (CZFieldQuery 
												named: #keywords 
												checks: [ :value | '*insubmission*' match: value ])).
	
]

{ #category : #queries }
KZBibCollectionBuilder >> queryForKozenTag: aTag [

	^ CZFieldQuery named: #keywords checks: [ :value | aTag match: value ]
]

{ #category : #queries }
KZBibCollectionBuilder >> queryWithAuthor [
	^ CZFieldQuery named: #author checks: [ :value | self author match: value ]
]
