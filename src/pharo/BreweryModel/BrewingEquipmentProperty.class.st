Class {
	#name : #BrewingEquipmentProperty,
	#superclass : #Object,
	#instVars : [
		'capacity'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
BrewingEquipmentProperty >> capacity [
^ capacity
]

{ #category : #accessing }
BrewingEquipmentProperty >> capacity: aNumber [
capacity := aNumber
]
