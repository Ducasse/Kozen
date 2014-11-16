"
RegexBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	fromFile: 'Books.html'  
	toFile: 'Books2.html' ; 
	expand

"
Class {
	#name : #RegexBasePatcher,
	#superclass : #LineBasePatcher,
	#category : #KozStef
}

{ #category : #processing }
RegexBasePatcher >> expand [

	outputStream nextPutAll: ( inputStream contents 
									copyWithRegex: '-BASE-' 
									matchesReplacedWith: self baseString)
]
