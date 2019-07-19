Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> mash: grains ofQuantity: aNumberInKg with: water ofQuantity: aNumberInLt for: duration atTemperature: aNumber [
	| wort |
	wort := Wort new.
	^ wort
]
