
all: hscs Main.a

Main.a: Main.hs
		arm-apple-darwin10-ghc --make -staticlib -o $@ $^ -threaded

hscs:
	hsc2hs -I include IOS/Touch.hsc

clean:
	rm IOS/Touch.hs
	rm *.o *.a *.hi
