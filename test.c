#include <stdio.h>

int main()
{
	int mas[12]={-1,1,-1,1,-1,1,-1,1,-1,1,-1,2};

	int nsum;
	int psum;

	for(int i=0; i<12; i++) {
		if(mas[i]>0)
			psum+=mas[i];
		else
			nsum+=mas[i];
	}

	printf("Sum of positive values: %d\n", psum);
	printf("Sum of negative values: %d\n", nsum);
	printf("7th bit of negative sum: %c\n", (nsum & (1 << 7)) ? '1' : '0');

	return 0;
}
