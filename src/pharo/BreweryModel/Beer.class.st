Class {
	#name : #Beer,
	#superclass : #Product,
	#instVars : [
		'TFG'
	],
	#category : #BreweryModel
}

{ #category : #accessing }
Beer >> TFG [
^ TFG
]

{ #category : #accessing }
Beer >> TFG: aNUmber [
	TFG := aNUmber
]

{ #category : #accessing }
Beer >> checkTFG: aDuration [
	aDuration > 7
		ifTrue: [ TFG := 1.01 ]
		ifFalse: [ TFG := 1.03 ].
	^ TFG
]
