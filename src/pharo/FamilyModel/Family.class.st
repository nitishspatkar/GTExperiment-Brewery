Class {
	#name : #Family,
	#superclass : #Object,
	#instVars : [
		'persons'
	],
	#category : #FamilyModel
}

{ #category : #accessing }
Family >> asElement [
	| m |
	m := GtMondrian new.
	m nodes
		stencil: [ :e | e asElement ];
		with: persons.
	m edges connect: persons toAll: [ :e | e children ].
	m layout tree.
	^ m
]

{ #category : #accessing }
Family >> example [
	<gtExample>
	| man woman child family |
	man := Man new name: 'John'.
	woman := Woman new name: 'Andrea'.
	child := man bang: woman.
	child name: 'Robert'.
	family := Family new.
	family persons
		addAll:
			{man.
			woman.
			child}.
	^ family
]

{ #category : #accessing }
Family >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		priority: 1;
		title: 'Persons';
		stencil: [ self asElement ]
]

{ #category : #accessing }
Family >> initialize [
	super initialize.
	persons := OrderedCollection new
]

{ #category : #accessing }
Family >> persons [
	^ persons
]
