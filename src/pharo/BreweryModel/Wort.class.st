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
		ifFalse: [ consistency := 2.5 ]
]

{ #category : #accessing }
Wort >> consistency [
	^ consistency
]
