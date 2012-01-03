Class {
	#name : #ARSite,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Kozen
}

{ #category : #initialize }
ARSite >> contents [

	^ stream contents
]

{ #category : #initialize }
ARSite >> initialize [

	super initialize.
	stream := ReadWriteStream on: (String new: 10000).
]
