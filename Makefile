# Create a new folder based on Day{n} where n is n+1 of the last folder
# Create a new file called Main.hs
.PHONY: all
all:
	@echo "Creating new folder"
	@echo "Creating new file"
	@mkdir Day$(shell expr $(shell ls -d Day* | wc -l) + 1)
	@echo "module Main where" > Day$(shell expr $(shell ls -d Day* | wc -l) + 1)/Main.hs
	@echo "main = putStrLn \"Hello World\"" >> Day$(shell expr $(shell ls -d Day* | wc -l) + 1)/Main.hs

.PHONY: run
run:
	@echo "Running Day$(shell expr $(shell ls -d Day* | wc -l))"
	@cd Day$(shell expr $(shell ls -d Day* | wc -l)) && runhaskell Main.hs