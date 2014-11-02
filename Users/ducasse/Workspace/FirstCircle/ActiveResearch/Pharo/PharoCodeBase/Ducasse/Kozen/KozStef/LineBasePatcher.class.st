"
I'm responsible to expand 

-BASE- into

<base href=""http://sdmeta.gforge.inria.fr/"" />	
	
	
LineBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	fromFile: 'Books.html'  
	toFile: 'Books2.html' ; 
	linesDo3



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

{ #category : #prepare }
LineBasePatcher >> from: inStream to: outStream [

	inputStream := inStream.
	outputStream := outStream
]

{ #category : #prepare }
LineBasePatcher >> fromFile: inputFile toFile: outputFile [
	<precondition: 'inDirectory: was invoked'>
	
	inputStream := (inDirectory / inputFile) readStream.
	outputStream :=  (inDirectory / outputFile) writeStream
]

{ #category : #testing }
LineBasePatcher >> hasEndHead: line [
	
	| re |
	re := '.*</head>.*' asRegexIgnoringCase.
	^ re matchesPrefix: line.
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
LineBasePatcher >> linesDo [

	
	[ inputStream atEnd ] whileFalse: 
		[ | line |
		line := inputStream upTo: Character cr.
		('*-BASE-*' match: line)
			ifTrue: [ outputStream nextPutAll: '<base>http://sdmeta.gforge.inria.fr</base>' ; cr ]
			ifFalse: [ outputStream nextPutAll: line ; cr ].	 
		]
	
]

{ #category : #processing }
LineBasePatcher >> linesDo3 [

	| check |
	check := true. 
	[ inputStream atEnd ] whileFalse: 
		[ | line |
		line := inputStream upTo: Character cr.
		check 
			ifTrue: [ ('*-BASE-*' match: line)
						ifTrue: [ outputStream nextPutAll: '<base>http://sdmeta.gforge.inria.fr</base>' ; cr ]
						ifFalse: [ outputStream nextPutAll: line ; cr ].	 
						].
		(self hasEndHead: line)
			ifTrue: [ check := false].
		check ifFalse: [  
			outputStream nextPutAll: line ; cr ].	 
		]
	
]
