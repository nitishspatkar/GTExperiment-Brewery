Class {
	#name : #ViennaMalt,
	#superclass : #Grain,
	#category : #BreweryModel
}

{ #category : #accessing }
ViennaMalt >> asElement [
	<gtExample>
	| anElement|
	anElement := super asElement background: Color brown muchLighter.
	^ anElement
]

{ #category : #accessing }
ViennaMalt >> initialize [
	super initialize.
	color := Color brown
]
