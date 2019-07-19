Class {
	#name : #Filter,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
Filter >> filter: rawBeer for: duration [
	| beer |
	beer := Beer new.
	^ beer
]
