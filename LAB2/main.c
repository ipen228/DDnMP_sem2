#include <stdio.h>
#include <stdint.h>


// 13. Заменить в одномерном массиве нулевые элементы на значение минимального элемента.


	int32_t mas[] = {10, 4, 0, 9, 1, 17, 2, 5, 0, 0};
	int32_t mas2[] = {5, 1, 0, 3, 0, 47, 2, 1, 12, 10};
	int32_t mas3[] = {0, 4, 0, 9, 1, 17, 2, 5, 5, 0};
	int32_t mas4[] = {52, 1, 0, 3, 0, 7, 2, 1, 2, 10};

	int32_t rezult[10];
	int32_t rezult2[10];
	int32_t rezult3[10];
	int32_t rezult4[10];

	extern void mas_cpy (int32_t* mas_in, int32_t* rezult_out);
	extern void min_find (int32_t* mas_in, int32_t* rezult_out);
    
	int main(void)
	{
     
	        mas_cpy(mas, rezult);
					min_find(mas, rezult);
    
					mas_cpy(mas2, rezult2);
					min_find(mas2, rezult2);
		
					mas_cpy(mas3, rezult3);
					min_find(mas3, rezult3);
		
					mas_cpy(mas4, rezult4);
					min_find(mas4, rezult4);
        
			while(1)
			{

			}
			return 0;
		}			