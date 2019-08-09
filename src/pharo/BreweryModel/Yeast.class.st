Class {
	#name : #Yeast,
	#superclass : #BrewingIngredient,
	#category : #BreweryModel
}

{ #category : #accessing }
Yeast >> asElement [
	<gtExample>
	^ (BlPolygon
		vertices:
		{(25 @ 2.5).
	(10 @ 50).
	(48 @ 20).
	(2.5 @ 20).
	(40 @ 50)}) asElement
		size: 40 @ 40;
		background: Color transparent;
		outskirts: BlOutskirts outside;
		border: (BlBorder paint: Color darkGray width: 2);
		yourself
]
