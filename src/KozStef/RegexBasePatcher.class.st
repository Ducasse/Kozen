"
RegexBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	fromFile: 'Books.shtml'  
	toFile: 'Books.html' ; 
	expand


RegexBasePatcher new
	inDirectory: FileSystem workingDirectory;  
	expandAllExpandableFiles.

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
