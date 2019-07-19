Class {
	#name : #Kettle,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
Kettle >> boil: wort with: hopes ofQuantity: aNumberInGm ofType: aName for: duration atTemperature: aNumber [
	| theBoil |
	theBoil := TheBoil new.
	^ theBoil
]
