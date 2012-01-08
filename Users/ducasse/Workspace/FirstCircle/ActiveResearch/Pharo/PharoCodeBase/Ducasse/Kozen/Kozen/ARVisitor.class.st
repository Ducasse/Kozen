"
ARVisitor is a web site visitor. 
"
Class {
	#name : #ARVisitor,
	#superclass : #Object,
	#instVars : [
		'site',
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

{ #category : #default }
ARVisitor >> bodyEncodings [
	^ 'body'
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

{ #category : #default }
ARVisitor >> divEncodings [
	^ 'div'
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

	self startBalise: self divEncodings attribute: aKey value: aTag.
	aBlock cull: stream.
	self endDiv.
	self addComment: 'Closing ' , aTag.
	self cr
]

{ #category : #operation }
ARVisitor >> ensureBody: aBlock [
	self startBalise: self bodyEncodings.
	aBlock cull: stream.
	self endBalise: self bodyEncodings
]

{ #category : #operation }
ARVisitor >> ensureDiv: aBlock [
	
	self div.
	aBlock value: stream.
	self endDiv
]

{ #category : #operation }
ARVisitor >> ensureIdValue: aTag div: aBlock [
	"ensureDiv: aBlock key: id tagged: menu ->
		div id='menu'"

	self startBalise: self divEncodings attribute: 'id' value: aTag.
	self cr.
	aBlock cull: stream.
	self endDiv.
	self addComment: 'Closing ' , aTag.
	
]

{ #category : #private }
ARVisitor >> ensureTag: aString for: aBlock [

	self startBalise: aString.
	aBlock value: stream.
	self endBalise: aString
]

{ #category : #default }
ARVisitor >> headerEncodings [
	^ 'header'
]

{ #category : #default }
ARVisitor >> headerPageTitleEncodings [
	^ 'headerPageTitle'
]

{ #category : #default }
ARVisitor >> headerSideTitleEncodings [
	^ 'headerSideTitle'
]

{ #category : #private }
ARVisitor >> href: url name: aString [

	stream 
		nextPutAll: '<a href="';
		nextPutAll: url;
		nextPutAll: '">';
		nextPutAll: aString;
		nextPutAll: '</a>'
]

{ #category : #visit }
ARVisitor >> mainContentEncodings [
	^ 'mainContent'
]

{ #category : #default }
ARVisitor >> menuEncodings [
	^ 'menu'
]

{ #category : #visit }
ARVisitor >> newFileFor: aPage [
	^ FileStream forceNewFileNamed: aPage filename
]

{ #category : #default }
ARVisitor >> personalDetailsEncodings [
	^ 'personalDetails'
]

{ #category : #default }
ARVisitor >> personalDetailsItemEncodings [
	^ 'personalDetailsItem'
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

{ #category : #default }
ARVisitor >> tocEncodings [
	^ 'toc'
]

{ #category : #default }
ARVisitor >> tocItemEncodings [
	^ 'tocItem'
]

{ #category : #visit }
ARVisitor >> visit: anElement [

	anElement accept: self
]

{ #category : #visit }
ARVisitor >> visitBibItemCollection: aBibItemCollection [
	
	self ensureTag: 'ol' for: [:aStream | 
		ARBibHTMLOutputer  new 
			treatEntries: aBibItemCollection elements in: aStream]
		
]

{ #category : #visit }
ARVisitor >> visitDivBlock: aBlock [

	self
		ensureIdValue: self mainContentEncodings
		div: [ aBlock elements do: [ :each | self visit: each ] separatedBy: [ stream cr ] ]
]

{ #category : #visit }
ARVisitor >> visitImage: aLinkedImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '<img src="'; nextPutAll: aLinkedImage image; 
				nextPutAll: '">' ; 
				nextPut: Character cr]
]

{ #category : #visit }
ARVisitor >> visitItem: anItem [

	self ensureTag: 'li' for: [:aStream | aStream nextPutAll: '<a href="', anItem link, '">', anItem name].
	stream cr.
]

{ #category : #visit }
ARVisitor >> visitItemList: aList [

	self ensureAttribute: 'class'
			 value: 'itemizedlist'
			 div: [
				self ensureTag: 'ul' for: 
					[ :aStream | aList elements do: [:each | self visit: each ] ] ]
]

{ #category : #visit }
ARVisitor >> visitLinkedImage: anImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '<a href="'; 
				nextPutAll: anImage link; 
				nextPutAll: '"><img src="'; nextPutAll: anImage image; 
				nextPutAll: '"></a>' ; 
				nextPut: Character cr]
]

{ #category : #visit }
ARVisitor >> visitMenu: aMenu [
	self
		ensureIdValue: self menuEncodings
		div: [ 
			self
				ensureIdValue: self tocEncodings
				div: [ aMenu elements do: [ :each | self visit: each ] 
										separatedBy: [ stream cr ] ] ]
]

{ #category : #visit }
ARVisitor >> visitMenuItem: aMenuItem [
	self ensureIdValue: self tocItemEncodings div: [ self href: aMenuItem link name: aMenuItem name ]
]

{ #category : #visit }
ARVisitor >> visitPage: aPage [
	
	[stream := self newFileFor: aPage.
	stream nextPutAll: aPage metaHead.
	stream nextPutAll: aPage head.
	self
		ensureBody: [ 
			self
				ensureIdValue: self headerEncodings
				div: [ 
					self ensureIdValue: self headerSideTitleEncodings div: [ stream nextPutAll: aPage headerSiteTitle ].
					self ensureIdValue: self headerPageTitleEncodings div: [ stream nextPutAll: aPage headerPageTitle ]].
			aPage elements do: [ :each | self visit: each ].
			self ensureIdValue: self mainContentEncodings div: [ 
					aPage main elements do: [ :each | self visit: each ]]			
			]]
		ensure: [stream close]
]

{ #category : #visit }
ARVisitor >> visitRightBlock: aBlock [
	self
		ensureIdValue: self personalDetailsEncodings
		div: [ aBlock elements do: [ :each | self visit: each ] separatedBy: [ stream cr ] ]
]

{ #category : #visit }
ARVisitor >> visitRightBlockItem: anItem [
	self ensureIdValue: self personalDetailsItemEncodings div: [ self href: anItem link name: anItem name ]
]

{ #category : #visit }
ARVisitor >> visitSection: aSection [

	stream nextPutAll:  '<h', aSection levelDigitString,'><b><a NAME="', aSection title, '">',  aSection title, '</a></b></h', aSection levelDigitString,'>'.
	stream nextPutAll:  aSection text.
]

{ #category : #visit }
ARVisitor >> visitSite: aSite [

	aSite pages do: [:each | self visit: each].
]
