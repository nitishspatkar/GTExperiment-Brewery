Class {
	#name : #FermentisYeast,
	#superclass : #Yeast,
	#category : #BreweryModel
}

{ #category : #accessing }
FermentisYeast >> asElement [
<gtExample>
	| anElement|
	anElement := super asElement background: Color gray.
	^ anElement
]
