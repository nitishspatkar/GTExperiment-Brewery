Class {
	#name : #BrewingIngredient,
	#superclass : #Object,
	#instVars : [
		'type',
		'quantity'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
BrewingIngredient >> quantity [
^ quantity
]

{ #category : #accessing }
BrewingIngredient >> quantity: aNumber [
quantity := aNumber
]

{ #category : #accessing }
BrewingIngredient >> type [
^ type
]

{ #category : #accessing }
BrewingIngredient >> type: aName [
type := aName
]
