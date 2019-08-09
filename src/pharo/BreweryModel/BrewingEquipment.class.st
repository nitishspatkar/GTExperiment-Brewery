Class {
	#name : #BrewingEquipment,
	#superclass : #Object,
	#instVars : [
		'capacity'
	],
	#category : #BreweryModel
}

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
		ifTrue: [ ^ 360 @ 100 ].
	capacity = 50
		ifTrue: [ ^ 700 @ 200 ]
]
