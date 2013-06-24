#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#define NUMBER_OF_CARDS 52

int Cards[NUMBER_OF_CARDS] = {
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
		1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
	};

int main()
{
	int i;
	int shuff;
	struct timeval t;

	for (i = 0; i < NUMBER_OF_CARDS; i++) {
		// Get a not got card
		do {
			gettimeofday(&t, NULL);
			srand(t.tv_usec);
			shuff = random() % NUMBER_OF_CARDS;
		} while (Cards[shuff] == 0);

		// Print VHDL code
		printf("card(%d) <= %d\r\n", i, Cards[shuff]);
		Cards[shuff] = 0;
	}

	return 0;
}
