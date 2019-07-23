Class {
	#name : #MashTun,
	#superclass : #BrewingEquipment,
	#category : #BreweryModel
}

{ #category : #accessing }
MashTun >> asElement [
	<gtExample>
	| anElement |
	anElement := super asElement
		background: Color blue veryMuchLighter;
		border: (BlBorder paint: Color blue muchLighter width: 1) ;
		when: BlClickEvent do: [self changeColor:anElement.].
		^ anElement
]

{ #category : #accessing }
MashTun >> changeColor [
	| anElement |
	anElement := self asElement.
	anElement background: Color blue.
	self inform: 'Hello'.
]

{ #category : #accessing }
MashTun >> changeColor: anElement [
	anElement background: Color blue.
	self inform: 'Mashing done!'
]

{ #category : #accessing }
MashTun >> mash: grains with: water for: aDuration [
	| wort |
	wort := Wort new.
	self asElement background: Color blue.
	self inform: 'mash: with:'.
	^ wort
]

{ #category : #accessing }
MashTun >> startMashing [
	| grains water |
	grains := Grain new.
	water := Water new.
	self mash: grains with: water for: 5
]
