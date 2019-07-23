Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	^ super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1) ;
		yourself
]
