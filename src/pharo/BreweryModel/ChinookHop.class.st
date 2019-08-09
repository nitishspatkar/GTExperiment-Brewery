Class {
	#name : #ChinookHop,
	#superclass : #Hop,
	#category : #BreweryModel
}

{ #category : #accessing }
ChinookHop >> asElement [
<gtExample>
	| anElement|
	anElement := super asElement background: (Color green muchDarker).
	^ anElement
]
