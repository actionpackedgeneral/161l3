
all: 
	gcc -o prog0.out program0.c -std=c99 -g
	gcc -o prog1.out program1.c -std=c99 -g

clean:
	rm -rf *.out *~

