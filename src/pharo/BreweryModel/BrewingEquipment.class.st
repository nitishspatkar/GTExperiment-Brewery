Class {
	#name : #BrewingEquipment,
	#superclass : #Object,
	#instVars : [
		'capacity',
		'ingredients'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
BrewingEquipment >> addIngredients: anIngredient [
	ingredients add: anIngredient
]

{ #category : #accessing }
BrewingEquipment >> asElement [
	<gtExample>
	^ BlElement new
		geometry: BlRectangle new;
		size: 350 @ 100;
		background: Color transparent;
		border: (BlBorder paint: Color black width: 1);
		yourself
]

{ #category : #accessing }
BrewingEquipment >> capacity: aNumber [
	capacity := aNumber
]

{ #category : #accessing }
BrewingEquipment >> cntrlGetCapacity [
	capacity = 20
		ifTrue: [ ^ 700 @ 200 ].
	capacity = 50
		ifTrue: [ ^ 1400 @ 400 ]
]

{ #category : #accessing }
BrewingEquipment >> ingredients [
	^ ingredients
]

{ #category : #accessing }
BrewingEquipment >> initialize [
	ingredients := OrderedCollection new
]
