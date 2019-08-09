Class {
	#name : #Hop,
	#superclass : #BrewingIngredient,
	#instVars : [
		'flavor'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Hop >> asElement [
<gtExample>
	^ (BlEllipse extent: 40 @ 20) asElement
		background: (Color green);
		border: (BlBorder paint: Color black width: 2);
		yourself
]

{ #category : #accessing }
Hop >> flavor [
	^ flavor
]

{ #category : #accessing }
Hop >> flavor: aString [
	flavor := aString
]
