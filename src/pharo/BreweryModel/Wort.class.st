Class {
	#name : #Wort,
	#superclass : #Product,
	#instVars : [
		'consistency'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Wort >> checkConsistency: aDuration [
	aDuration > 30
		ifTrue: [ consistency := 5 ]
		ifFalse: [ consistency := 2 ].
	self inform: consistency asString.
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
