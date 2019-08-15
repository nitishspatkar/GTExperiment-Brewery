Class {
	#name : #Water,
	#superclass : #BrewingIngredient,
	#instVars : [
		'density'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Water >> asElement [
<gtExample>
	^ BlElement new
		geometry: BlRectangle new;
		background: Color lightBlue;
		border: (BlBorder paint: Color black width: 1);
		yourself
]

{ #category : #accessing }
Water >> density [
^ density
]

{ #category : #accessing }
Water >> density: aNumber [
density := aNumber
]
