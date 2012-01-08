Class {
	#name : #ARBibHTMLOutputer,
	#superclass : #CZHtmlOutputer,
	#instVars : [
		'fieldOrder'
	],
	#category : #KoCizen
}

{ #category : #accessing }
ARBibHTMLOutputer >> fieldOrder [
	^ fieldOrder
]

{ #category : #accessing }
ARBibHTMLOutputer >> fieldOrder: anObject [
	fieldOrder := anObject
]

{ #category : #initialize }
ARBibHTMLOutputer >> initialize [

	super initialize.
	fieldOrder := #(#author 
			  #title 
			  #journal 
			  #booktitle 
			  #volume 
			  #pages 
			  #publisher  
			  #year 
			  #impactfactor 
			  #rate 
			  #url 
			  #doi)
]

{ #category : #visit }
ARBibHTMLOutputer >> visitEntry: anEntry [
	
	| fields |
	fields := anEntry fieldSortedFollowingKeys: fieldOrder. 
	outputStream 
		nextPutAll: '<li>'.
	fields
		 do: [ :each | each acceptVisitor: self]
		 separatedBy: [outputStream nextPutAll: ', '].
	outputStream nextPut: $. .
	outputStream 
		nextPutAll: '</li>'.
]
