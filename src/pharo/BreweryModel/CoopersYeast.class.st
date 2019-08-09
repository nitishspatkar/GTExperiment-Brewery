Class {
	#name : #CoopersYeast,
	#superclass : #Yeast,
	#category : #BreweryModel
}

{ #category : #accessing }
CoopersYeast >> asElement [
<gtExample>
	| anElement|
	anElement := super asElement background: Color lightGray muchLighter.
	^ anElement
]
