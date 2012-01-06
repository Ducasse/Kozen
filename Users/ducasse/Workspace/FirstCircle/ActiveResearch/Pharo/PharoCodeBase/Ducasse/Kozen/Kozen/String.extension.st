Extension { #name : #String }

{ #category : #'*kozen' }
String >> deDoubleSingleQuotes [
	"transform two subsequent single quotes into one"
	
	"'abcdebcdg' . 'bc' .'z' ->  'azdezdg' but the same with '' and '"
	
	^ self copyReplaceAll: (String with: $' with: $')  with: (String with: $') 
	
]
