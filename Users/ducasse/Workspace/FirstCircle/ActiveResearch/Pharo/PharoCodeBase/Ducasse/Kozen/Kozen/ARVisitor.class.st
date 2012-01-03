"
ARVisitor is a web site visitor. 
"
Class {
	#name : #ARVisitor,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Kozen
}

{ #category : #private }
ARVisitor >> addComment: aComment [
	stream 
		nextPutAll: '    <!--'; 
		nextPutAll: aComment; 
		nextPutAll: ' -->'.
	
]

{ #category : #operation }
ARVisitor >> contents [

	^ stream contents
]

{ #category : #private }
ARVisitor >> cr [

	stream nextPut: Character cr
]

{ #category : #private }
ARVisitor >> div [

	self startBalise: 'div'
]

{ #category : #private }
ARVisitor >> endBalise: aString [

	stream nextPut: $< ; nextPut: $/.
	stream nextPutAll: aString.
	stream nextPut: $>. 
	

	
]

{ #category : #private }
ARVisitor >> endBaliseCr: aString [

	self endBalise: aString.
	self cr.
	

	
]

{ #category : #private }
ARVisitor >> endBody [

	self endBalise: 'body'.
]

{ #category : #private }
ARVisitor >> endDiv [

	self endBalise: 'div'
]

{ #category : #operation }
ARVisitor >> ensureAttribute: aKey value: aTag div: aBlock [ 
	"ensureDiv: aBlock key: id tagged: menu ->
		div id='menu'"
		
	self startBalise: 'div' attribute: aKey value: aTag.
	aBlock cull: stream.
	self endDiv.
	self addComment: 'Closing ', aTag.
	self cr
]

{ #category : #operation }
ARVisitor >> ensureBody: aBlock [
	
	self startBalise: 'body'.
	aBlock cull: stream.
	self endBalise: 'body'
]

{ #category : #operation }
ARVisitor >> ensureDiv: aBlock [
	
	self div.
	aBlock value: stream.
	self endDiv
]

{ #category : #private }
ARVisitor >> ensureTag: aString for: aBlock [

	self startBalise: aString.
	aBlock value: stream.
	self endBalise: aString
]

{ #category : #private }
ARVisitor >> href: url name: aString [

	stream 
		nextPutAll: '<a ref="';
		nextPutAll: url;
		nextPutAll: '">';
		nextPutAll: aString;
		nextPutAll: '</a>'
]

{ #category : #initialize }
ARVisitor >> initialize [

	super initialize.
	stream := ReadWriteStream on: (String new: 10000).
]

{ #category : #private }
ARVisitor >> startBalise: aString [

	stream nextPut: $<.
	stream nextPutAll: aString.
	stream nextPut: $>.
	stream nextPut: Character cr.

	
]

{ #category : #private }
ARVisitor >> startBalise:  balise attribute: aKey value: aTag. [
	
	stream 
		nextPut: $<; 
		nextPutAll: balise ; 
		nextPut: Character space ; 
		nextPutAll: aKey ; 
		nextPutAll: '="' ; 
		nextPutAll: aTag; 
		nextPutAll: '">'.
]

{ #category : #private }
ARVisitor >> startBody [

	self startBalise: 'body'.
]

{ #category : #visit }
ARVisitor >> visit: anElement [

	anElement accept: self
]

{ #category : #visit }
ARVisitor >> visitImage: anImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '<a href="'; 
				nextPutAll: anImage link; 
				nextPutAll: '"><img src="'; nextPutAll: anImage image; 
				nextPutAll: '"></a>' ; 
				nextPut: Character cr]
]

{ #category : #visit }
ARVisitor >> visitLinkedImage: aLinkedImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '"<img src="'; nextPutAll: aLinkedImage image; 
				nextPutAll: '">' ; 
				nextPut: Character cr]
]

{ #category : #visit }
ARVisitor >> visitMenu: aMenu [

	self ensureAttribute: 'id' value: 'menu' div: [ 
			self ensureAttribute: 'id' value: 'toc' div: [
				aMenu elements do: [ :each | self visit: each ] separatedBy: [stream cr.]]
			]
	
]

{ #category : #visit }
ARVisitor >> visitMenuItem: aMenuItem [
	
	self ensureAttribute: 'id' value: 'tocItem' div: [
		self href: aMenuItem link name: aMenuItem name
		]
]

{ #category : #visit }
ARVisitor >> visitPage: aPage [

	stream nextPutAll: aPage metaHead.
	stream nextPutAll: aPage head.
	self ensureBody: [
		self ensureAttribute: 'id' value: 'header' div: [ 
				self ensureAttribute: 'id' value: 'headerSideTitle' div: [ 
					stream nextPutAll: aPage headerSiteTitle].
				self ensureAttribute: 'id' value: 'headerPageTitle' div: [ 
					stream nextPutAll: aPage headerPageTitle].
				].
		aPage elements do: [ :each | self visit: each]]
]

{ #category : #visit }
ARVisitor >> visitRightBlock: aBlock [

	self ensureAttribute: 'id' value: 'personalDetails' div: [ 
			aBlock elements do: [ :each | self visit: each ] separatedBy: [stream cr.]]
		
	
]

{ #category : #visit }
ARVisitor >> visitRightBlockItem: anItem [

	

]

{ #category : #visit }
ARVisitor >> visitSite: aSite [

	
]
