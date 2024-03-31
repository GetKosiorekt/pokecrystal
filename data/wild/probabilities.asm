MACRO mon_prob
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	table_width 2, GrassMonProbTable
	mon_prob 30,  0 ; 20% chance
	mon_prob 60,  1 ; 20% chance
	mon_prob 80,  2 ; 20% chance
	mon_prob 90,  3 ; 15% chance
	mon_prob 95,  4 ; 15% chance
	mon_prob 99,  5 ;  5% chance
	mon_prob 100, 6 ;  5% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2, WaterMonProbTable
	mon_prob 60,  0 ; 60% chance
	mon_prob 90,  1 ; 30% chance
	mon_prob 100, 2 ; 10% chance
	assert_table_length NUM_WATERMON
