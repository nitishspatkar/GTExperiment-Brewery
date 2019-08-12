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
		when: BlClickEvent do:[ self cntrlAddWater: self];
		yourself
]

{ #category : #accessing }
Water >> cntrlAddWater: water [
	self inform: water asString
]

{ #category : #accessing }
Water >> density [
^ density
]

{ #category : #accessing }
Water >> density: aNumber [
density := aNumber
]
