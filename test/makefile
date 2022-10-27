Objects = hello.o
Targets = hello.exe

$(Targets): $(Objects)
	cc -o $@ $(Objects)

.PHONY: clean
clean:
	rm -f $(Targets) *.o
