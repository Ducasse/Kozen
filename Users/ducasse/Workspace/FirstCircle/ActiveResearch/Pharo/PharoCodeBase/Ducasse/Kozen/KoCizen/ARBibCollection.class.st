"
I'm a wrapper so that I can be put in a site structure but holding items of citezen.
during my visit the visitor can decide to invoke a citezen exporter. 

Not clear at the design level yet.
"
Class {
	#name : #ARBibCollection,
	#superclass : #ARList,
	#category : #KoCizen
}

{ #category : #'as yet unclassified' }
ARBibCollection >> accept: aVisitor [

	aVisitor visitBibItemCollection: self
]

{ #category : #'as yet unclassified' }
ARBibCollection >> elements: aCol [

	elements := aCol
]
