Class {
	#name : #Wort,
	#superclass : #Product,
	#instVars : [
		'consistency'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Wort >> addGrains: grains [
	^ grains
]

{ #category : #accessing }
Wort >> addWater: water [
	^ water
]

{ #category : #accessing }
Wort >> asElement [
<gtExample>
	^ BlElement new
		geometry: BlRectangle new;
		size: 100 @ 50;
		background: Color brown darker;
		border: (BlBorder paint: Color black width: 1);
		yourself
]

{ #category : #accessing }
Wort >> checkConsistency: aDuration [
	aDuration > 30
		ifTrue: [ consistency := 5 ]
		ifFalse: [ consistency := 2 ].
	^ consistency
]

{ #category : #accessing }
Wort >> consistency [
	^ consistency
]

{ #category : #accessing }
Wort >> consistency: aNumber [
	consistency := aNumber
]

{ #category : #accessing }
Wort >> initialize [
	super initialize.
	consistency := 0
]
