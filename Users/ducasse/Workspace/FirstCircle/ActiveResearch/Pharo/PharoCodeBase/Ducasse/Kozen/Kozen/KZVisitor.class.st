"
ARVisitor is a web site visitor. 
"
Class {
	#name : #KZVisitor,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #Kozen
}

{ #category : #private }
KZVisitor >> addComment: aComment [
	stream 
		nextPutAll: '    <!--'; 
		nextPutAll: aComment; 
		nextPutAll: ' -->'.
	
]

{ #category : #default }
KZVisitor >> bodyEncodings [
	^ 'body'
]

{ #category : #operation }
KZVisitor >> contents [

	^ stream contents
]

{ #category : #private }
KZVisitor >> cr [

	stream nextPut: Character cr
]

{ #category : #private }
KZVisitor >> div [

	self startBalise: 'div'
]

{ #category : #default }
KZVisitor >> divEncodings [
	^ 'div'
]

{ #category : #private }
KZVisitor >> endBalise: aString [

	stream nextPut: $< ; nextPut: $/.
	stream nextPutAll: aString.
	stream nextPut: $>. 
	

	
]

{ #category : #private }
KZVisitor >> endBaliseCr: aString [

	self endBalise: aString.
	self cr.
	

	
]

{ #category : #private }
KZVisitor >> endBody [

	self endBalise: 'body'.
]

{ #category : #private }
KZVisitor >> endDiv [

	self endBalise: 'div'
]

{ #category : #operation }
KZVisitor >> ensureAttribute: aKey value: aTag div: aBlock [
	"ensureDiv: aBlock key: id tagged: menu ->
		div id='menu'"

	self startBalise: self divEncodings attribute: aKey value: aTag.
	aBlock cull: stream.
	self endDiv.
	self addComment: 'Closing ' , aTag.
	self cr
]

{ #category : #operation }
KZVisitor >> ensureBody: aBlock [
	self startBalise: self bodyEncodings.
	aBlock cull: stream.
	self endBalise: self bodyEncodings
]

{ #category : #operation }
KZVisitor >> ensureDiv: aBlock [
	
	self div.
	aBlock value: stream.
	self endDiv
]

{ #category : #operation }
KZVisitor >> ensureIdValue: aTag div: aBlock [
	"ensureDiv: aBlock key: id tagged: menu ->
		div id='menu'"

	self startBalise: self divEncodings attribute: 'id' value: aTag.
	self cr.
	aBlock cull: stream.
	self endDiv.
	self addComment: 'Closing ' , aTag.
	
]

{ #category : #private }
KZVisitor >> ensureTag: aString for: aBlock [

	self startBalise: aString.
	aBlock value: stream.
	self endBalise: aString
]

{ #category : #default }
KZVisitor >> headerEncodings [
	^ 'header'
]

{ #category : #default }
KZVisitor >> headerPageTitleEncodings [
	^ 'headerPageTitle'
]

{ #category : #default }
KZVisitor >> headerSideTitleEncodings [
	^ 'headerSideTitle'
]

{ #category : #private }
KZVisitor >> href: url name: aString [

	stream 
		nextPutAll: '<a href="';
		nextPutAll: url;
		nextPutAll: '">';
		nextPutAll: aString;
		nextPutAll: '</a>'
]

{ #category : #visit }
KZVisitor >> mainContentEncodings [
	^ 'mainContent'
]

{ #category : #default }
KZVisitor >> menuEncodings [
	^ 'menu'
]

{ #category : #visit }
KZVisitor >> newFileFor: aPage [
	^ FileStream forceNewFileNamed: aPage filename
]

{ #category : #default }
KZVisitor >> personalDetailsEncodings [
	^ 'personalDetails'
]

{ #category : #default }
KZVisitor >> personalDetailsItemEncodings [
	^ 'personalDetailsItem'
]

{ #category : #private }
KZVisitor >> startBalise: aString [

	stream nextPut: $<.
	stream nextPutAll: aString.
	stream nextPut: $>.
	stream nextPut: Character cr.

	
]

{ #category : #private }
KZVisitor >> startBalise:  balise attribute: aKey value: aTag. [
	
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
KZVisitor >> startBody [

	self startBalise: 'body'.
]

{ #category : #default }
KZVisitor >> tocEncodings [
	^ 'toc'
]

{ #category : #default }
KZVisitor >> tocItemEncodings [
	^ 'tocItem'
]

{ #category : #visit }
KZVisitor >> visit: anElement [

	anElement acceptVisitor: self
]

{ #category : #visit }
KZVisitor >> visitBibItemCollection: aBibItemCollection [
	
	self ensureTag: 'ol' for: [:aStream | 
		CZHTMLGenerator new 
			outputStream: aStream;
			visit: (CZSet new addAll: aBibItemCollection elements ; yourself)]
		
]

{ #category : #'visit citezen' }
KZVisitor >> visitBibSet: aCZSet [

	self visitBibItemCollection: aCZSet entries.
]

{ #category : #visit }
KZVisitor >> visitDivBlock: aBlock [

	self
		ensureIdValue: self mainContentEncodings
		div: [ aBlock elements do: [ :each | self visit: each ] separatedBy: [ stream cr ] ]
]

{ #category : #'visit citezen' }
KZVisitor >> visitDoc: aCZDocument [

	aCZDocument elements do: [:each |
			CZHTMLGenerator new 
				outputStream: stream;
				visit: each]
]

{ #category : #visit }
KZVisitor >> visitImage: aLinkedImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '<img src="'; nextPutAll: aLinkedImage image; 
				nextPutAll: '">' ; 
				nextPut: Character cr]
]

{ #category : #visit }
KZVisitor >> visitItem: anItem [

	self ensureTag: 'li' for: [:aStream | 
							aStream 
								nextPutAll: '<a href="'; 
								nextPutAll: anItem link;
								nextPutAll: '">';
								nextPutAll: anItem name].
	stream cr.
]

{ #category : #visit }
KZVisitor >> visitItemList: aList [

	self ensureAttribute: 'class'
			 value: 'itemizedlist'
			 div: [
				self ensureTag: 'ul' for: 
					[ :aStream | aList elements do: [:each | self visit: each ] ] ]
]

{ #category : #visit }
KZVisitor >> visitLinkedImage: anImage [

	self ensureDiv: [ :aStream | 
			aStream 
				nextPutAll: '<a href="'; 
				nextPutAll: anImage link; 
				nextPutAll: '"><img src="'; nextPutAll: anImage image; 
				nextPutAll: '"></a>' ; 
				nextPut: Character cr]
]

{ #category : #visit }
KZVisitor >> visitMenu: aMenu [
	self
		ensureIdValue: self menuEncodings
		div: [ 
			self
				ensureIdValue: self tocEncodings
				div: [ aMenu elements do: [ :each | self visit: each ] 
											separatedBy: [ stream cr ] ] ]
]

{ #category : #visit }
KZVisitor >> visitMenuItem: aMenuItem [
	self ensureIdValue: self tocItemEncodings div: [ self href: aMenuItem link name: aMenuItem name ]
]

{ #category : #visit }
KZVisitor >> visitPage: aPage [
	
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
KZVisitor >> visitRightBlock: aBlock [
	self
		ensureIdValue: self personalDetailsEncodings
		div: [ aBlock elements do: [ :each | self visit: each ] separatedBy: [ stream cr ] ]
]

{ #category : #visit }
KZVisitor >> visitRightBlockItem: anItem [
	self ensureIdValue: self personalDetailsItemEncodings div: [ self href: anItem link name: anItem name ]
]

{ #category : #visit }
KZVisitor >> visitSection: aSection [

	stream
		nextPutAll:  '<h';
		nextPutAll: aSection levelDigitString;
		nextPutAll: '><b><a NAME="';
		nextPutAll: aSection title;
		nextPutAll: '">';
		nextPutAll: aSection title;
		nextPutAll: '</a></b></h';
		nextPutAll: aSection levelDigitString;
		nextPutAll: '>';
		nextPutAll:  aSection text.
]

{ #category : #visit }
KZVisitor >> visitSite: aSite [

	aSite pages do: [:each | self visit: each].
]
