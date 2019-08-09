Class {
	#name : #MagnumHop,
	#superclass : #Hop,
	#category : #BreweryModel
}

{ #category : #accessing }
MagnumHop >> asElement [
<gtExample>
	| anElement|
	anElement := super asElement background: Color green darker.
	^ anElement
]
