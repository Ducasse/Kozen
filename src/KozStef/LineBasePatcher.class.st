"
I'm responsible to expand 

-BASE- into

<base href=""http://sdmeta.gforge.inria.fr/"" />	
	
	
LineBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	fromFile: 'Books.html'  
	toFile: 'Books2.html' ; 
	expand



"
Class {
	#name : #LineBasePatcher,
	#superclass : #Object,
	#instVars : [
		'inputStream',
		'outputStream',
		'inDirectory'
	],
	#category : #KozStef
}

{ #category : #processing }
LineBasePatcher >> baseString [
	^ ' <base href="http://sdmeta.gforge.inria.fr/" />'
]

{ #category : #processing }
LineBasePatcher >> expand [

	self optimizeLinesDo 
]

{ #category : #prepare }
LineBasePatcher >> expandAllExpandableFiles [

	self filesToBeExpanded do: [ :each | 
			self fromFile: each basename toFile:  (each base, '.html').
			self expand.
			]
]

{ #category : #files }
LineBasePatcher >> filesToBeExpanded [
	"self new inDirectory: FileSystem workingDirectory;  filesToBeExpanded"
	
	^ self filesWithoutTopics select: [ :each | self hasBaseVariable: (each contents)]
]

{ #category : #files }
LineBasePatcher >> filesWithoutTopics [
	"self new inDirectory: FileSystem workingDirectory;  filesToBeExpanded"
	
	^ self htmlFiles reject: [ :each | each basename beginsWith: 'Topics' ]
]

{ #category : #prepare }
LineBasePatcher >> from: inStream to: outStream [

	inputStream := inStream.
	outputStream := outStream
]

{ #category : #prepare }
LineBasePatcher >> fromFile: inputFileString toFile: outputFileString [
	<precondition: 'inDirectory: was invoked'>
	
	inputStream := (inDirectory / inputFileString) readStream.
	outputStream :=  (inDirectory / outputFileString) writeStream
]

{ #category : #testing }
LineBasePatcher >> hasBaseVariable: string [ 
	
	| re |
	re := '.*-BASE-.*' asRegexIgnoringCase.
	^ re matchesPrefix: string.
]

{ #category : #testing }
LineBasePatcher >> hasEndHead: string [
	
	| re |
	re := '.*</head>.*' asRegexIgnoringCase.
	^ re matchesPrefix: string.
]

{ #category : #files }
LineBasePatcher >> htmlFiles [
	"self new inDirectory: FileSystem workingDirectory;  htmlFiles"
	
	^ inDirectory allChildren select: [ :each | each basename endsWith: 'html' ]
]

{ #category : #prepare }
LineBasePatcher >> inDirectory: aFileDirectory [

	inDirectory := aFileDirectory
]

{ #category : #processing }
LineBasePatcher >> optimizeLinesDo [
	| check |
	check := true.
	[ inputStream atEnd ]
		whileFalse: [ 
			| line |
			line := inputStream upTo: Character cr.
			check
				ifTrue: [ 
					('*-BASE-*' match: line)
						ifTrue: [ 
							outputStream
								nextPutAll: self baseString;
								cr ]
						ifFalse: [ 
							outputStream
								nextPutAll: line;
								cr ] ].
			(self hasEndHead: line)
				ifTrue: [ check := false ].
			check
				ifFalse: [ 
					outputStream
						nextPutAll: line;
						cr ] ]
]

{ #category : #files }
LineBasePatcher >> shtmlFiles [
	"self new inDirectory: FileSystem workingDirectory;  shtmlFiles"
	
	^ inDirectory allChildren select: [ :each | each basename endsWith: 'shtml' ]
]

{ #category : #processing }
LineBasePatcher >> unoptimizedLinesDo [

	
	[ inputStream atEnd ] whileFalse: 
		[ | line |
		line := inputStream upTo: Character cr.
		('*-BASE-*' match: line)
			ifTrue: [ outputStream nextPutAll: '<base>http://sdmeta.gforge.inria.fr</base>' ; cr ]
			ifFalse: [ outputStream nextPutAll: line ; cr ].	 
		]
	
]
