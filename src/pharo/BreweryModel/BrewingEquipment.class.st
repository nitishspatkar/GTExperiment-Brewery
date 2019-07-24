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
		size: 200 @ 100;
		background: Color transparent;
		border: (BlBorder paint: Color black width: 1);
		addChild:
			(BlTextElement new
				text: self asRopedText;
				constraintsDo: [ :c | 
					c frame horizontal alignCenter.
					c frame vertical alignCenter ];
				yourself);
		yourself
]

{ #category : #accessing }
BrewingEquipment >> capacity: aNumber [
	capacity := aNumber
]
