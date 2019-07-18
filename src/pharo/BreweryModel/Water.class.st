Class {
	#name : #Water,
	#superclass : #BrewingIngredient,
	#instVars : [
		'density'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Water >> density [
^ density
]

{ #category : #accessing }
Water >> density: aNumber [
density := aNumber
]
