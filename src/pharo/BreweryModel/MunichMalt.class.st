Class {
	#name : #MunichMalt,
	#superclass : #Grain,
	#category : #BreweryModel
}

{ #category : #accessing }
MunichMalt >> asElement [
	<gtExample>
	| anElement|
	anElement := super asElement background: Color brown.
	^ anElement
]

{ #category : #accessing }
MunichMalt >> initialize [
	super initialize.
	color := Color lightBrown
]
