asect 0x00
	
	setsp 0xef
	
	while
		ldi r0, 1
		tst r0
	stays nz
		if
			ldi r0, 0xf5
			ld r0, r0
			ldi r1, 0b00000100
			and r0, r1
		is z
			if
				ldi r2, 0xf3
				ld r2, r2
				ldi r1, 120
				cmp r1, r2
			is ls
				ldi r2, 0xf3
				ld r2, r2
				ldi r1, 224
				sub r1, r2
				
				move r0, r1
				ldi r3, 0b00000111
				and r3, r1
				
				ldi r3, 0b00111000
				and r3, r0
				shra r0
				shra r0
				shra r0
				if
					ldi r3, 0b00000100
					and r0, r3
				is nz
					ldi r3, 0b11111000
					or r3, r0
				fi
				
				if
					ldi r3, 1
					cmp r1, r3
				is nz
					if
						ldi r3, 2
						cmp r1, r3
					is z
						shra r2
						ldi r3, 0b01111111
						and r3, r2
					else
						push r0
						
						ldi r0, 0
						shla r1
						while
							cmp r2, r1
						stays hi
							inc r0
							move r1, r3
							sub r2, r3
							move r3, r2
						wend
						
						ldi r3, 2
						sub r2, r3
						
						move r0, r2
						add r2, r2
						
						if
							tst r3
						is pl
							inc r2
						fi
						
						pop r0
					fi
				fi
				
				if 
					ldi r3, 0b00000100
					and r0, r3
				is nz
					ldi r1, -1
				else 
					ldi r1, 1
				fi
				
				push r2
				
				while
					cmp r0, r1
				stays nz
					if 
						ldi r3, 0b00000100
						and r0, r3
					is nz
						dec r1
					else 
						inc r1
					fi
					pop r3
					push r3
					add r3, r2
					if
					is cs
						push r0
						
						ldi r3, carry
						ld r3, r3
						inc r3
						ldi r0, carry
						st r0, r3
						
						pop r0
					fi
				wend
				pop r3
				
				if 
					ldi r3, 0b00000100
					and r0, r3
				is nz
					neg r2
				fi
				
				if
					ldi r3, 0b00000100
					and r0, r3 
				is nz
					ldi r0, 0xf4
					ld r0, r0
					add r0, r2
					
					ldi r3, carry
					ld r3, r3
					
					if
					is cc
						inc r3
					fi
				else
					ldi r0, 0xf4
					ld r0, r0
					add r0, r2
					
					ldi r3, carry
					ld r3, r3
					
					if
					is cs
						inc r3
					fi
				fi
				
				if
					ldi r0, 0b00000001
					and r3, r0
				is nz
					neg r2
				fi
				
				if
					ldi r0, 0xf3
					ld r0, r0
					ldi r1, 112
					cmp r1, r0
				is pl
					if
						ldi r0, 0xf5
						ld r0, r0
						ldi r1, 0b00000100
						and r0, r1
					is z
						ldi r0, 0xf3
						st r0, r2
					fi
				fi
				
				ldi r0, 0
				ldi r1, carry
				st r1, r0
			fi
		fi
		
	wend
	   
	halt

INPUTS>
ENDINPUTS>
carry: ds 1
end