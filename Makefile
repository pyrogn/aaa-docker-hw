file = ./stress-test.sh

init:
	chmod +x $(file)

spam:
	$(file) > /dev/null 2>&1